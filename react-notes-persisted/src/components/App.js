import React, { Component } from 'react';
import FolderList from './FolderList';
import NoteList from './NoteList.js';
import Note from './Note.js';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedFolderId: 2,
      selectedNoteId: 3
    };
    this.handleFolderClick = this.handleFolderClick.bind(this);
    this.handleNoteClick = this.handleNoteClick.bind(this);
  }

  handleFolderClick (id) {

    this.setState({selectedFolderId: id});
  }

  handleNoteClick (id) {
    this.setState({selectedNoteId: id});
  }


  render() {
    return (
      <div>
        <FolderList
          selectedFolderId={this.state.selectedFolderId}
          handleFolderClick={this.handleFolderClick}
        />
        <NoteList
          selectedFolderId={this.state.selectedFolderId}
          selectedNoteId={this.state.selectedNoteId}
          handleNoteClick={this.handleNoteClick}
        />
        <Note
          selectedNoteId={this.state.selectedNoteId}
        />
      </div>
    );
  }
}

export default App;
