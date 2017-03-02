<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyHealthyLife</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href="static/css/bootstrap.min.css" />
    
    <script src="static/js/jquery-3.1.1.min.js"></script>
    <script src="static/js/angular.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	global_username="<%= session.getAttribute("USERNAME") %>";
    </script>
    
	<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css" />
	<link rel="stylesheet" href="static/css/loaders.css" />
	
    <script src="static/js/progress_controller.js"></script>
	
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
	            <li><a href="progress.jsp">Progress</a></li>
	            <li class="active"><a href="social.jsp">Social</a></li>
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
	<div class="panel panel-primary">
    	<div class="panel-heading">
         	<h3 class="panel-title">Goal Progress</h3>
     	</div>
     
	<center><div class="loader loaderRanking"></div></center>

    	<div class="panel-body showOnLoadRanking">
        	<div class="tab-content">
            	<div class="tab-pane goal-progress active" id="test">
				
				<div class="row">
					<div class="col-sm-12">
					
					    <div class="form-group">
				    	</div>
				    </div>
				</div>
	
	
				<div class="row">
					<div class="col-sm-12" ng-controller="progressBarController">
					  
					  
					  
					  
					  
			            </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	


</body>
</html>