import React from 'react';

const Answer = props => {
  return(
    <li onClick={props.handleAnswerClick}>
      <button>{props.text}</button>
    </li>
  );
};

export default Answer;
