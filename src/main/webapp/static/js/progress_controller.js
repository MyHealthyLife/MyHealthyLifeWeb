var app=angular.module('progress', []);



var centric01_basic="https://centric01-main.herokuapp.com";
var centric02_basic="https://centric02-social.herokuapp.com";

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








app.controller('progressBarController', function ($scope,$rootScope, $http) {
	
	
	$scope.goal_data
	$scope.weightBar = 100;
	$scope.heightBar = 100;
	$scope.stepsBar = 100;
	$scope.bpBar = 100;
	
	
	$scope.loadProgressBars = function () {
        console.log('loadFeeds called.');
       
        
        $http({
            url: centric01_basic+"/user/goals/pbitta1",
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            
        	$scope.goal_data = success.data;
            console.log($scope.goal_data);
            
            var goals = $scope.goal_data.goals;
            for (i = 0; i < goals.length; i++) { 
            	
            	if(goals[i].goalName=='weight')
            		$scope.weightBar = parseInt(100 * (1 - (Math.abs(goals[i].difference) / Math.abs(goals[i].actualValue))));
            	if(goals[i].goalName=='height')
            		$scope.heightBar = parseInt(100 * (1 - (Math.abs(goals[i].difference) / Math.abs(goals[i].actualValue))));
            	if(goals[i].goalName=='steps')
            		$scope.stepsBar = parseInt(100 * (1 - (Math.abs(goals[i].difference) / Math.abs(goals[i].actualValue))));
            	if(goals[i].goalName=='bloodpressure')
            		$scope.bpBar = parseInt(100 * (1 - (Math.abs(goals[i].difference) / Math.abs(goals[i].actualValue))));
            	
            }
            
        }, function(error){
        	console.log('error');
        });
        
        console.log($scope.goal_data);
    };
    
    $scope.loadProgressBars();
    
    $rootScope.updateProgressBars = (function() {
		   	console.log("Hello");
		    $('.progress .progress-bar').css("width",
		              function() {
		                  return $(this).attr("aria-valuenow") + "%";
		              }
		      )
		  });
    $rootScope.updateProgressBars();
    
});





app.controller('measureTypesController', function ($scope,$rootScope, $http) {
	
	
	$scope.measureTypes
	
	$scope.loadMeasureTypes = function () {
        console.log('loadFeeds called.');
       
        
        $http({
            url: centric01_basic+"/measuretypes",
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            
        	$scope.measureTypes = success.data.measureType;
            console.log($scope.measureTypes);
            
            
            
        }, function(error){
        	console.log('error');
        });
        
        console.log($scope.measureTypes);
       
    };
    
    $scope.loadMeasureTypes();
	
});




app.controller('measureHistoryController', function ($scope,$rootScope, $http) {
	
	
	$scope.measureHistory
	
	$scope.loadMeasureHistory = function () {
        console.log('loadFeeds called.');
       
        
        $http({
            url: centric01_basic+"/measure/"+global_username+"/history",
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            
        	$scope.measureHistory = success.data.measures;
            console.log($scope.measureHistory);
            
            
            
        }, function(error){
        	console.log('error');
        });
        
        console.log($scope.measureTypes);
       
    };
    
    $scope.loadMeasureHistory();
	
});




