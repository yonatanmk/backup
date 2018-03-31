## Learning Objectives

* Learn what React is and why you should use it.
* Be able to set up a React application.
* Know how to create React elements and insert them into the DOM.
* Understand and use the JSX syntax.

## What is React?

[React][react-home] is a JavaScript library for building user interfaces.

React was developed by [Facebook][facebook] and [Instagram][instagram], and it
has gained popularity as a front-end library for many reasons, including, but
not limited to:

* It is a lightweight library that is easy to set up and use.
* Its API is simple and intuitive.
* It efficiently updates the user interface when needed.
* It encourages separation of concerns and code reuse through composability.
* Its one-way data flow decreases unnecessary complexity in the application logic.
* It scales well in large applications.

Now that we know what React is and why we should use it, let's go ahead and set
it up in one of our applications!

## Following Along

We will add React to an existing application, which has Webpack with Babel
pre-configured. Webpack is a powerful tool that will serve up all your JS files to localhost in the form of a bundle,
while Babel will transpile your ES6 and React code to be compatible with all browsers. Transpilers take code in
one language and convert it to another. Perform the following steps to get started:

* If you have not already done so, install Webpack and the Webpack Dev Server
  globally so you can run the Webpack Dev Server from your terminal:

  ```sh
  $ npm install -g webpack webpack-dev-server
  ```

* Retrieve the application, install NPM packages, and start the Webpack Dev
  Server:

  ```sh
  $ cd ~/challenges
  $ et get introduction-to-react
  $ cd introduction-to-react
  $ npm install
  $ webpack-dev-server
  ```

## Setting Up React and Rendering React Elements

First, we will install the `react` and `react-dom` npm packages:

```sh
$ npm install --save react react-dom
```

Then, in your `main.js` file, add the following code:

```javascript
import React from 'react';
import ReactDOM from 'react-dom';

let headerElement = React.createElement(
  'h1'
);

ReactDOM.render(
  headerElement,
  document.getElementById('app')
);
```

Now, update your `index.html` file to include an HTML element with the id `app`:

```html
...
  <body>
    <div id="app">
      This text will be replaced by ReactDOM
    </div>
    <script src="bundle.js"></script>
  </body>
</html>
```

To make changes in our browser's DOM, we utilize the exports from the `react`
and `react-dom` modules. The imported `React` object contains methods which
allow us to create a Virtual DOM. We then use the methods on the `ReactDOM`
object to render the Virtual DOM and inject those changes into the Browser's DOM.

Let's first take a look at the `createElement` method on the `React` object.

```javascript
let headerElement = React.createElement(
  'h1'
);
```

This method takes a string with the name of a supported HTML tag as its first
argument and returns a `ReactElement` object. The list of tags supported by the
React Framework can be found [here][react-supported-html-elements].

In this example, we are creating a `ReactElement` object representing an `h1`
virtual DOM element. From this point forward, we will refer to a `ReactElement`
representing virtual DOM element as a **ReactDOMElement**.

Now let's take a look that at the `render` method on the `ReactDOM` object.
This method takes a `ReactElement` object as its first argument, and a reference
to a browser's DOM element as its second argument. The method will replace the
children within the Browser DOM element with the DOM equivalent of the
`ReactElement`.

To see this in action, open up your browser to [localhost:8080](localhost:8080)
and hit refresh. You will briefly see the text "This text will be replaced by
ReactDOM", and then the text will disappear. If you open your Chrome developer
tools and inspect the HTML, you will see that the contents of the `div` tag with
the `id` value of `app` have been replaced like so:

```html
...
<div id="app">
  <h1 data-reactroot></h1>
</div>
...
```

The behavior that you see every time the browser is refreshed can be explained
as follows:

1. The original `index.html` is served, and it has a `div` with an `id`
  attribute value set to `app`. This `div` element has a child text node with
  the text "This text will be replaced by ReactDOM".
2. After the `div` is rendered in our browser, a `script` tag, which serves our
  JavaScript, is rendered and, consequently, our JavaScript code executes.
3. Our JavaScript code creates an `h1` ReactDOMElement.
4. Then our JavaScript code calls `ReactDOM.render` with the created `h1`
  ReactDOMElement and a reference to the element whose `id` is `app`. The method
  invocation replaces the text node "This text will be replaced by ReactDOM" in
  the `div` with an `h1`, which is the DOM equivalent of the ReactDOMElement.

**Note:** You can disregard the addition of the `data-reactroot` attribute. This
attribute is used by `ReactDOM`.

This is interesting, but an empty `h1` element is pretty useless without some
text. A child text node can be added to the `h1` element by supplying
`React.createElement` with additional arguments. Let's update our declaration
of the `headerElement` variable:

```javascript
...
let headerElement = React.createElement(
  'h1',
  null,
  'I am a React element! Hear me roar!'
);
...
```

`React.createElement` takes in a optional `props` object as its second argument.
Any additional arguments given will be treated as child elements. We will talk
about `props` shortly, so we will set it to `null` for now.

If we pass in a string as a child element, it will be treated as a child text
node. Now, when we refresh our browser, we will see the original text replaced
with an `h1` element with the text **"I am a React element! Hear me roar!"**.

If we want to add attributes to our rendered `h1` element, we can do it by
passing in a `props` object:

```javascript
...
let headerElement = React.createElement(
  'h1',
  { id: 'special-header', className: 'header' },
  'I am a React element! Hear me roar!'
);
...
```

For a property in the `props` object, if the property name is the same as the
name of a supported HTML attribute, then it will update the HTML attribute in
the DOM. Since `class` is a JavaScript keyword, use `className` to update the
associated HTML class attribute. Another caveat is the `for` JavaScript keyword.
Use `htmlFor`, instead. A list of all the supported HTML attributes can be found
[here][react-supported-html-attributes].

We can also add event listeners via the `props` object. Update the declaration
of the `headerElement` to the following:

```javascript
...
let headerElement = React.createElement(
  'h1',
  { id: 'special-header', className: 'header', onClick: event => alert('Roar!') },
  'I am a React element! Hear me roar!'
);
...
```

For a property in the `props` object, if the property name is the name of a
supported event, then the property value will be used as an event handler, and
the event handler will be invoked when the element triggers the corresponding
event.

Take note that this will not add an HTML event attribute or attach the event
handler to the element itself. Instead, React accomplishes this task through
[event delegation][react-event-delegation].

Also, when the event handler is invoked, it will receive a
[`SyntheticEvent`][react-synthetic-event] object as an argument. This
`SyntheticEvent` has the same interface as the browser's native event object.
A list of all the supported events can be found [here][react-supported-events].

If we click on the rendered `h1` element in our browser now, a pop-up will
appear with the text 'Roar!'.

`ReactDOM.render` renders only one `ReactElement` object on the page when it is
invoked, so how could we render multiple elements to the page?

This can be done by creating a `ReactElement` object that has other
`ReactElement` objects as its children.

Update your `main.js` file as follows:

```javascript
import React from 'react';
import ReactDOM from 'react-dom';

let headerElement = React.createElement(
  'h1',
  { id: 'special-header', className: 'header', onClick: event => alert('Roar!') },
  'I am a React element! Hear me roar!'
);

let firstLiElement = React.createElement(
  'li',
  null,
  'eat'
);

let secondLiElement = React.createElement(
  'li',
  null,
  'sleep'
);

let ulElement = React.createElement(
  'ul',
  null,
  firstLiElement,
  secondLiElement
);

ReactDOM.render(
  ulElement,
  document.getElementById('app')
);
```

Here we are creating two different `li` ReactDOMElements.

Then, we create a `ul` ReactDOMElement whose children are the two `li`
ReactDOMElements.

Finally, we pass this `ul` ReactDOMElement as an argument to `ReactDOM.render`
to render it into the browser. If we check our browser now, we should see a
bullet point with the text "eat" and a bullet point with the text "sleep".

What if we wanted to render both our `h1` virtual element and the `ul` virtual
element with its descendants?

Again, we are only able to render one top-level element, so let's create a `div`
virtual element that is a parent element to both of these elements:

```javascript
import React from 'react';
import ReactDOM from 'react-dom';

let headerElement = React.createElement(
  'h1',
  { id: 'special-header', className: 'header', onClick: event => alert('Roar!') },
  'I am a React element! Hear me roar!'
);

let firstLiElement = React.createElement(
  'li',
  null,
  'eat'
);

let secondLiElement = React.createElement(
  'li',
  null,
  'sleep'
);

let ulElement = React.createElement(
  'ul',
  null,
  firstLiElement,
  secondLiElement
);

let divElement = React.createElement(
  'div',
  null,
  headerElement,
  ulElement
);


ReactDOM.render(
  divElement,
  document.getElementById('app')
);
```

Now we tell `ReactDOM.render` to instead render the `div` virtual element, and
we should see all the virtual elements that we created rendered into the DOM.
We could continue this pattern to build any DOM tree that we desired in
JavaScript. This code is easy to read, however, it is not apparent what the
rendered user interface looks like.

We could rearrange our code to the following:

```javascript
import React from 'react';
import ReactDOM from 'react-dom';

let divElement = React.createElement(
  'div',
  null,
  React.createElement(
    'h1',
    { id: 'special-header', className: 'header', onClick: event => alert('Roar!') },
    'I am a React element! Hear me roar!'
  ),
  React.createElement(
    'ul',
    null,
    React.createElement(
      'li',
      null,
      'eat'
    ),
    React.createElement(
      'li',
      null,
      'sleep'
    )
  )
);

ReactDOM.render(
  divElement,
  document.getElementById('app')
);
```

This code renders the same elements to the browser as before, and it gives us a
better idea of what the rendered user interface will look like. However, this
code is now difficult to read, and as the virtual DOM structure grows, the
readability would worsen.

Luckly, we can use the JSX syntax with React to solve this problem.

## JSX syntax

[JSX][jsx-specification] is a XML-like syntax extension to ECMAScript. Since JSX
is not part of the ES standard, we must transpile JSX code to valid ES code. We
can easily accomplish this transpilation by adding an additional preset to our
Babel setup.

First, download the preset NPM package via:

```sh
npm install --save-dev babel-preset-react
```

Then, update our Babel configuration to use the preset, by changing the
`.babelrc` file:

```
{
  "presets": ["es2015", "react"]
}
```

That's all there is to it.

Now we can rewrite our JavaScript code using JSX syntax:

```javascript
import React from 'react';
import ReactDOM from 'react-dom';

let divElement = <div>
  <h1 id="special-header" className="header" onClick={event => alert('Roar!')}>
    I am a React element! Hear me roar!
  </h1>
  <ul>
    <li>eat</li>
    <li>sleep</li>
  </ul>
</div>;

ReactDOM.render(
  divElement,
  document.getElementById('app')
);
```

The most important concept to realize is that this JSX code transpiles to the
same code that we had before.

If you copy and paste this code into [Babel REPL][babel-repl], you will see that
this is true (with some potential minor differences). Keep in mind that even
though we aren't calling the `React` object anywhere in our code, we must still
import it in order to use the JSX syntax.

You can prove this to yourself by commenting out the first line of `main.js` and
reloading your browser.

Instead of using `React.createElement`, you can now simply write HTML to create
a `ReactElement` object. Passing properties to the elements can be done we add
attributes to a HTML tag.

If you wish to use a JavaScript expression to set a property value, you can
place the expression inside curly brackets (`{}`). Note that **you should not**
use [JavaScript statements and declarations][mdn-statements-and-declarations]
inside the curly brackets when setting property values, since that is not valid
JavaScript syntax.

Take the `if` statement, for example:

```javascript
<div id={ if (true) { 'does not work' } }></div>
```

This code is not valid, because it transpiles to:

```javascript
React.createElement(
  'div',
  { id: if (true) { 'does not work' } }
);
```

Which is not valid object literal syntax.

Lastly, JSX makes it easy to add children elements. Simply add the child
elements within the tags of the parent element.

This code is now both readable and easily conveys the rendered user interface.

One final note: if you ever want to create an element with no children, you can
use a JSX Self Closing Element like so:

```javascript
<div />;
```

This would create a virtual `div` element with no properties or children.

## Summary

React is a JavaScript library that makes it easy to create user interfaces, and
it has become quite popular in the front-end developer community because it
solves many problems with simplicity.

User interfaces are created by first creating a Virtual DOM and then using this
Virtual DOM representation to render equivalent DOM elements in the browser.
`createElement` is a method on the default export object from the `react`
module, and the method is used to create `ReactElement` objects which represent
virtual DOM elements.

We can render DOM elements equivalent to virtual DOM elements into the browser
by using the `render` method on the default export object from the `react-dom`
module.

Furthermore, we can use the JSX syntax with React to write code that is
easy to read and clearly represents the user interface.

## Additional Resources
* [React Documentation][react-documentation]
* [`React.createElement`][react-create-element]
* [Supported HTML elements][react-supported-html-elements]
* [Supported HTML attributes][react-supported-html-attributes]
* [Supported events][react-supported-events]
* [`ReactDOM.render`][react-dom-render]
* [JSX in Depth][react-jsx-in-depth]

[babel-repl]: http://babeljs.io/repl/
[facebook]: https://www.facebook.com/
[instagram]: https://www.instagram.com/
[jsx-specification]: https://facebook.github.io/jsx/
[launch-academy-introduction-to-react]: https://github.com/LaunchAcademy/introduction_to_react
[mdn-statements-and-declarations]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements
[react-home]: https://facebook.github.io/react/
[react-create-element]: https://facebook.github.io/react/docs/top-level-api.html#react.createelement
[react-documentation]: https://facebook.github.io/react/docs/getting-started.html
[react-dom-render]: https://facebook.github.io/react/docs/top-level-api.html#reactdom.render
[react-event-delegation]: https://facebook.github.io/react/docs/interactivity-and-dynamic-uis.html#under-the-hood-autobinding-and-event-delegation
[react-jsx-in-depth]: https://facebook.github.io/react/docs/jsx-in-depth.html
[react-supported-events]: https://facebook.github.io/react/docs/events.html#supported-events
[react-supported-html-attributes]: https://facebook.github.io/react/docs/tags-and-attributes.html#html-attributes
[react-supported-html-elements]: https://facebook.github.io/react/docs/tags-and-attributes.html#html-elements
[react-synthetic-event]: https://facebook.github.io/react/docs/events.html#syntheticevent
