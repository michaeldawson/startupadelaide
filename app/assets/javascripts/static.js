jQuery(window).load(function(){

    $(function(){
    
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
    });
});
