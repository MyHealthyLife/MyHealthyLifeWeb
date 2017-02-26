 updateProgressBars = setInterval(function() {
   console.log("Hello");
    $('.progress .progress-bar').css("width",
              function() {
                  return $(this).attr("aria-valuenow") + "%";
              }
      )
  }, 5000);