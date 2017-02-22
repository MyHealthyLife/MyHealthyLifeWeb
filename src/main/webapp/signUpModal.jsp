
<div class="container">

  <!-- Modal -->
  <div class="modal fade" id="signUpModal" role="dialog">
    <div class="modal-dialog">
    
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header" style="padding:20px 50px;">
	          <button type="button" class="close" data-dismiss="modal">×</button>
	          <h4><span class="glyphicon glyphicon-lock"></span> Sign Up</h4>
	        </div>
	        <div class="modal-body" style="padding:40px 50px;">
	            <form role="form" name="regModule" onsubmit="return control();" action="RegisterUser" method="POST">
	                
	                <div class="form-group">
	                  <label for="password">Username</label>
	                  <input type="text" class="form-control" name="usernameNew" placeholder="Insert Username">
	                </div>
	                <div class="form-group">
	                  <label for="password">Password</label>
	                  <input type="password" class="form-control" name="passwordNew" placeholder="Insert Password">
	                </div>
	                <div class="form-group">
	                  <label for="password">Confirm password</label>
	                  <input type="password" class="form-control" name="passwordConfirmNew" placeholder="Confirm Password">
	                </div>
	                <br><br>
	                  <button type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-off"></span> Sign Up</button>
	                  
	            </form>
	        </div>
	        
	      </div>
      
    </div>
  </div> 
</div>