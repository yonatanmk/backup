// App.js
import React, { Component } from 'react';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      groceries: []
    };

    this.handleFormSubmit = this.handleFormSubmit.bind(this);
    this.handleButtonClick = this.handleButtonClick.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleFormSubmit(event) {
    event.preventDefault();
    let newGrocery = {
      id: Date.now(),
      name: this.state.name
    };
    let newGroceries = [...this.state.groceries, newGrocery];
    this.setState({
      groceries: newGroceries,
      name: ''
    });
  }

  handleButtonClick(id) {
    let newGroceries = this.state.groceries.filter(grocery => {
      return grocery.id !== id;
    });
    this.setState({ groceries: newGroceries });
  }

  handleChange(event) {
    let newName = event.target.value;
    this.setState({ name: newName });
  }

  render() {
    console.log("App's state name value: ", this.state.name);
    return(
      <div>
        <h1>Grocery List React</h1>
        <GroceryForm
          handleFormSubmit={this.handleFormSubmit}
          handleChange={this.handleChange}
          name={this.state.name}
        />
        <GroceryList
          groceries={this.state.groceries}
          handleButtonClick={this.handleButtonClick}
        />
      </div>
    );
  }
}

export default App;
