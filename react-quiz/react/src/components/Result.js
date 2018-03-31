import React from 'react';

const Result = props => {
  let result = '';
  if (props.correctAnswer) {
    result = 'Correct!';
  }
  else if (props.correctAnswer === false) {
    result = 'Incorrect';
  }
  return(
    <div>
      <p>{result}</p>
    </div>
  );
};

export default Result;
