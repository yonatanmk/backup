import React from 'react';

const Letter = props => {
  let name = 'Addressee'
  if (props.name.length > 0) {
    name = props.name
  }

  let content = () => {
    if (props.accepted) {
      return (
        <div>
          <p>We are pleased to inform you that you have a place at Hogwarts School of Witchcraft and Wizardry. Please find enclosed a list of all necessary books and equipment.</p>
          <p>Term begins on 1 September. We await your owl by no later than 31 July.</p>
        </div>
      );
    }
    else {
      return (
        <p>We regret to inform you that we are unable to offer you a place at Hogwarts School of Witchcraft and Wizardry. After reviewing your application and Github profile, we recognize that you are indeed a "coding wizard". Unfortunately, we have concluded that you do not have actual magical abilities, which you must have to be admitted into Hogwarts.</p>
      );
    }
  }

  return (
    <div id='letter'>
      <h1>HOGWARTS SCHOOL OF WITCHCRAFT AND WIZARDRY</h1>
      <h3>Headmaster: Albus Dumbledore</h3>
      <h4>(Order of Merlin, First Class, Grand Sorc., Chf. Warlock, Supreme Mugwump,
      International Confed. of Wizards)</h4>
      <p>Dear {name},</p>
      {content()}
      <p>Yours sincerely,</p>
      <h4>Minerva McGonagall</h4>
      <h4>Deputy Headmistress</h4>
    </div>
  );
};

export default Letter;
