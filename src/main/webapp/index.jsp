<!DOCTYPE html>
<html ng-app="profile">
<head>
	<title>MyHealthyLife</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <script type="text/javascript">
    	global_username="<%= session.getAttribute("USERNAME") %>";
    </script>
    
    <!-- <script src="static/js/ui-bootstrap-tpls-2.4.0.min.js"></script>-->
    <script src="static/js/jquery-3.1.1.min.js"></script>
    <script src="static/js/angular.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/ui-grid.min.js"></script>
    
    <script src="static/js/profile_controller.js"></script>
    
    
	<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css" />
    
	<link rel="stylesheet" type="text/css" href="static/css/my-profile.css" />
	<link rel="stylesheet" type="text/css" href="static/css/profile-card.css" />
	
	<link rel="stylesheet" type="text/css" href="static/css/font-awesome.min.css" />
	
	<link rel="styleSheet" href="static/css/ui-grid.min.css"/>
    
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
  	<div class="container-fluid">
	    
	    <div class="navbar-header">
	    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
	      	</button>
	        <a class="navbar-brand" href="#"><img src="logo.jpg" class="logo" alt="logo" style="max-height:30px; max-width:100px;"></a>
	    </div>
	
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	        <ul class="nav navbar-nav">
	            <li class="active"><a href="index.jsp">My Profile <span class="sr-only"></span></a></li>
	            <li><a href="progress.jsp">Progress</a></li>
	            <li><a href="social.jsp">Social</a></li>
	            <li><a href="help.jsp">Help</a></li>
	        </ul>
		 
	 		<!-- Search bar-->
	       	<form action="#" method="post" class="navbar-form navbar-left" role="search">
		        <div class="form-group">
		
		            <input name="searchText" type="text" class="form-control" placeholder="Search contents">
		            <button type="submit" class="btn btn-default btn-sm">
	     				<span class="glyphicon glyphicon-search"></span>
			        </button>
					
		        </div>
      		</form>
		   	  
		  	<!-- Logout bar -->
			<div class="navbar-form navbar-right">
	                    
	            <form id="form1" action="Logout" method="POST" class="navbar-form navbar-left" role="logout"></form>
	            
				<ul class="nav pull-right">
	               	<button type="submit" form="form1" class="btn btn-default btn-md">Logout</button>
	               </ul>
			</div>
			
		</div>
    </div>
	</nav>
	
	
	
	<br><br><br>
	
	
	<div class="container">
	
	<div class="row">
		<div class="col-sm-4">
	<div class="row">
		<div class="col-sm-12">
		    <div class="form-group">
	    	    <h2>My Profile</h2>
	    	</div>
	    </div>
	</div><br>
	<div class="row" ng-controller="user_data">
		<div class="col-lg-9 col-sm-12">

            <div class="card hovercard">
                <div class="cardheader">

                </div>
                <div class="avatar">
                    <img alt="" src="http://stock.wikimini.org/w/images/9/95/Gnome-stock_person-avatar-profile.png">
                </div>
                <div class="info">
                    <div class="title">
                        <a target="_blank" href="#">{{user_data.username}}<i class="loading_data fa fa-spinner fa-spin" style="font-size:24px"></i> </a>
                    </div>
                    <div class="desc">Firstname: {{user_data.firstname}} <i class="loading_data fa fa-spinner fa-spin" style="font-size:24px"></i></div>
                    <div class="desc">Lastname: {{user_data.lastname}} <i class="loading_data fa fa-spinner fa-spin" style="font-size:24px"></i></div>
                    <div class="desc">Sex: {{user_data.sex}} </div>
                    <div class="desc">Birthdate: {{user_data.birthdate}} <i class="loading_data fa fa-spinner fa-spin" style="font-size:24px"></i></div>
                    
                    <div class="desc"><br><button class="btn btn-primary" ng-click="editData()"><span class="	glyphicon glyphicon-pencil"></span>Edit data</button></div>
                </div>
                <div class="bottom">
       
                </div>
            </div>

        </div>
        
        
		<!-- Edit Data Modal -->
		   <div class="container">
		    <div class="modal fade" id="editDataModal" role="dialog" aria-hidden="true" style="display: none;">
		       <div class="modal-dialog">
		         <!-- Modal content-->
		         <div class="modal-content">
		             <div class="modal-header">
		                 <button type="button" class="close" data-dismiss="modal">�</button>
		                 <h2 class="modal-title">Message</h2>
		               </div>
		               <div class="modal-body">
		                   
		                    <div class="row">
		                        <div class="col-md-12">
		                            <div class="form-group">
		                            	<center>
			                            	<form id="edit_data_form" action="">
			                            		<label>Username:</label><br>
			                            		<input class="form-control" type="text" name="username" ng-model="edit_username"/><br>
			                            		<label>Firstname:</label><br>
			                            		<input class="form-control" type="text" name="firstname" ng-model="edit_firstname"/><br>
			                            		<label>Lastname:</label><br>
			                            		<input class="form-control" type="text" name="lastname" ng-model="edit_lastname"/><br>
			                            		<label>Sex:</label><br>
			                            		<select class="form-control" name="sex" ng-model="edit_sex">
			                            			<option value="M">M</option>
			                            			<option value="F">F</option>
			                            		</select><br>
			                            		<label>Birthdate:</label>
			                            		<input class="form-control" type="date" name="birthdate" ng-model="edit_birthdate"><br><br>
			                            		
			                            	</form>
		                            	</center>
		                            
		                            </div>
		                        </div>
		                    </div>
		                    <br>
		
		               </div>
		               <div class="modal-footer">
		                    <center>
		                    	<button class="btn btn-primary" ng-click="editSave()">Save</button>
		                        <button data-dismiss="modal" name="genericButtonDismiss" type="button" class="btn btn-primary">Cancel</button>
		                    </center>
		               </div>
		         </div>
		
		       </div>
		 </div>
		</div>

	</div>
	
</div>

		<div class="col-sm-6" ng-controller='sentence_receviver'>
			
			<div class="panel panel-primary">
    	<div class="panel-heading">
         	<h3 class="panel-title">Sentences</h3>
     	</div>
     
     	
		<center><div class="loader loaderSentences"></div></center>

    	<div class="panel-body showOnLoadSentences">
        	<div class="tab-content">
            	<div class="tab-pane ranking active" id="test">
				
				<div class="row">
					<div class="col-sm-6">
					
					    <div class="form-group">
				    	</div>
				    </div>
				</div>
			<div class="row">
					<div class="col-sm-12">
					    <div class="form-group">
				    	    <!-- <h1 ng-repeat="x in myData">{{x}}</h1>
				    	    <button class="btn btn-primary" ng-click="loadData()">Load</button>-->
				    	</div>
				    </div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					  <!-- <div ui-grid="{ data: myData }" class="myGrid"></div> -->
					  
					  <div class="card" ng-repeat="x in myData">
						  <!-- <img class="card-img-top" src="http://stock.wikimini.org/w/images/9/95/Gnome-stock_person-avatar-profile.png" alt="Card image cap">-->
						  <div class="card-block">
						    <h4 class="card-title"><span class="glyphicon glyphicon-user"></span> {{x.usernameOne}}</h4>
						    <p class="card-text"> {{x.sentenceText}}</p>
						    <a href="#" class="btn btn-primary">Dismiss TODO</a>
						  </div>
						</div>
				</div>
			
			</div></div>
			</div>
		</div>
	</div>
		<br>
		</div>
	</div>
	
		<div class="row">
			<div class="col-sm-12" ng-controller='foods_for_me'>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3>Suggested foods</h3>
					</div>
					<div class="panel-body">
						<div class="card foods_card"  ng-repeat='f in foodData' >
							<div class="card-block">
								<h4 class="card-tiitle"> {{f.name}} [{{f.foodType.category}}]</h4>
								<p class="card-text"> {{f.calories}} kcal</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		
		</div>
	
	</div>
	


</body>
</html>
