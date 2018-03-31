import React, { Component } from 'react';

import QAElement from './QAElement';
import QAElementList from './QAElementList';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      data: []
    };
  }

  componentDidMount () {
    fetch('http://localhost:3000/api/v1/questions')
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
        let data = body;
        this.setState({data: data});
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return (
      <div>
        <h1>We're here to help</h1>
        <QAElementList data={this.state.data} />
      </div>
    );
  }
}

export default App;
