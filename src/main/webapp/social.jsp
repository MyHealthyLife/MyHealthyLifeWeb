<!DOCTYPE html>
<html ng-app="progress">
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
	
    <script src="static/js/social_controller.js"></script>
	<link rel="styleSheet" href="static/css/ranking.css"/>
	
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
	<div class="row">
	<div class="col-sm-6">
	<div class="panel panel-primary">
    	<div class="panel-heading">
         	<h3 class="panel-title">Ranking</h3>
     	</div>
     

    	<div class="panel-body showOnLoadRanking">
        	<div class="tab-content ranking">
            	<div class="tab-pane goal-progress active" id="test">
				
				<div class="row">
					<div class="col-sm-6">
					
					    <div class="form-group">
				    	</div>
				    </div>
				</div>
	
	
				<div class="row">
					<div class="col-sm-12" ng-controller="rankingController">
					  
					  
					  
					  
					  <div class="row" ng-controller="rankingController">
						<div class="[ col-xs-12 col-sm-12 ]">
							<ul class="event-list">
								<li>
									<time datetime="2014-07-20">
										<span class="day">1</span>
										<span class="month">Pos</span>
										<span class="year">2014</span>
										<span class="time">ALL DAY</span>
									</time>
									
									<div class="info">
										<h2 class="title">Username</h2>
										<p class="desc">Name and surname</p>
										<p class="desc">S</p>
									</div>
									<div class="social">
										<ul>
											<li class="facebook" style="width:33%;"><a href="#facebook"><span class="fa fa-facebook"></span></a></li>
											<li class="twitter" style="width:34%;"><a href="#twitter"><span class="fa fa-twitter"></span></a></li>
											<li class="google-plus" style="width:33%;"><a href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
										</ul>
									</div>
								</li>
			
								<li>
									<time datetime="2014-07-20 0000">
										<span class="day">2</span>
										<span class="month">Pos</span>
									</time>
									<div class="info">
										<h2 class="title">Me</h2>
										<p class="desc">Name and surname</p>
										<ul>
											<li style="width:50%;"><a href="#website"><span class="fa fa-globe"></span> Website</a></li>
											<li style="width:50%;"><span class="fa fa-money"></span> $39.99</li>
										</ul>
									</div>
									<div class="social">
										<ul>
											<li class="facebook" style="width:33%;"><a href="#facebook"><span class="fa fa-facebook"></span></a></li>
											<li class="twitter" style="width:34%;"><a href="#twitter"><span class="fa fa-twitter"></span></a></li>
											<li class="google-plus" style="width:33%;"><a href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
										</ul>
									</div>
								</li>
			
								
			
								<li>
									<time datetime="2014-07-31 1600">
										<span class="day">3</span>
										<span class="month">Pos</span>
									</time>
									
									<div class="info">
										<h2 class="title">Username</h2>
										<p class="desc"> Name and surname</p>
										<p class="desc"> S</p>
										<ul>
											<li style="width:33%;">80 kg <span class="fa fa-male"></span></li>
											<li style="width:34%;">1200 steps <span class="fa fa-child"></span></li>
										</ul>
									</div>
									<div class="social">
										<ul>
											<li class="facebook" style="width:33%;"><a href="#facebook"><span class="fa fa-facebook"></span></a></li>
											<li class="twitter" style="width:34%;"><a href="#twitter"><span class="fa fa-twitter"></span></a></li>
											<li class="google-plus" style="width:33%;"><a href="#google-plus"><span class="fa fa-google-plus"></span></a></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</div>
					  
					  
					  
					  
			            </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	


</body>
</html>