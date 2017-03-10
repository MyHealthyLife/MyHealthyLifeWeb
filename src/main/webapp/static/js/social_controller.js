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
	
	$scope.foodData = {}

	// Function to load the section 'Add Food'
	$rootScope.loadAddFood = function () {
		
		// Shows the loader
        $(".showOnLoadAddFood").hide();
        $(".loaderAddFood").show();

		
	    // Hides the loader and shows the content
	    $(".loaderAddFood").hide();
	    $(".showOnLoadAddFood").show();
       
    };
    
    // Function to send a request for adding a new food
    $scope.addFoodSave=function(){

		// Shows the loader
    	$(".showOnLoadAddFood").hide();
        $(".loaderAddFood").show();
        
        // Gets the data the user inserted in the form
    	$scope.foodData.name=$scope.add_foodName;
    	$scope.foodData.calories=$scope.add_foodCalories;
    	$scope.foodData.foodType={};
    	$scope.foodData.foodType.category=$scope.add_foodType;

        // Request to post the food the user wants to insert
    	$http({
            url: centric02_basic+"/food",
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            data: $scope.foodData
        }).then(function(success)
        {
        	// Reloads all the components in the page
        	$rootScope.loadRanking();
        	
            // Hides the loader and shows the content
            $(".loaderAddFood").hide();
            $(".showOnLoadAddFood").show();
            
        },function(error)
        {
            console.log('Error save food');
        });
    }
    

    // Calls instantly the function to load the component as soon as the controller is ready
    $rootScope.loadAddFood();
	
});




app.controller('addSentenceController', function ($scope,$rootScope, $http) {
	
	$scope.sentenceData = {}

	// Function to load the section 'Add Sentence'
	$rootScope.loadAddSentence = function () {
		
		// Shows the loader
        $(".showOnLoadAddSentence").hide();
        $(".loaderAddSentence").show();

		
	    // Hides the loader and shows the content
	    $(".loaderAddSentence").hide();
	    $(".showOnLoadAddSentence").show();
       
    };
    
    // Function to send a request for adding a new sentence
    $scope.addSentenceSave=function(){

		// Shows the loader
    	$(".showOnLoadAddSentence").hide();
        $(".loaderAddSentence").show();
        
        // Gets the data the user inserted in the form
    	$scope.sentenceData.text=$scope.add_sentenceText;
    	$scope.sentenceData.url=$scope.add_imageURL;
    	$scope.sentenceData.sentenceType={};
    	$scope.sentenceData.sentenceType.name=$scope.add_sentenceType;
    	if($scope.add_sentenceTypeMotive=="gain") 
        	$scope.sentenceData.sentenceType.motive=true;
    	else
    		$scope.sentenceData.sentenceType.motive=false;
    	console.log($scope.sentenceData);
        // Request to post the food the user wants to insert
    	$http({
            url: centric02_basic+"/sentence",
            method: 'POST',
            headers: {
                "Content-Type": "application/json"
            },
            data: $scope.sentenceData
        }).then(function(success)
        {
        	// Reloads all the components in the page
        	$rootScope.loadRanking();
        	$rootScope.loadAddSentence();
        	
            // Hides the loader and shows the content
            $(".loaderAddSentence").hide();
            $(".showOnLoadAddSentence").show();
            
        },function(error)
        {
            console.log('Error save sentence');
        });
    }
    

    // Calls instantly the function to load the component as soon as the controller is ready
    $rootScope.loadAddSentence();
	
});