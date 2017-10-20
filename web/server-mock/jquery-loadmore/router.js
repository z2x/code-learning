app.get('/getNews', function(req, res) {
  var news = [{
      link: 'https://xw.qq.com/cmsid/FIN2017101203897801',
      title: '第三家！圆通接力中通、韵达涨价 每公斤上调0.3元',
      time: '25分钟前',
      comment: '103评',
      img: '//inews.gtimg.com/newsapp_ls/0/2153676118_150120/0'
    },
    {
      link: 'https://xw.qq.com/cmsid/20171012A011PI00',
      title: '房产税、遗产税改革背后有什么？',
      time: '8小时前',
      comment: '1评',
      img: '//inews.gtimg.com/newsapp_ls/0/2153382959_150120/0'
    },
    {
      link: 'https://xw.qq.com/cmsid/20171012A01TEL00',
      title: '中国品牌价值世界第二 年增值堪比整个英国',
      time: '7小时前',
      comment: '152评',
      img: '//inews.gtimg.com/newsapp_ls/0/2152529631_150120/0'
    },
    {
      link: 'https://xw.qq.com/cmsid/FIN2017101203339006',
      title: '乐天集团高管：计划在年底前出售在华乐天玛特超市',
      time: '1小时前',
      comment: '6评',
      img: '//inews.gtimg.com/newsapp_ls/0/2153336808_150120/0'
    },
    {
      link: 'https://xw.qq.com/cmsid/20171012A01I3P00',
      title: '想吸粉，中国潮流品牌还要做些什么？',
      time: '8小时前',
      comment: '54评',
      img: '//inews.gtimg.com/newsapp_ls/0/2152770090_150120/0'
    },
    {
      link: 'https://xw.qq.com/cmsid/FIN2017101200815106',
      title: '中国动真格了：彻查富人账户 超百万美元账户将被摸清',
      time: '7小时前',
      comment: '189评',
      img: '//inews.gtimg.com/newsapp_ls/0/2152259019_150120/0'
    },
    {
      link: 'https://xw.qq.com/cmsid/20171012A01LUB00',
      title: '高通在台湾被罚51亿 创台湾反垄断罚款纪录',
      time: '8小时前',
      comment: '18评',
      img: '//inews.gtimg.com/newsapp_ls/0/2152569132_150120/0'
    },
    {
      link: 'https://xw.qq.com/cmsid/FIN2017101202917802',
      title: '【一线】上海家化控股股东发起部分要约收购 平安持股或超37%',
      time: '5小时前',
      comment: '1评',
      img: '//inews.gtimg.com/newsapp_ls/0/2153066502_150120/0'
    },
  ];

  var pageIndex = req.query.page;
  var newsLength = 2;

  var retNews = news.slice(pageIndex * newsLength,pageIndex * newsLength + newsLength);

  res.send({
    status: 0,
    data: retNews
  });
});
