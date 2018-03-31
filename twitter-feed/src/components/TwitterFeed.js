import React from 'react';
import Tweet from './tweet';

const TwitterFeed = (props) => {

  let tweetList = props.data.map(tweet=>{

    return (
      <Tweet
        key = {tweet.id_str}
        text = {tweet.text}
        user = {tweet.user}
        date = {tweet.timestamp_ms}
      />
  );
  });

  // props.data[4].text.split(' ').filter((word) => {return word.includes('.com')})

  return (
    <div>
      {tweetList}
    </div>
  );
};
export default TwitterFeed;

// entities
// :
// Object
// favorite_count
// :
// 34
// favorited
// :
// false
// id_str
// :
// "725090047557558272"
// retweet_count
// :
// 14
// retweeted
// :
// false
// text
// :
// "How Netflix's UI team achieved to hit a quite challenging performance target by Steve McGuire pic.twitter.com/deRZ7UbabA"
// :
// "1461709913000"
// user
// :
// Object
// name
// :
// "Dan Abramov"
// profile_image_url
// :
// "https://s3.amazonaws.com/horizon-production/images/twitter-feed-dan-abramov.jpeg"
// screen_name
// :
// "dan_abramov"
