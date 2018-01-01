define(['jquery'], function($) {
  function _Carousel($ct) {
    this.$ct = $ct;
    this.init();
    this.bind();
    this.playBullet();
  }

  _Carousel.prototype = {
    init: function() {
      var $nextBtn = this.$nextBtn = this.$ct.find($('.carousel .next')),
        $preBtn = this.$preBtn = this.$ct.find($('.carousel .pre')),
        $imgContent = this.$imgContent = this.$ct.find($('.carousel .img-content')),
        $bullets = this.$bullets = this.$ct.find($('.bullet>li')),
        $img = this.$ct.find($('.carousel .img-content li'));

      this.imgWidth = $img.width();

      this.imgCount = $img.length;

      this.pageIndex = 0;
      this.isAnimate = false;

      // 将第一张图片克隆到最后
      $imgContent.append($img.first().clone());
      // 将最后一张图片克隆到最前
      $imgContent.prepend($img.last().clone());

      // 动态设置img-content容器的宽度
      $imgContent.width((this.imgCount + 2) * this.imgWidth);

      // 将原始照片放置在正确位置
      $imgContent.css({ left: -this.imgWidth });
    },

    bind: function() {
      var _this = this;
      this.$nextBtn.click(function(e) {
        e.preventDefault();
        _this.playNext();
      });

      this.$preBtn.click(function(e) {
        e.preventDefault();
        _this.playPre();
      });
    },
    playPre: function() {
      var _this = this;
      this.$imgContent.animate({
        left: '+=' + 1 * _this.imgWidth
      }, function() {
        _this.pageIndex -= 1;
        if (_this.pageIndex < 0) {
          _this.pageIndex = _this.imgCount - 1;
          _this.$imgContent.css({ left: -_this.imgWidth * _this.imgCount });
        }
        _this.setBullet();
      });
    },
    playNext: function() {
      var _this = this;
      if (this.isAnimate) return;
      this.isAnimate = true;
      this.$imgContent.animate({
        left: '-=' + _this.imgWidth
      }, function() {
        _this.pageIndex += 1;
        if (_this.pageIndex == _this.imgCount) {
          _this.pageIndex = 0;
          _this.$imgContent.css({ left: -_this.imgWidth }).fadeIn('slow');
        }
        _this.setBullet();

        _this.isAnimate = false;
      });
    },
    playBullet: function() {
      var _this = this;
      this.$bullets.click(function() {
        $this = $(this);
        var bulletIndex = $this.index();
        if (bulletIndex > _this.pageIndex) {
          _this.playNext(bulletIndex - _this.pageIndex);
        } else if (bulletIndex < _this.pageIndex) {
          _this.playPre(_this.pageIndex - bulletIndex);
        }
      });
    },
    setBullet: function() {
      this.$bullets.removeClass('active').eq(this.pageIndex).addClass('active');
    },
  };

  var Carousel = (function() {
    return {
      init: function($ct) {
        $ct.each(function(index, node) {
          new _Carousel($(node));
        });
      }
    };
  })();

  return Carousel;
});
