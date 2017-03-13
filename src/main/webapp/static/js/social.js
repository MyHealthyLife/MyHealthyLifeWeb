
var availableTags = ["No option available"];

function testing(){
	
	var measures = $('[ng-controller="addFoodController"]').scope().foodTypes;
	
	if(measures.length!=0) {
		availableTags = [];
	}
	
	for(i=0;i<measures.length;i++) {
		
		availableTags.push(measures[i].category);
		
	}
	
	console.log(availableTags);
	
}

$(document).ready(function() {
	setInterval(function(){
	    testing();
	  
	$("#foodTypeAuto").autocomplete({
	      source: availableTags
	    });
	  }, 3000)
});
    