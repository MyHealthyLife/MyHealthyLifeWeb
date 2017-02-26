var app=angular.module('profile', ['ui.grid']);

app.config(['$httpProvider', function ($httpProvider) {
	  //Reset headers to avoid OPTIONS request (aka preflight)
	  $httpProvider.defaults.headers.common = {};
	  $httpProvider.defaults.headers.post = {};
	  $httpProvider.defaults.headers.put = {};
	  $httpProvider.defaults.headers.patch = {};
	}]);

var centric01_basic="https://centric01-main.herokuapp.com";
var centric02_basic="https://centric02-social.herokuapp.com";

app.controller('user_data', function ($scope,$rootScope, $http) {
	
	$scope.user_data;
	
	$scope.edit_username;
	$scope.edit_firstname;
	$scope.edit_lastname;
	$scope.edit_sex;
	$scope.edit_birthdate;
	
	
	$scope.loadUserData = function () {
        console.log('loadUserData called.');
        $(".loading_data").show();
        
        $http({
            url: centric01_basic+"/user/data/"+global_username,
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            $scope.user_data = success.data;
            $(".loading_data").hide();
        }, function(error){
        	console.log('error');
        });
        
        console.log($scope.user_data);
       
    };
    
    
    $scope.editData=function(){
    	$scope.edit_username=$scope.user_data.username;
    	$scope.edit_firstname=$scope.user_data.firstname;
    	$scope.edit_lastname=$scope.user_data.lastname;
    	$scope.edit_sex=$scope.user_data.sex;
    	$scope.edit_birthdate=$scope.user_data.birthdate;
    	$("#editDataModal").modal('show');
    }
    
    $scope.editSave=function(){
    	$scope.user_data.username=$scope.edit_username;
    	$scope.user_data.firstname=$scope.edit_firstname;
    	$scope.user_data.lastname=$scope.edit_lastname;
    	$scope.user_data.sex=$scope.edit_sex;
    	$scope.user_data.birthdate=$scope.edit_birthdate;
    	$("#editDataModal").modal('hide');
    	$(".loading_data").show();
    	
    	//$http.put(centric01_basic+"/user/data/"+global_username, $scope.user_data)
    	
    	$http({
            url: centric01_basic+"/user/data/"+global_username,
            method: 'PUT',
            headers: {
                "Content-Type": "application/json"
            },
            data: $scope.user_data
        }).then(function(success)
        {
            console.log('saved');
            $scope.loadUserData();
        },function(error)
        {
            console.log('error');
        });
    }
    
    /*trigger the function during the page loading*/
    $scope.loadUserData();
    
	
});

app.controller('sentence_receviver', function ($scope,$rootScope, $http){
	$scope.myData;
	
	$scope.loadData=function(){
		$http({
            url: centric02_basic+"/sentence/"+global_username,
            method: 'GET',
            params: {
            }
        }).then(function(success) {
            $scope.myData = success.data;
            
        }, function(error){
        	console.log('error');
        });
	}
	
	
	$scope.loadData();
	
});


