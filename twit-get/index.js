var Twitter = require('twitter');
var Config = require('config.json');

var keywords = '#blizzard,#starcraft,#overwatch,#diablo,#sc2,#d3,#worldofwarcraft,#warcraft,#hearthstone'
 
var client = new Twitter({
  consumer_key: Config.twitter.consumer_key,
  consumer_secret: Config.twitter.consumer_secret,
  access_token_key: Config.twitter.access_token_key,
  access_token_secret: Config.twitter.access_token_secret
});

client.stream('statuses/filter', {track: keywords, language: 'en'}, function(stream) {
  stream.on('data', function(tweet) {
    console.log(tweet.created_at + ": " + tweet.text);
  });
 
  stream.on('error', function(error, data, response) {re
    debugger;
    console.log("error");
    console.log(error);
    console.log(response.code);
    // if (error.)
    throw error;
  });
});