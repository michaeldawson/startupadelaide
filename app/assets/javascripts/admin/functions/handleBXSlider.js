var handleBXSlider = function() {
	jQuery('.bxslider1').show();            
	jQuery('.bxslider1').bxSlider({
	    minSlides: 3,
	    maxSlides: 3,
	    slideWidth: 360,
	    slideMargin: 2,
	    moveSlides: 1,
	    responsive: true,
	    auto: true
	});
}