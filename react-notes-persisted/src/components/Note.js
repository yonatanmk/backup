import React, { Component } from 'react';

class Note extends Component {
  constructor(props) {
    super(props);
    this.state = {
      note: {}
    };
  }

  componentWillUpdate () {
    fetch(`http://localhost:4567/notes/${this.props.selectedNoteId}/note.json`)
      .then(response => {
        if (response.ok) {
          return response;
        }
        else {
          //error code
        }
      })
      .then(response => response.json())
      .then(body => {
        let note = body.note;
        this.setState({note: note});
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount () {
    fetch(`http://localhost:4567/notes/${this.props.selectedNoteId}/note.json`)
      .then(response => {
        if (response.ok) {
          return response;
        }
        else {
          //error code
        }
      })
      .then(response => response.json())
      .then(body => {
        let note = body.note;
        this.setState({note: note});
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return (
      <div>
      <p>{this.state.note.body}</p>
      </div>
    );
  }
}

export default Note;
