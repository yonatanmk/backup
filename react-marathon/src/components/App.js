import React from 'react';
import PlaylistCollection from './PlaylistCollection'
import SongCollection from './SongCollection'

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      selectedSongId: this.props.data.selectedSongId,
      selectedPlaylistId: this.props.data.selectedPlaylistId
    }
    this.handleSongSelect = this.handleSongSelect.bind(this);
    this.handlePlaylistSelect = this.handlePlaylistSelect.bind(this);
  };

  handleSongSelect(id) {
    this.setState({ selectedSongId: id });
  }

  handlePlaylistSelect(id) {
    let playlistSongs = this.props.data.playlists[id - 1].songs
    let randNum = Math.floor(Math.random() * playlistSongs.length)
    let firstSongId = playlistSongs[randNum]
    this.setState({ selectedSongId: firstSongId, selectedPlaylistId: id });
  }

  render() {
    let data = this.props.data

    let selectedPlaylistSongIds = data.playlists[this.state.selectedPlaylistId-1].songs;

    let filterById = (obj) => {
      return selectedPlaylistSongIds.includes(obj.id);
    }

    let selectedPlaylistSongs = data.songs.filter(filterById);

    return (
      <div className="App row">
        <div className='columns small-6'>
          <h1>Playlist</h1>
          <PlaylistCollection
            playlists={data.playlists}
            selectedPlaylistId = {this.state.selectedPlaylistId}
            handlePlaylistSelect = {this.handlePlaylistSelect}
          />
        </div>
        <div className='columns small-6'>
          <h1>Songs</h1>
          <SongCollection
            songs = {selectedPlaylistSongs}
            selectedSongId = {this.state.selectedSongId}
            handleSongSelect = {this.handleSongSelect}
          />
        </div>
      </div>
    );
  }
};

export default App;
