 $(document).ready(
		 updateProgressBars=function() {
      $('.progress .progress-bar').css("width",
                function() {
                    return $(this).attr("aria-valuenow") + "%";
                }
        )
    });

 
 
 
updateProgressBars = (function() {
     $('.progress .progress-bar').css("width",
               function() {
                   return $(this).attr("aria-valuenow") + "%";
               }
       )
   });