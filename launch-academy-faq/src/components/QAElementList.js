import React, { Component } from 'react';
import QAElement from './QAElement';

class QAElementList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedId: null
    };

    this.handleClick = this.handleClick.bind(this);
  }



  handleClick(id) {
    if (this.state.selectedId == id) {
      this.setState({
        selectedId: null
      });
    }
    else {
      this.setState({
        selectedId: id
      });
    }

  }

  render() {

    let qaList = this.props.data.map(box => {
      let selected = false;
      if (box.id == this.state.selectedId) {
        selected = true;
      }

      let onQAClick = () => this.handleClick(box.id);

      return (
        <QAElement
          key = {box.id}
          question = {box.question}
          answer = {box.answer}
          selected = {selected}
          handleClick = {onQAClick}
        />
      );
    });

    return(
      <div>
        {qaList}
      </div>
    );
  }
}

export default QAElementList;
