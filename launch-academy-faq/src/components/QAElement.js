import React, { Component } from 'react';

class QAElement extends Component {
  constructor(props) {
    super(props);
  }

  hiddenAnswer() {
    if (this.props.selected) {
      return (
        <p>{this.props.answer}</p>
      );
    }
  }

  render() {
    return(
      <div>
        <button type="button" onClick={this.props.handleClick}>+</button>
        <h4>{this.props.question}</h4>
        {this.hiddenAnswer()}
      </div>
    );
  }
}


export default QAElement;
