STARTUP.static = {
  init: function() {
    // controller-wide code

    String.prototype.trunc =
    function(n,useWordBoundary){
       var toLong = this.length>n,
           s_ = toLong ? this.substr(0,n-1) : this;
       s_ = useWordBoundary && toLong ? s_.substr(0,s_.lastIndexOf(' ')) : s_;
       return  toLong ? s_ + '...' : s_;
    };
  },

  index: function() {
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
  },

  search: function() {    
    var elasticservers = {"library.local": "http://localhost:3000", 
                    "startupadelaide.fifthvertex.com": "http://s1.startupadelaide.fifthvertex.com/",
                    "default": "http://s1.startupadelaide.fifthvertex.com/",
                    };      
      
    var app = angular.module('fbsearch', ['ngResource', 'elasticjs.service'])
    .controller('SearchCtrl',
        function ($scope, ejsResource, $location) {
            $scope.dateFormat = 'd MMM yyyy';
        
            $scope.searchresult = {}            
            $scope.queryTerm = ($location.search()).q;                                      
            $scope.page = 0;
            $scope.moreresults = false;

            var serverName = elasticservers[document.domain];
            if (typeof(serverName) != "string") {
              console.log('Do not know what server to use for ' + document.domain + '. Will use default server ' + elasticservers['default']);
              serverName = elasticservers['default']; 
            }

            var ejs = ejsResource(serverName);
            var indicies = ['fbgroupfeed341576109215802', 'swadl'];
            var fbtype = 'feed';


            // define our search function that will be called when a user
            // submits a search
            $scope.search = function (thispage) {
                if ($scope.queryTerm) {
                  $location.search("q", $scope.queryTerm);
                }
                
            
                var start = (thispage * 10);
                if (start < 0) {
                    start = 0;
                }
                var request = ejs.Request().indices(indicies).types(fbtype).from(start);
                var searchpromise = request.query(
                    ejs.DisMaxQuery()
                    .queries(ejs.FieldQuery('message', $scope.queryTerm))
                    .queries(ejs.FieldQuery('entry.title', $scope.queryTerm))
                    .queries(ejs.FieldQuery('comments.data.message', $scope.queryTerm))
                    .queries(ejs.FieldQuery('comments.data.from.name', $scope.queryTerm))
                ).sort(ejs.Sort('created_time').desc()).doSearch();


                searchpromise.then(function (result) {
                    var searchresults = new Object();
                    searchresults.hits = new Object();
                    searchresults.hits.total = result.hits.total;
                    searchresults.entries = [];

                    for (i = 0; i < result.hits.hits.length; i++) {
                        searchresults.entries[i] = new Object();
                        searchresults.entries[i].id = result.hits.hits[i]._id;

                        if (result.hits.hits[i]._index == 'swadl') {
                            // reddit
                            searchresults.entries[i].author = null;
                            searchresults.entries[i].title = result.hits.hits[i]._source.entry.title;
                            searchresults.entries[i].description = null;
                            searchresults.entries[i].link = result.hits.hits[i]._source.entry.link;
                            searchresults.entries[i].created_time = Date.parse(result.hits.hits[i]._source.entry.pubDate);
                            searchresults.entries[i].has_thumbnail = (typeof (result.hits.hits[i]._source.entry.thumbnail) == "string")
                            searchresults.entries[i].thumbnail = result.hits.hits[i]._source.entry.thumbnail;
                            searchresults.entries[i].comment_count = -1;
                        } else {
                            // facebook
                            searchresults.entries[i].author = result.hits.hits[i]._source.from.name;
                            if (typeof (result.hits.hits[i]._source.name) == "string") {
                              searchresults.entries[i].title = result.hits.hits[i]._source.name;
                            } else if (typeof(searchresults.entries[i].title = result.hits.hits[i]._source.message) == "string") {                                                            
                              searchresults.entries[i].title = result.hits.hits[i]._source.message.trunc(50, true);                              
                            } else if (typeof(searchresults.entries[i].title = result.hits.hits[i]._source.caption) == "string") {
                              searchresults.entries[i].title = result.hits.hits[i]._source.caption;
                            } else {
                              searchresults.entries[i].title = 'No title available';                            
                            }  

                            searchresults.entries[i].description = result.hits.hits[i]._source.message;
                            searchresults.entries[i].link = result.hits.hits[i]._source.actions[0].link;
                            searchresults.entries[i].created_time = Date.parse(result.hits.hits[i]._source.created_time);
                            searchresults.entries[i].has_thumbnail = (typeof (result.hits.hits[i]._source.picture) == "string")
                            searchresults.entries[i].thumbnail = result.hits.hits[i]._source.picture;
                            if (typeof (result.hits.hits[i]._source.comments) == "undefined") {
                                searchresults.entries[i].comment_count = 0;
                            } else {
                                searchresults.entries[i].comment_count = result.hits.hits[i]._source.comments.data.length;
                            }
                        }
                    }

                    $scope.searchresult = searchresults;

                    $scope.page = thispage;
                    $scope.startingResultNumber = (($scope.page + 1) * 10) - 9;
                    $scope.endingResultNumber = ($scope.page + 1) * 10;

                    if ($scope.searchresult.hits.total) {
                        $scope.endingResultNumber = Math.min((($scope.page + 1) * 10), $scope.searchresult.hits.total);
                    }

                    if ($scope.searchresult.hits.total > $scope.endingResultNumber) {
                        $scope.moreresults = true;
                    } else {
                        $scope.moreresults = false;
                    }

                    if ($scope.page > 0) {
                        $scope.prevresults = true;
                    } else {
                        $scope.prevresults = false;
                    }
                });
            }

            setTimeout(function() {
              $scope.search(0);
            }, 50);
            
        }
    );
    angular.bootstrap(document, ['fbsearch'])
  },

  explore: function() {
    var $container = $('#container'),
    filters = {};

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
      
    });



    
    // filter buttons
    $('.option-set a').click(function(){
      var $this = $(this);
      // don't proceed if already selected
      if ( $this.hasClass('selected') ) {
        return;
      }
      
      var $optionSet = $this.parents('.option-set');
      // change selected class
      $optionSet.find('.selected').removeClass('selected');
      $this.addClass('selected');
      
      // store filter value in object
      // i.e. filters.color = 'red'
      var group = $optionSet.attr('data-filter-group');
      filters[ group ] = $this.attr('data-filter-value');
      // convert object into array
      var isoFilters = [];
      for ( var prop in filters ) {
        isoFilters.push( filters[ prop ] )
      }
      var selector = isoFilters.join('');
      $container.isotope({ filter: selector });
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
    // var naviLink = $('.page-transition');
    // naviLink.click(function(event){
    //     event.preventDefault();
    // });

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

    // clickable.click(function(){
    //   $teammate.removeClass('expanded');
    // });


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

  }
}