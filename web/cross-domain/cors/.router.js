function setRouter(app){ 
 var router = app; 

app.get('/getNews', function(req, res) {
  var news = [
    'news 1',
    'news 2',
    'news 3',
    'news 4',
    'news 5',
    'news 6',
    'news 7',
    'news 8',
    'news 9',
  ];

  var data = [];
  for (var i = 0; i < 3; i++) {
    var index = parseInt(Math.random() * news.length);
    data.push(news[index]);
    news.splice(index, 1);
  }


  res.header('Access-Control-Allow-Origin','http://localhost:8080');
  res.send(data);
});
}
 module.exports.setRouter = setRouter