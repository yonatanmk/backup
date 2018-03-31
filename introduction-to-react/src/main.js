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
