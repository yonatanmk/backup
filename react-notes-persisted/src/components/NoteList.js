import React, { Component } from 'react';

class NoteList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      notes: []
    };
  }

  componentDidMount () {
    fetch(`http://localhost:4567/folders/${this.props.selectedFolderId}/notes.json`)
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
        let notes = body.notes;
        this.setState({notes: notes});
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentWillUpdate () {
    fetch(`http://localhost:4567/folders/${this.props.selectedFolderId}/notes.json`)
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
        let notes = body.notes;
        this.setState({notes: notes});
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let notes = this.state.notes.map((note)=>{
      let thisClassName = "noteListElement";
      if (this.props.selectedNoteId == note.id) {
        thisClassName += " selected";
      }

      let handleNoteClick = () => {
        this.props.handleNoteClick(note.id);
      };

      return (
        <div className={thisClassName} onClick={handleNoteClick}>
          <h5>{note.body.substring(0, 20)}</h5>
          <p>{note.updated_at}</p>
        </div>
      );
    });
    if (notes.length == 0) {
      notes = [(
        <div className='noteListElement'>
          <h5>No Notes Present</h5>
        </div>
      )];
    }

    return (
      <div className='small-4 column'>
        {notes}
      </div>
    );
  }
}

export default NoteList;
