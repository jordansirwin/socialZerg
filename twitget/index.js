var http = require('http');
var Twitter = require('twitter');
var Config = require('./config');
var options = {
  host: '10.0.0.11',
  port: 9200,
  path: '/twitter/tweet/',
  method: 'POST',
  headers: {'content-type': 'application/json'}
};
var client = new Twitter({
  consumer_key: Config.twitter.consumer_key,
  consumer_secret: Config.twitter.consumer_secret,
  access_token_key: Config.twitter.access_token_key,
  access_token_secret: Config.twitter.access_token_secret
});

client.stream('statuses/filter', {track: Config.twitter.track, language: Config.twitter.language}, function(stream) {

  
  stream.on('data', function(tweet) {

    var req = http.request(options, function(res) {
      console.log(res.statusCode + ' ' + res.statusMessage
        );
    });
    req.on('error', function(e) {
      console.log('ERR: ' + e.message);
    });

    req.write(JSON.stringify(tweet));
    req.end();
  });
 
  stream.on('error', function(error, data, response) {
    console.log("error");
    console.log(error);
    console.log(response.code);
    // if (error.)
    throw error;
  });
});
