var app=angular.module('progress', []);

var centric01_basic="https://centric01-main.herokuapp.com";

app.controller('currentHealthController', function ($scope,$rootScope, $http) {
	
	$scope.user_data
	
	// Function to load the section 'Current Health'
	$rootScope.loadCurrentHealth = function () {
		
		// Shows the loader
        $(".showOnLoadCurrentHealth").hide();
        $(".loaderCurrentHealth").show();
        
        // Request to get the data of a user (including his/her health status
        $http({
            url: centric01_basic+"/user/data/"+global_username,
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            
        	// Memorizes the data in the scope
        	$scope.user_data = success.data;
            
        	// Gets the list of measures in the health profile
            var measures = $scope.user_data.healthProfile.currentHealth.measure;
            
            // For each measure it checks the type
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
            
            // Hides the loader and shows the content
            $(".loaderCurrentHealth").hide();
            $(".showOnLoadCurrentHealth").show();
            
        }, function(error){
        	console.log('Error current health');
        });
        
       
    };
    
    // Calls instantly the function to load the current health as soon as the controller is ready
    $rootScope.loadCurrentHealth();
    
	
});








app.controller('progressBarController', function ($scope,$rootScope, $http) {
	
	
	$scope.goal_data
	$scope.weightBar = 100;
	$scope.heightBar = 100;
	$scope.stepsBar = 100;
	$scope.bpBar = 100;
	
	
	$rootScope.loadProgressBars = function () {

        $(".showOnLoadProgressBars").hide();
        $(".loaderProgressBars").show();
       
        
        $http({
            url: centric01_basic+"/user/goals/"+global_username,
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


            $(".loaderProgressBars").hide();
            $(".showOnLoadProgressBars").show();
            
        }, function(error){
        	console.log('error');
        });
        
        console.log($scope.goal_data);
    };
    
    $rootScope.loadProgressBars();
    
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





app.controller('addMeasureController', function ($scope,$rootScope, $http) {
	
	
	$scope.measureTypes
	$scope.measureData = {}
	
	$rootScope.loadAddMeasure = function () {

        $(".showOnLoadAddMeasure").hide();
        $(".loaderAddMeasure").show();
       
        
        $http({
            url: centric01_basic+"/measuretypes",
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            
        	$scope.measureTypes = success.data.measureType;
            console.log($scope.measureTypes);

            $(".loaderAddMeasure").hide();
            $(".showOnLoadAddMeasure").show();
            
            
        }, function(error){
        	console.log('error');
        });
        
        console.log($scope.measureTypes);
       
    };
    
    $scope.addMeasureSave=function(){
    	
    	$(".showOnLoadAddMeasure").hide();
        $(".loaderAddMeasure").show();
        
    	$scope.measureData.measureType=$scope.add_measureType;
    	$scope.measureData.measureValue=$scope.add_measureValue;
    	$scope.measureData.dateRegistered=$scope.add_measureDate;
    	
    	
    	$http({
            url: centric01_basic+"/measure/"+global_username,
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            data: $scope.measureData
        }).then(function(success)
        {
        	$rootScope.loadProgressBars();
            $rootScope.loadMeasureHistory();
            $rootScope.loadCurrentHealth();

            $(".loaderAddMeasure").hide();
            $(".showOnLoadAddMeasure").show();
            console.log('saved');
        },function(error)
        {
            console.log('error');
        });
    }
    
    
    $rootScope.loadAddMeasure();
	
});




app.controller('measureHistoryController', function ($scope,$rootScope, $http) {
	
	
	$scope.measureHistory
	
	
	$rootScope.loadMeasureHistory = function () {
        $(".showOnLoadHistory").hide();
        $(".loaderHistory").show();
       
        
        $http({
            url: centric01_basic+"/measure/"+global_username+"/history",
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            
        	$scope.measureHistory = success.data.measures;
        	var j = $scope.measureHistory.length-1;
        	for(i=0;i<$scope.measureHistory.length;i++) {
        		var dateToFormat = $scope.measureHistory[i].dateRegistered;
        		console.log((new Date(dateToFormat)).toString("MMM dd"))
        		var dateObj = new Date(dateToFormat);
				var month = dateObj.getUTCMonth() + 1;
				var day = dateObj.getUTCDate();
				var year = dateObj.getUTCFullYear();
				var seconds = dateObj.getSeconds();
				var minutes = dateObj.getMinutes();
				var hour = dateObj.getHours();
				var newdate = year + "/" + month + "/" + day + " " + hour + ":" + minutes + ":" + seconds
        		$scope.measureHistory[i].dateRegistered = newdate;
        	}
        	
        	$scope.measureHistory = $scope.measureHistory.reverse();

            $(".loaderHistory").hide();
            $(".showOnLoadHistory").show();
            
            
        }, function(error){
        	console.log('error');
        });
        
        console.log($scope.measureTypes);
       
    };
    
    
    
    $scope.deleteMeasure=function(measureId){
    	
    	$(".showOnLoadHistory").hide();
        $(".loaderHistory").show();
        
        console.log(measureId);
    	
    	$http({
            url: centric01_basic+"/measure/"+global_username+"/"+measureId,
            method: 'DELETE',
            headers: {
                "Content-Type": "application/json"
            },
        }).then(function(success)
        {
        	$rootScope.loadProgressBars();
            $rootScope.loadMeasureHistory();
            $rootScope.loadCurrentHealth();

            $(".loaderHistory").hide();
            $(".showOnLoadHistory").show();
            console.log('saved');
        },function(error)
        {
            console.log('error');
        });
    }
    
    $rootScope.loadMeasureHistory();
	
});




