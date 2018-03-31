import React from 'react';

const InputForm = props => {
  return (
    <form>
      <input id='blah'
        type="text"
        placeholder="Name of student"
        value={props.name}
        onChange={props.handleChange}
      />
      <button id='accepted' onClick={props.accept}>Accepted</button>
      <button id='rejected' onClick={props.reject}>Rejected</button>
    </form>
  );
};

export default InputForm;
