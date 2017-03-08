<!DOCTYPE html>
<html ng-app="social">
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
	<link rel="stylesheet" href="static/css/loaders.css" />
	<link rel="stylesheet" href="static/css/font-awesome.min.css">
	
	<link rel="styleSheet" href="static/css/social.css"/>
	<link rel="styleSheet" href="static/css/ranking.css"/>
    <script src="static/js/social_controller.js"></script>
	
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
	
	
	
	
	<div class="container">
	<div class="row">
	<div class="col-sm-6">
	<div class="panel panel-primary">
    	<div class="panel-heading">
         	<h3 class="panel-title">Ranking</h3>
     	</div>
     
     	
		<center><div class="loader loaderRanking"></div></center>

    	<div class="panel-body showOnLoadRanking">
        	<div class="tab-content">
            	<div class="tab-pane ranking active" id="test">
				
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
								<li ng-repeat="singlePerson in rankingDetailed">
									<time datetime="2014-07-20">
										<span class="day">POS</span>
										<span class="month">{{singlePerson.position}}</span>
									</time>
									
									<div class="info">
										<h2 class="title">{{singlePerson.username}}</h2>
										<p class="desc">{{singlePerson.firstname}} {{singlePerson.lastname}}</p>
										<p class="desc">Sex: {{singlePerson.sex}}</p>
										<p class="desc">Points: {{singlePerson.points}}</p>
										<ul>
											<li style="width:33%;">{{singlePerson.weight}} kg (current) <span class="fa fa-male"></span></li>
											<li style="width:33%;">{{singlePerson.steps}} steps (current) <span class="fa fa-child"></span></li>
										</ul>
									</div>
									<div class="social" ng-if="singlePerson.telegramUsernameAvailable == true">
										<ul>
											<li class="telegram" style="width:33%;" ng-if="singlePerson.telegramUsernameVisible == true">
												<a href="http://t.me/{{singlePerson.telegramUsername}}" target="_blank"><span class="fa fa-telegram"><div>{{singlePerson.telegramUsername}}</div></span></a>
											</li>
											<li class="telegram" style="width:33%;" ng-if="singlePerson.telegramUsernameVisible == false">
												<a href="#telegram"><span class="fa fa-telegram"></span></a>
											</li>
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
	
	
	<div class="col-sm-6">
	<div class="panel panel-primary">
    	<div class="panel-heading">
         	<h3 class="panel-title">Add Food</h3>
     	</div>
     
     	
		<center><div class="loader loaderAddFood"></div></center>

    	<div class="panel-body showOnLoadAddFood">
        	<div class="tab-content">
            	<div class="tab-pane ranking active" id="test">
				
				<div class="row">
					<div class="col-sm-6">
					
					    <div class="form-group">
				    	</div>
				    </div>
				</div>
				
				<div class="row">
					<div class="col-sm-12" ng-controller="addFoodController">
					
					
							<div class="row">
								<div class="col-sm-3">
									<label class="control-label" for="type">Food type:</label>	
								</div>
				        		<div class="col-sm-9">
						        	<input class="form-control" type="text" name="foodType" ng-model="add_foodType"><br>
	                       		</div>
				        	</div>
				        	
				        	
							<div class="row">
								<div class="col-sm-3">
									<label class="control-label" for="type">Food name:</label>	
								</div>
				        		<div class="col-sm-9">
						        	<input class="form-control" type="text" name="foodName" ng-model="add_foodName"><br>
	                       		</div>
				        	</div>
				        	
					        <div class="row">
								<div class="col-sm-3">
								    <label for="foodCalories" class="control-label">Calories (100g):</label>
								    
						      	</div>
							    <div class="col-sm-3">
							    	<input type="text" class="form-control" id="foodCalories" placeholder="e.g. 48" ng-model="add_foodCalories">
							    </div>
		      	
						      	
								<div class="col-sm-6">
						      		<button ng-click="addFoodSave()" type="button" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus"></span> Add Food</button>
			        			</div>
							</div>
							     <br>
					
					
					</div>
				</div>
				
				
				
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	
	
	<div class="row">
	<div class="col-sm-6">
	<div class="panel panel-primary">
    	<div class="panel-heading">
         	<h3 class="panel-title">Create sentence</h3>
     	</div>
     
     	
		<center><div class="loader loaderAddSentence"></div></center>

    	<div class="panel-body showOnLoadAddSentence">
        	<div class="tab-content">
            	<div class="tab-pane ranking active" id="test">
				
				<div class="row">
					<div class="col-sm-6">
					
					    <div class="form-group">
				    	</div>
				    </div>
				</div>
				
				<div class="row">
					<div class="col-sm-12" ng-controller="addSentenceController">
					
					
							<div class="row">
								<div class="col-sm-3">
									<label class="control-label" for="type">Sentence type:</label>	
								</div>
				        		<div class="col-sm-5">
						        	<input class="form-control" type="text" name="sentenceType" ng-model="add_sentenceType"><br>
	                       		</div>
	                       		<div class="col-sm-4">
						        	<select class="form-control" name="motive" ng-model="add_sentenceTypeMotive">
		            					<option>gain</option>
		            					<option>loss</option>
		                       		</select><br>
	                       		</div>
				        	</div>
				        	
				        	
							<div class="row">
								<div class="col-sm-3">
									<label class="control-label" for="type">Sentence text:</label>	
								</div>
				        		<div class="col-sm-9">
						        	<input class="form-control" type="text" name="sentenceText" ng-model="add_sentenceText"><br>
	                       		</div>
				        	</div>
				        	
					        <div class="row">
								<div class="col-sm-3">
								    <label for="imageURL" class="control-label">Image URL:</label>
								    
						      	</div>
							    <div class="col-sm-9">
							    	<input type="text" class="form-control" id="imageURL" placeholder="http://example.com/image.png" ng-model="add_imageURL">
							    </div>
				        	</div>
				        	<br>
					      	<div class="row">
								<div class="col-sm-12">
						      		<button ng-click="addSentenceSave()" type="button" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus"></span> Add Sentence</button>
			        			</div>
							</div>
							</div>
							     <br>
					
					
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