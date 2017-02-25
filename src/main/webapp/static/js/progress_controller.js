var app=angular.module('progress', []);

var centric01_basic="https://centric01-main.herokuapp.com";

app.controller('currentHealthController', function ($scope,$rootScope, $http) {
	
	
	$scope.user_data
	
	$scope.loadCurrentHealth = function () {
        console.log('loadFeeds called.');
       
        
        $http({
            url: centric01_basic+"/user/data/"+global_username,
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            
        	$scope.user_data = success.data;
            console.log($scope.user_data.healthProfile.currentHealth.measure[0]);
            
            var measures = $scope.user_data.healthProfile.currentHealth.measure;
            for (i = 0; i < measures.length; i++) { 
                
            	if(measures[i].measureType=='weight')
            		$scope.weight = measures[i].measureValue;
            	if(measures[i].measureType=='height')
            		$scope.height = measures[i].measureValue;
            	if(measures[i].measureType=='steps')
            		$scope.steps = measures[i].measureValue;
            	if(measures[i].measureType=='bloodpressure')
            		$scope.bloodpressure = measures[i].measureValue;
            }
            
        }, function(error){
        	console.log('error');
        });
        
        console.log($scope.user_data);
       
    };
    
    $scope.loadCurrentHealth();
	
});