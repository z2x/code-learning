define(['jquery','com/gotop','com/carousel', 'com/waterfull'], function($, GoTop, Carousel, WaterFall) {

  new GoTop($('footer'));

  Carousel.init($('.carousel'));

  WaterFall.init($('.waterfall'));
});
