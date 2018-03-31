import React from 'react';

const NextButton = props => {
  let nextButton = null;
  if (props.correctAnswer) {
    nextButton = <button onClick={props.handleNextClick}>Next</button>;
  }
  return(
    <div>
      {nextButton}
    </div>
  );
};

export default NextButton;
