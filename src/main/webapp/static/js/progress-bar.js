 updateProgressBars = function() {
   console.log("Hello");
   console.log("Hello2");
    $('.progress .progress-bar').css("width",
              function() {
                  return $(this).attr("aria-valuenow") + "%";
              }
      )
  };