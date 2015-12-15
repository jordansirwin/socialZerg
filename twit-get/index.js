var Twitter = require('twitter');

var keywords = '#blizzard,#starcraft,#overwatch,#diablo,#sc2,#d3,#worldofwarcraft,#warcraft,#hearthstone'
 
var client = new Twitter({
  consumer_key: 'zVAaAZg1krSUjeyTXMrRHXxAO',
  consumer_secret: 'eto4JhbneNlnGYhnrG8TZEwP5uWJW61RnR8pQFaM4cHD5Y6b90',
  access_token_key: '23265241-BoZzLl2iSY3d0iy6l923RLJsplptcebmEoaIEcSkT',
  access_token_secret: 'hM7dn8jJgrtD3EfkkegUnnbN1a48KVWtAg50WMgTzFT5k'
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