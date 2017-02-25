var app=angular.module('profile', []);

var cemtric01_basic="https://centric01-main.herokuapp.com";

app.controller('user_data', function ($scope,$rootScope, $http) {
	
	$scope.loadUserData = function () {
        console.log('loadFeeds called.');
       
        //$scope.loadData();
        $http({
            url: cemtric01_basic+"/user/data/morpheuss93",
            method: 'GET',
            params: {
            }
        }).success(function (data) {
            $scope.user_data = data;
        });
        console.log($scope.user_data);
       
    };
    
    $scope.loadUserData();
	
    $scope.loadData=function(){
        
    };
});