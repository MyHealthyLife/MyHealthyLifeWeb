var app=angular.module('social', []);

var centric01_basic="https://centric01-main.herokuapp.com";

app.controller('rankingController', function ($scope,$rootScope, $http) {
	
	$scope.user_data
	
	$rootScope.loadRanking = function () {
		
		// Shows the loader
        $(".showOnLoadRanking").hide();
        $(".loaderRanking").show();
        
        $http({
            url: centric01_basic+"/user/data/"+global_username,
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            
        	$scope.user_data = success.data;
            
            
            // Hides the loader and shows the content
            $(".loaderRanking").hide();
            $(".showOnLoadRanking").show();
            
        }, function(error){
        	console.log('Error ranking');
        });
        
       
    };
    
    $rootScope.loadRanking();
    
	
});