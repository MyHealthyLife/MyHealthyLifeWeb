var app=angular.module('profile', []);

var centric01_basic="https://centric01-main.herokuapp.com";

app.controller('user_data', function ($scope,$rootScope, $http) {
	
	$scope.user_data
	
	$scope.loadUserData = function () {
        console.log('loadFeeds called.');
       
        
        $http({
            url: centric01_basic+"/user/data/"+global_username,
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            $scope.user_data = success.data;
        }, function(error){
        	console.log('error');
        });
        
        console.log($scope.user_data);
       
    };
    
    $scope.loadUserData();
	
});