var express = require('express');
var request = require('request');
// var cheerio = require('cheerio');
var app     = express();

app.get('/metrics', function(req, res){

	url = 'http://www.imdb.com/title/tt1229340/';
  var time = new Date().getTime();

	request(url, function(error, response, html){
		var metrics = ""
		if(!error) {
			time = new Date().getTime() - time;
			res.setHeader('content-type', 'text/plain')
      console.log (response.statusCode)
			metrics += "custom_status_code " + response.statusCode + "\n"
			metrics += "custom_pi 3.141592\n"
			metrics += "custom_random " + Math.random().toString() + "\n"
			metrics += "custom_random2 " + (Math.random() * 2).toString() + "\n"
			metrics += "custom_response_time " + time.toString() + "\n"
		}
		res.send(metrics)

	})
})

app.listen('9150')

console.log('Magic happens on port 9150');

exports = module.exports = app;
