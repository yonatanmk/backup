import React from 'react';
import Answer from './Answer';

const AnswerList = props => {
  let answers = props.answers.map((answer)=>{

    let handleAnswerClick = (event) => {
      event.preventDefault();
      props.handleAnswerClick(answer.id, answer.correct);
    };

    return (
      <Answer
        key={answer.id}
        id={answer.id}
        text={answer.body}
        handleAnswerClick={handleAnswerClick}
      />
    );
  });

  return(
    <ul>
      {answers}
    </ul>
  );
};

export default AnswerList;
