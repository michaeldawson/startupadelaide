APP = {
  common: {
    init: function() {
      // This is executed on every page
      App.init();
      // handleBXSlider();
    }
  }
};

UTIL = {
  exec: function( controller, action ) {
    action = ( action === undefined ) ? "init" : action;
    console.log(controller + action)
    // if( namespace === undefined || namespace == "" ) {
    //   if( controller !== "" && APP[controller] && typeof APP[controller][action] == "function" ) {
    //     APP[controller][action]();
    //   }
    // } else {
      if( controller !== "" && APP[controller] && typeof APP[controller][action] == "function" ) {
        APP[controller][action]();
      }
    // }
  },
 
  init: function() {
    var body = document.body,
        controller = body.getAttribute( "data-controller" ),
        action = body.getAttribute( "data-action" );

    UTIL.exec( "common" );
    UTIL.exec( controller );
    UTIL.exec( controller, action );
    
  }
};
 
jQuery( document ).ready( UTIL.init );
jQuery(window).bind('page:change', UTIL.init );