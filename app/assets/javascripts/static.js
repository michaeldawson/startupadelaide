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
            columnWidth : 120
          },
          masonryHorizontal : {
            rowHeight: 120
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
            $(this).find(".large_show").toggleClass('hidden')
            
            $container.isotope('reLayout');
        });
    });
});
