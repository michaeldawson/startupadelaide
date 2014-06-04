function setupIon() {
	jQuery("#day_count").ionRangeSlider({
      min: 0,
      max: 30,
      type: 'single',
      step: 1,
      postfix: " days",
      prettify: false,
      hasGrid: true
  });
}

APP.Admin_challenges = {
	init: function() {
	  // controller-wide code
	  
	},

	edit: function() {
		handleWysihtml5();
		setupIon()
	},
	
	new: function() {
		//handleWysihtml5();
    setupIon()
	}
}