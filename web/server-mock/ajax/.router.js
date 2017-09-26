function setRouter(app){ 
 var router = app; 

app.get('/friends',function(req,res) {
  var username = req.query.username;  //  req.query 可以获取请求参数
  var ret = ['nobody'];
  if (username == 'xiaodu') {
    ret = ['xiaoming','xiaogang'];
  }
  res.send(ret);  //  用于发送数据
});

app.get('/user', function(req, res) {
  var username = req.query.username;
  var friends;
  if(username == 'xiaodu'){
    friends = ['小明', '小刚'];
  }else {
    friends = ['nobody'];
  }

  res.render('user.ejs', {
    friends: friends
  });
});
}
 module.exports.setRouter = setRouter