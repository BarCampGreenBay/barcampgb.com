/**
 * cbpAnimatedHeader.js v1.0.0
 * http://www.codrops.com
 *
 * Licensed under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 *
 * Copyright 2013, Codrops
 * http://www.codrops.com
 */
var cbpAnimatedHeader = (function() {

  var header = $('.header'),
    didScroll = false,
    changeHeaderOn = 240,
    scrollClass = 'header-scroll';

  function init() {
    $(window).on('scroll', function() {
      if( !didScroll ) {
        didScroll = true;
        setTimeout( scrollPage, 100 );
      }
    });
  }

  function scrollPage() {
    var sy = $(window).scrollTop();
    header.toggleClass(scrollClass, sy >= changeHeaderOn);
    didScroll = false;
  }

  init();

})();

$(function() {
  // smooth scroll to anchor links: http://css-tricks.com/snippets/jquery/smooth-scrolling/
  $('a[href*=#]:not([href=#])').click(function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 600);
        return false;
      }
    }
  });

});