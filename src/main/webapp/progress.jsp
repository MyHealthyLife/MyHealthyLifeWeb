<!DOCTYPE html>
<html ng-app="progress">
<head>

<title>MyHealthyLife</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<script src="static/js/jquery-3.1.1.min.js"></script>
    <script src="static/js/angular.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	global_username="<%= session.getAttribute("USERNAME") %>";
    </script>
    
	<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css" />
    
    <script src="static/js/progress_controller.js"></script>
    <script src="static/js/progress-bar.js"></script>
	<link rel="stylesheet" href="static/css/progress-bar.css" />
	
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
	            <li><a href="index.jsp">My Profile <span class="sr-only"></span></a></li>
	            <li class="active"><a href="progress.jsp">Progress</a></li>
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
		<div class="col-sm-12">
		    <div class="form-group">
	    	    <h2>Goals progress</h2>
	    	</div>
	    </div>
	</div><br>
	
	
	<div class="row">
		<div class="col-sm-12" ng-controller="progressBarController">
		 <!-- Skill Bars -->
            <div class="progress skill-bar ">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow={{weightBar}} aria-valuemin="0" aria-valuemax="100">
                    <span class="skill">Weight <i class="val">100%</i></span>
                </div>
            </div>
                
            <div class="progress skill-bar">
                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow={{heightBar}} aria-valuemin="0" aria-valuemax="100" >
                    <span class="skill">Height<i class="val">90%</i></span>
                </div>
            </div>
            
            <div class="progress skill-bar">
                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow={{stepsBar}} aria-valuemin="0" aria-valuemax="100">
                    <span class="skill">Steps<i class="val">75%</i></span>
                </div>
            </div>  
            
            <div class="progress skill-bar">
                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow={{bpBar}} aria-valuemin="0" aria-valuemax="100">
                    <span class="skill">Blood pressure<i class="val">55%</i></span>
                </div>
            </div>  
            </div>
		</div>
		
		
		       
		<div class="row">
		
	    	<div class="col-sm-6">
   	    
				<div class="panel panel-default">
			<form class="form-horizontal" role="form" name="addMeasureModule" onsubmit="return fun();" action="" method="POST">
   	    		<h2>Add measure</h2>
				<label for="type">Measure type:</label>	
				<div class="btn-group">
		          	<button type="button" class="btn-drop btn btn-default dropdown-toggle" data-toggle="dropdown">
		            	Select measure type <span class="caret"></span>
		          	</button>
		          	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu" ng-controller="measureTypesController">
			            	<li ng-repeat="singleMeasure in measureTypes"><a href="#">{{singleMeasure}}</a></li>
				            <li class="divider"></li>
				            <li><a href="#">Help me choose</a></li>
		          	</ul>
	        	</div>
	        
		        <div class="row">
					<div class="col-sm-6">
				    	<div class="form-group">
						    <label for="measureValue" class="col-sm-4 control-label">Value:</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="measureValue" placeholder="Measure Value">
						    </div>
					  	</div>
			      	</div>
			      	
					<div class="col-sm-6">
			      		<button type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus"></span> Add Measure</button>
        			</div>
				</div>
				      
			</form>
			<br><br>
		
		<div ng-controller="currentHealthController">
	    	<h2>Current Health</h2>
			<form class="form-horizontal">
			  	<div class="form-group">
				    <label for="weight" class="col-sm-4 control-label">Weight:</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="weight" placeholder="Weight" value={{weight}} disabled>
				    </div>
			  	</div>
				  <div class="form-group">
				    <label for="height" class="col-sm-4 control-label">Height:</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="height" placeholder="Height" value={{height}} disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="steps" class="col-sm-4 control-label">Steps:</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="steps" placeholder="Steps" value={{steps}} disabled>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="bloodpressure" class="col-sm-4 control-label">Blood pressure:</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control" id="bloodpressure" placeholder="Blood pressure" value={{bloodpressure}} disabled>
				    </div>
				  </div>
				</form>
			</div>
			</div></div>
			
			
			
			<div class="col-sm-6">
				<div class="panel panel-default">
		 			<h2>Measure History</h2>
				</div>
			</div>
		
	</div>
	
	</div>
	
	<br><br><br>
	
	<script type="text/javascript">
	$(function(){
	
	    $(".dropdown-menu").on('click', 'li a', function(){
	      $(".btn-drop:first-child").text($(this).text());
	      $(".btn-drop:first-child").val($(this).text());
	   });
	
	});</script>

</body>
</html>