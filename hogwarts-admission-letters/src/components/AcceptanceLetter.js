import React from 'react';

const AcceptanceLetter = props => {
  let name = 'Addressee';
  if (props.name.length > 0) {
    name = props.name;
  }

  return (
    <div id='letter'>
      <h1>HOGWARTS SCHOOL OF WITCHCRAFT AND WIZARDRY</h1>
      <h3>Headmaster: Albus Dumbledore</h3>
      <h4>(Order of Merlin, First Class, Grand Sorc., Chf. Warlock, Supreme Mugwump,
      International Confed. of Wizards)</h4>
      <p>Dear {name},</p>
      <p>We are pleased to inform you that you have a place at Hogwarts School of
      Witchcraft and Wizardry. Please find enclosed a list of all necessary books and
      equipment.</p>
      <p>Term begins on 1 September. We await your owl by no later than 31 July.</p>
      <p>Yours sincerely,</p>
      <h4>Minerva McGonagall</h4>
      <h4>Deputy Headmistress</h4>
    </div>
  );
};

export default AcceptanceLetter;
