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
            	$scope.rankingDetailed[i].telegramUsernameAvailable = $scope.ranking[i].telegramUsernameAvailable;
            	$scope.rankingDetailed[i].telegramUsernameVisible = $scope.ranking[i].telegramUsernameVisible;
            	$scope.rankingDetailed[i].telegramUsername = $scope.ranking[i].telegramUsername;
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





app.controller('addFoodController', function ($scope,$rootScope, $http) {
	
	$scope.foodTypes
	$scope.measureData = {}

	// Function to load the section 'Add Measure'
	$rootScope.loadAddFood = function () {
		
		// Shows the loader
        $(".showOnLoadAddFood").hide();
        $(".loaderAddFood").show();

        // Request to get the measure types available in the system
        $http({
            url: centric01_basic+"/measuretypes",
            method: 'GET',
            params: {
            }
        }).then(function(success) {

        	// Memorizes the data in the scope
        	$scope.measureTypes = success.data.measureType;

            // Hides the loader and shows the content
            $(".loaderAddFood").hide();
            $(".showOnLoadAddFood").show();
            
            
        }, function(error){
        	console.log('error');
        });
       
    };
    
    // Function to send a request for adding a new measure
    $scope.addMeasureSave=function(){

		// Shows the loader
    	$(".showOnLoadAddMeasure").hide();
        $(".loaderAddMeasure").show();
        
        // Gets the data the user inserted in the form
    	$scope.measureData.measureType=$scope.add_measureType;
    	$scope.measureData.measureValue=$scope.add_measureValue;
    	$scope.measureData.dateRegistered=$scope.add_measureDate;

        // Request to post the measure the user wants to insert
    	$http({
            url: centric01_basic+"/measure/"+global_username,
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            data: $scope.measureData
        }).then(function(success)
        {
        	// Reloads all the components in the page
        	$rootScope.loadProgressBars();
            $rootScope.loadMeasureHistory();
            $rootScope.loadCurrentHealth();

            // Hides the loader and shows the content
            $(".loaderAddMeasure").hide();
            $(".showOnLoadAddMeasure").show();
            
        },function(error)
        {
            console.log('Error save measure');
        });
    }
    

    // Calls instantly the function to load the progress bars as soon as the controller is ready
    $rootScope.loadAddFood();
	
});