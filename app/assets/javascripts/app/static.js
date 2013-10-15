STARTUP.static = {
  init: function() {
    // controller-wide code
  },

  index: function() {
    return;
    var PageTransitions = (function() {
    var $main = $( '#pt-main' ),
    $pages = $main.children( 'article.pt-page' ),
    animcursor = 1,
    pagesCount = $pages.length,
    current = 0,
    isAnimating = false,
    endCurrPage = false,
    endNextPage = false,
    animEndEventNames = {
    'WebkitAnimation' : 'webkitAnimationEnd',
    'OAnimation' : 'oAnimationEnd',
    'msAnimation' : 'MSAnimationEnd',
    'animation' : 'animationend'
    },
    // animation end event name
    animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
    // support css animations
    support = Modernizr.cssanimations;
    $pages.each( function() {
    var $page = $( this );
    $page.data( 'originalClassList', $page.attr( 'class' ) );
    } );
    $pages.eq( current ).addClass( 'pt-page-current' );
    })();

    // ————————————————————————————– //
    // VARIABLES
    // ————————————————————————————– //
    var $main = $( '#pt-main' ),
    $pages = $main.children( 'article.pt-page' ),
    $iterate = $( '.page-transition' ), // <– ID for my button
    pagesCount = $pages.length,
    current = 0,
    isAnimating = false,
    endCurrPage = false,
    endNextPage = false,
    animEndEventNames = {
    'WebkitAnimation' : 'webkitAnimationEnd',
    'OAnimation' : 'oAnimationEnd',
    'msAnimation' : 'MSAnimationEnd',
    'animation' : 'animationend'
    },
    // animation end event name
    animEndEventName = animEndEventNames[ Modernizr.prefixed( 'animation' ) ],
    // support css animations
    support = Modernizr.cssanimations;
    function onEndAnimation( $outpage, $inpage ) {
    endCurrPage = false;
    endNextPage = false;
    resetPage( $outpage, $inpage );
    isAnimating = false;
    }
    function resetPage( $outpage, $inpage ) {
    $outpage.attr( 'class', $outpage.data( 'originalClassList' ) );
    $inpage.attr( 'class', $inpage.data( 'originalClassList' ) + ' pt-page-current' );
    }

    // ————————————————————————————– //
    // gotoPageWithTrans1(x) 
    // ————————————————————————————– //
    function gotoPageWithTrans1(pageNumber) {
    if( isAnimating ) {
    return false;
    }
    isAnimating = true;
    var $currPage = $pages.eq( current );
    if( current != pageNumber ) {
    current = pageNumber;
    }
    var $prevPage = $pages.eq( current ).addClass( 'pt-page-current' ),
    outClass = 'pt-page-moveToLeft pt-page-ontop', inClass = 'pt-page-scaleUp';
    $prevPage.scrollTop(0);
    $currPage.addClass( outClass ).on( animEndEventName, function() {
    $currPage.off( animEndEventName );
    endCurrPage = true;
    if( endNextPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    $prevPage.addClass( inClass ).on( animEndEventName, function() {
    $prevPage.off( animEndEventName );
    endNextPage = true;
    if( endCurrPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    if( !support ) {
    onEndAnimation( $currPage, $prevPage );
    }
    }

    // ————————————————————————————– //
    // gotoPageWithTrans2(x) 
    // ————————————————————————————– //
    function gotoPageWithTrans2(pageNumber) {
    if( isAnimating ) {
    return false;
    }
    isAnimating = true;
    var $currPage = $pages.eq( current );
    if( current != pageNumber ) {
    current = pageNumber;
    }
    var $prevPage = $pages.eq( current ).addClass( 'pt-page-current' ),
    outClass = 'pt-page-scaleDown', inClass = 'pt-page-moveFromLeft pt-page-ontop';
    $prevPage.scrollTop(0);
    $currPage.addClass( outClass ).on( animEndEventName, function() {
    $currPage.off( animEndEventName );
    endCurrPage = true;
    if( endNextPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    $prevPage.addClass( inClass ).on( animEndEventName, function() {
    $prevPage.off( animEndEventName );
    endNextPage = true;
    if( endCurrPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    if( !support ) {
    onEndAnimation( $currPage, $prevPage );
    }
    }

    // ————————————————————————————– //
    // gotoPageWithTrans3(x) 
    // ————————————————————————————– //
    function gotoPageWithTrans3(pageNumber) {
    if( isAnimating ) {
    return false;
    }
    isAnimating = true;
    var $currPage = $pages.eq( current );
    if( current != pageNumber ) {
    current = pageNumber;
    }
    var $prevPage = $pages.eq( current ).addClass( 'pt-page-current' ),
    outClass = 'pt-page-moveToRight', inClass = 'pt-page-moveFromLeft';
    $prevPage.scrollTop(0);
    $currPage.addClass( outClass ).on( animEndEventName, function() {
    $currPage.off( animEndEventName );
    endCurrPage = true;
    if( endNextPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    $prevPage.addClass( inClass ).on( animEndEventName, function() {
    $prevPage.off( animEndEventName );
    endNextPage = true;
    if( endCurrPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    if( !support ) {
    onEndAnimation( $currPage, $prevPage );
    }
    }

    // ————————————————————————————– //
    // gotoPageWithTrans4(x) 
    // ————————————————————————————– //
    function gotoPageWithTrans4(pageNumber) {
    if( isAnimating ) {
    return false;
    }
    isAnimating = true;
    var $currPage = $pages.eq( current );
    if( current != pageNumber ) {
    current = pageNumber;
    }
    var $prevPage = $pages.eq( current ).addClass( 'pt-page-current' ),
    outClass = 'pt-page-moveToTop pt-page-ontop', inClass = 'pt-page-scaleUp';
    $prevPage.scrollTop(0);
    $currPage.addClass( outClass ).on( animEndEventName, function() {
    $currPage.off( animEndEventName );
    endCurrPage = true;
    if( endNextPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    $prevPage.addClass( inClass ).on( animEndEventName, function() {
    $prevPage.off( animEndEventName );
    endNextPage = true;
    if( endCurrPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    if( !support ) {
    onEndAnimation( $currPage, $prevPage );
    }
    }

    // ————————————————————————————– //
    // gotoPageWithTrans5(x) 
    // ————————————————————————————– //
    function gotoPageWithTrans5(pageNumber) {
    if( isAnimating ) {
    return false;
    }
    isAnimating = true;
    var $currPage = $pages.eq( current );
    if( current != pageNumber ) {
    current = pageNumber;
    }
    var $prevPage = $pages.eq( current ).addClass( 'pt-page-current' ),
    outClass = 'pt-page-moveToBottom pt-page-ontop', inClass = 'pt-page-scaleUp';
    $prevPage.scrollTop(0);
    $currPage.addClass( outClass ).on( animEndEventName, function() {
    $currPage.off( animEndEventName );
    endCurrPage = true;
    if( endNextPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    $prevPage.addClass( inClass ).on( animEndEventName, function() {
    $prevPage.off( animEndEventName );
    endNextPage = true;
    if( endCurrPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    if( !support ) {
    onEndAnimation( $currPage, $prevPage );
    }
    }

    // ————————————————————————————– //
    // gotoPageWithTrans6(x) 
    // ————————————————————————————– //
    function gotoPageWithTrans6(pageNumber) {
    if( isAnimating ) {
    return false;
    }
    isAnimating = true;
    var $currPage = $pages.eq( current );
    if( current != pageNumber ) {
    current = pageNumber;
    }
    var $prevPage = $pages.eq( current ).addClass( 'pt-page-current' ),
    outClass = 'pt-page-scaleDownUp', inClass = 'pt-page-scaleUp pt-page-delay300';
    $prevPage.scrollTop(0);
    $currPage.addClass( outClass ).on( animEndEventName, function() {
    $currPage.off( animEndEventName );
    endCurrPage = true;
    if( endNextPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    $prevPage.addClass( inClass ).on( animEndEventName, function() {
    $prevPage.off( animEndEventName );
    endNextPage = true;
    if( endCurrPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    if( !support ) {
    onEndAnimation( $currPage, $prevPage );
    }
    }

    // ————————————————————————————– //
    // gotoPageWithTrans7(x) 
    // ————————————————————————————– //
    function gotoPageWithTrans7(pageNumber) {
    if( isAnimating ) {
    return false;
    }
    isAnimating = true;
    var $currPage = $pages.eq( current );
    if( current != pageNumber ) {
    current = pageNumber;
    }
    var $prevPage = $pages.eq( current ).addClass( 'pt-page-current' ),
    outClass = 'pt-page-scaleDown', inClass = 'pt-page-scaleUpDown pt-page-delay300';
    $prevPage.scrollTop(0);
    $currPage.addClass( outClass ).on( animEndEventName, function() {
    $currPage.off( animEndEventName );
    endCurrPage = true;
    if( endNextPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    $prevPage.addClass( inClass ).on( animEndEventName, function() {
    $prevPage.off( animEndEventName );
    endNextPage = true;
    if( endCurrPage ) {
    onEndAnimation( $currPage, $prevPage );
    }
    } );
    if( !support ) {
    onEndAnimation( $currPage, $prevPage );
    }
    }

  },


  explore: function() {
    var $container = $('#container');

    // add randomish size classes
    $container.find('.element').each(function(){
        var $this = $(this),
            number = parseInt( $this.find('.number').text(), 10 );
        if ( number % 7 % 2 === 1 ) {
          $this.addClass('width2');
        }
        if ( number % 3 === 0 ) {
          $this.addClass('height2');
        }
    });

    $container.isotope({
      itemSelector : '.element',
      masonry : {
        columnWidth : 20
      },
      masonryHorizontal : {
        rowHeight: 60
      },
      cellsByRow : {
        columnWidth : 240,
        rowHeight : 240
      },
      cellsByColumn : {
        columnWidth : 240,
        rowHeight : 240
      },
      getSortData : {
        symbol : function( $elem ) {
          return $elem.attr('data-symbol');
        },
        category : function( $elem ) {
          return $elem.attr('data-category');
        },
        number : function( $elem ) {
          return parseInt( $elem.find('.number').text(), 10 );
        },
        weight : function( $elem ) {
          return parseFloat( $elem.find('.weight').text().replace( /[\(\)]/g, '') );
        },
        name : function ( $elem ) {
          return $elem.find('.name').text();
        }
      }
    });


    var $optionSets = $('#options .option-set'),
      $optionLinks = $optionSets.find('a');

    $optionLinks.click(function(){
    var $this = $(this);
    // don't proceed if already selected
    if ( $this.hasClass('selected') ) {
      return false;
    }
    var $optionSet = $this.parents('.option-set');
    $optionSet.find('.selected').removeClass('selected');
    $this.addClass('selected');

    // make option object dynamically, i.e. { filter: '.my-filter-class' }
    var options = {},
        key = $optionSet.attr('data-option-key'),
        value = $this.attr('data-option-value');
    // parse 'false' as false boolean
    value = value === 'false' ? false : value;
    options[ key ] = value;
    if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
      // changes in layout modes need extra logic
      changeLayoutMode( $this, options )
    } else {
      // otherwise, apply new options
      $container.isotope( options );
    }

    return false;
    });


    // change size of clicked element
    $container.delegate( '.element', 'click', function(){
        $(this).toggleClass('large');
        $(this).toggleClass('white-bg', 1000);
        $(this).find(".large_show").toggleClass('hidden')
        
        $container.isotope('reLayout');
    });

    //Prevent Fake Browser Navigation
    var naviLink = $('.page-transition');
    naviLink.click(function(event){
        event.preventDefault();
    });

    //Team previews expand
    var $teammate = $('.team-mate');
    var clickable = $('.prev-page, .home-page, .submenu li a');
    $teammate.click(function(){
      $teammate.removeClass('expanded').find('a').css({'outline':'none', 'text-decoration':'none'});
      if($(this).hasClass('frst')){
        $teammate.removeClass('frst');
      } else {
        $teammate.removeClass('frst');
        $(this).addClass('frst');
        $(this).addClass('expanded');
      }
    });

    clickable.click(function(){
      $teammate.removeClass('expanded');
    });


    //Thumbs grid init
    Grid.init();


    // stop the click propagating to the isotope handlers
    $('.social a').click(function(event){
      event.stopPropagation();
    });


    //Ajax Form
    $('#submit').click(function(){
      sprytextfield1.validate();
      sprytextfield2.validate();
      sprytextarea1.validate();
      $.post("/form", $("#feedback-form").serialize(),  function(data) {
        $('#success').html(data).animate({opacity: 1}, 500, function(){
          $("#feedback-form").trigger( 'reset' );
        });
      });
      return false;
    });

    $.ajax({
        type: "GET",
        dataType: "json",
        url: "/ajax/tweets",
        success: function(data){
          $.each(data, function(index, element) {
            $('#twitter').append($('<li>' + element.text + '</li>'));
          });

          $('.flexslider').flexslider({
            animation: "slide", controlNav: false
          });
        }
    });
  }
}