String.prototype.trunc =
     function(n,useWordBoundary){
         var toLong = this.length>n,
             s_ = toLong ? this.substr(0,n-1) : this;
         s_ = useWordBoundary && toLong ? s_.substr(0,s_.lastIndexOf(' ')) : s_;
         return  toLong ? s_ + '...' : s_;
      };
      
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