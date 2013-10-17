STARTUP = {
  common: {
    init: function() {
      $('#pt-main').fadeIn('slow');

    }
  },
};

UTIL = {
  init: function() {
    var body = document.body,
        controller = body.getAttribute( "data-controller" ),
        action = body.getAttribute( "data-action" );
 
    UTIL.exec( "common" );
    UTIL.exec( controller );
    UTIL.exec( controller, action );
  },

  exec: function( controller, action ) {
    var ns = STARTUP,
        action = ( action === undefined ) ? "init" : action;
 
    if ( controller !== "" && ns[controller] && typeof ns[controller][action] == "function" ) {
      ns[controller][action]();
    }
  },
};
 
$(document).ready( UTIL.init );
$(window).bind('page:change', UTIL.init );
