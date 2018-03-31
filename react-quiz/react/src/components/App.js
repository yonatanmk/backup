import React, { Component } from 'react';
import AnswerList from './AnswerList';
import Result from './Result';
import NextButton from './NextButton'

class App extends Component {

  constructor() {
    super();
    this.state = {
      selectedAnswerId: null,
      correctAnswer: null,
      question: null,
      answers: null
    };

    this.handleAnswerClick = this.handleAnswerClick.bind(this);
    this.handleNextClick = this.handleNextClick.bind(this);
  }

  componentDidMount() {
    this.getData();
  }

  handleAnswerClick(id, correct){
    this.setState({
      selectedAnswerId: id,
      correctAnswer: correct
    });
  }

  handleNextClick(){
    this.getData();
    this.setState({selectedAnswerId: null, correctAnswer: null});
  }

  getData () {
    fetch('/api/questions.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(responseBody => {
        this.setState({
          question: responseBody.random_question.question,
          answers: responseBody.random_question.answers
        });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render(){
    let question = '';
    let answers = [];
    if (this.state.question) {
      question = this.state.question.body;
      answers = this.state.answers;
    }


    return(
      <div>
        <h1>{question}</h1>
        <AnswerList
          answers={answers}
          handleAnswerClick={this.handleAnswerClick}
        />
        <Result
          correctAnswer={this.state.correctAnswer}
        />
        <NextButton
          correctAnswer={this.state.correctAnswer}
          handleNextClick={this.handleNextClick}
        />
      </div>
    );
  }
}

export default App;
