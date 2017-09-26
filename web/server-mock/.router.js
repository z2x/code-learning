function setRouter(app){ 
 var router = app; 

/**
 * 页面路由，从模板渲染页面渲染页面,
 * http://localhost:8080/user
 * 支持 ejs, jade 模板
 */
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

app.post('/user', function(req, res) {
  var username = req.body.username;
  console.log(username);
  var friends;
  if(username == 'xiaodu'){
    friends = ['小明', '小刚'];
  }else {
    friends = ['nobody'];
  }

  setTimeout(function(){
      res.render('user.ejs', {
    friends: friends
  });
  }, 8000);
  // res.render('user.ejs', {
  //  friends: friends
  // });
});
}
 module.exports.setRouter = setRouter