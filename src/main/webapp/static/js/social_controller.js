var app=angular.module('social', []);

var centric01_basic="https://centric01-main.herokuapp.com";
var centric02_basic="https://centric02-social.herokuapp.com";

app.controller('rankingController', function ($scope,$rootScope, $http) {
	
	$scope.ranking
	$scope.rankingSplitted = {};
	
	$rootScope.loadRanking = function () {
		
		// Shows the loader
        $(".showOnLoadRanking").hide();
        $(".loaderRanking").show();
        
        $http({
            url: centric02_basic+"/ranking/"+global_username,
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            
        	$scope.ranking = success.data;
            console.log($scope.ranking);
            
            console.log($scope.ranking.compactRanking.length);
            
            for(i=0;i<$scope.ranking.compactRanking.length;i++) {

                var res = $scope.ranking.compactRanking[i].split(" ");
                res[1] = res[1].substring(0, res[1].length - 1);
                console.log(res[1]);
                $scope.rankingSplitted[i] = {};
                $scope.rankingSplitted[i].position = res[0];
                $scope.rankingSplitted[i].username = res[1];
                $scope.rankingSplitted[i].points = res[2];
                
                console.log($scope.rankingSplitted[i]);
                
            }
            
            // Hides the loader and shows the content
            $(".loaderRanking").hide();
            $(".showOnLoadRanking").show();
            
        }, function(error){
        	console.log('Error ranking');
        });
        
       
    };
    
    $rootScope.loadRanking();
    
	
});