import React, { Component } from 'react';


class FolderList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      folders: []
    };
  }

  componentDidMount () {
    fetch('http://localhost:4567/folders.json')
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
        let folders = body.folders;
        this.setState({folders: folders});
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let folders = this.state.folders.map((folder)=>{
      let thisClassName = "folderListElement";
      if (this.props.selectedFolderId == folder.id) {
        thisClassName += " selected";
      }

      let handleFolderClick = () => {
        this.props.handleFolderClick(folder.id);
      };

      return (
        <div className={thisClassName} onClick={handleFolderClick}><h5>{folder.name}</h5></div>
      );
    });

    return (
      <div className='small-4 column'>
        {folders}
      </div>
    );
  }
}

export default FolderList;
