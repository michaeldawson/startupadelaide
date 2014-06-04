
function setupRevslider() {
	$element = jQuery('.fullwidthbanner');
	var w=$element.data('width'),
			h=$element.data('height');

	var revapi;
  revapi = $element.revolution(
	{
		delay:7000,
		startwidth: w,
		startheight: h,
		hideThumbs:10,

		thumbWidth:100,
		thumbHeight:50,
		thumbAmount:5,

		navigationType:"both",
		navigationArrows:"solo",
		navigationStyle:"round",

		touchenabled:"on",
		onHoverStop:"on",

		navigationHAlign:"center",
		navigationVAlign:"top",
		navigationHOffset:0,
		navigationVOffset:20,

		soloArrowLeftHalign:"left",
		soloArrowLeftValign:"center",
		soloArrowLeftHOffset:20,
		soloArrowLeftVOffset:0,

		soloArrowRightHalign:"right",
		soloArrowRightValign:"center",
		soloArrowRightHOffset:20,
		soloArrowRightVOffset:0,

		shadow:0,
		fullWidth:"on",
		fullScreen:"off",

		stopLoop:"off",
		stopAfterLoops:-1,
		stopAtSlide:-1,

		shuffle:"off",

		autoHeight:"off",
		forceFullWidth:"off",

		hideThumbsOnMobile:"off",
		hideBulletsOnMobile:"on",
		hideArrowsOnMobile:"on",
		hideThumbsUnderResolution:0,

		hideSliderAtLimit:0,
		hideCaptionAtLimit:768,
		hideAllCaptionAtLilmit:0,
		startWithSlide:0,
		videoJsPath:"plugins/revslider/rs-plugin/videojs/",
		fullScreenOffsetContainer: ""
	});

	jQuery('.rev_next').click(function() {
		jQuery('.tp-rightarrow').click();
	});
}