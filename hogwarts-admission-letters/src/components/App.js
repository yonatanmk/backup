import React, { Component } from 'react';
import InputForm from './InputForm';
import AcceptanceLetter from './AcceptanceLetter';
import RejectionLetter from './RejectionLetter';
import Letter from './Letter';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      accepted: false
    };

    this.handleChange = this.handleChange.bind(this);
    this.accept = this.accept.bind(this);
    this.reject = this.reject.bind(this);
  }

  handleChange(event) {
    let newName = event.target.value;
    if (newName[0]) {
      newName = newName[0].toUpperCase() + newName.slice(1)
    }
    this.setState({ name: newName });
  }

  accept(event) {
    event.preventDefault()
    this.setState({ accepted: true });
  }

  reject(event) {
    event.preventDefault()
    this.setState({ accepted: false });
  }

  render() {

    return (
      <div>
        <InputForm
          handleChange={this.handleChange}
          name={this.state.name}
          accept={this.accept}
          reject={this.reject}
        />
        <Letter name={this.state.name} accepted={this.state.accepted}/>
      </div>
    );
  }
}

export default App;
