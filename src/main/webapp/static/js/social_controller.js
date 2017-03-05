var app=angular.module('social', []);

var centric01_basic="https://centric01-main.herokuapp.com";
var centric02_basic="https://centric02-social.herokuapp.com";

app.controller('rankingController', function ($scope,$rootScope, $http) {
	
	$scope.ranking
	$scope.rankingDetailed = {};
	
	$rootScope.loadRanking = function () {
		
		// Shows the loader
        $(".showOnLoadRanking").hide();
        $(".loaderRanking").show();
        
        $http({
            url: centric02_basic+"/ranking/"+global_username+"?bot=false",
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            
        	$scope.ranking = success.data;
            console.log($scope.ranking);
            
            for(i=0;i<$scope.ranking.length;i++) {
            	
            	$scope.rankingDetailed[i] = {};
            	$scope.rankingDetailed[i].username = $scope.ranking[i].username;
            	$scope.rankingDetailed[i].idPerson = $scope.ranking[i].idPerson;
            	$scope.rankingDetailed[i].firstname = $scope.ranking[i].firstname;
            	$scope.rankingDetailed[i].lastname = $scope.ranking[i].lastname;
            	$scope.rankingDetailed[i].sex = $scope.ranking[i].sex;
            	$scope.rankingDetailed[i].weight = $scope.ranking[i].weight;
            	$scope.rankingDetailed[i].steps = $scope.ranking[i].steps;
            	$scope.rankingDetailed[i].points = $scope.ranking[i].points;
            	$scope.rankingDetailed[i].position = i + 1;
            	
                
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