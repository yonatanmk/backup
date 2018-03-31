import React from 'react';
const Tweet = (props) => {

  let date = new Date(parseInt(props.date, 10)).toString()

  return (
    <div>
      <img src={props.user.profile_image_url} alt={`${props.user.name}'s profile pic'`}/>
      <p><b>{props.user.name}</b></p>
      <p><em>{props.user.screen_name}</em></p>
      <p>{date}</p>
      <p>{props.text}</p>
    </div>
  )
};
export default Tweet;
