
// Data for the autocomplete modules
var availableTags = ["No option available"];
var availableUsernames = ["No username present"];
var counterFoodsInRecipe = 2;

// Loads the data for the autocomplete input fields
function autoCompleteModules(){
	
	// Gets the measures from the angular controller scope
	var measures = $('[ng-controller="addFoodController"]').scope().foodTypes;
	
	if(measures.length!=0) {
		availableTags = [];
	}
	
	// Pushes the measure types in the variable for the autocomplete
	for(i=0;i<measures.length;i++) {
		
		availableTags.push(measures[i].category);
		
	}
	
	// Gets the list of usernames from the angular controller scope
	var usernamesFromController = $('[ng-controller="dedicateSentenceController"]').scope().usernames;

	if(usernamesFromController.length!=0) {
		availableUsernames = [];
	}
	
	// Pushes the list of usernames in the variable for the autocomplete
	for(i=0;i<usernamesFromController.length;i++) {
		
		availableUsernames.push(usernamesFromController[i]);
		
	}
	
	//console.log(availableUsernames);
	//console.log(availableTags);
	
}

// When the document has been fully loaded
$(document).ready(function() {
	
	// Function that repeats every 3 seconds
	setInterval(function(){
		
		// Calls the function to load the data for the autocomplete modules
	    autoCompleteModules();
	  
	$("#foodTypeAuto").autocomplete({
	      source: availableTags
	    });
	$("#dedicateToUserAuto").autocomplete({
	      source: availableUsernames
	    });
	  }, 3000)

	    $("#hiddenCloneRecipe").hide();

	// Adds a foods when clicking on "Add food" button in recipes section
	$("#num").click(function () {
	  $(".Box:first").clone().appendTo("#form");
	  
	  // Clones the div and changes some attributes
		$("#boxToClone").attr("class", String(counterFoodsInRecipe));
		$("#boxToClone").attr("id", "view");

		$("#foodSelector").attr("ng-model", "addRecipe_foodName" + String(counterFoodsInRecipe));
		$("#foodSelector").attr("class", "form-control ingredient");
		$("#foodSelector").attr("id", "foodSelectorView");
		
		counterFoodsInRecipe++;
	});
	

	// Removes a food when clicking on "Remove food" button in recipes section
	$("#rmv").click(function () {
		 counterFoodsInRecipe--;
		 $('.' + String(counterFoodsInRecipe)).remove();
	});
	
});
    