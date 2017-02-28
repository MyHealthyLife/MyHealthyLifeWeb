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
    
    <script src="static/js/progress-bar.js"></script>
	<link rel="stylesheet" href="static/css/progress-bar.css" />
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
	<div class="panel panel-primary">
    	<div class="panel-heading">
         	<h3 class="panel-title">Goal Progress</h3>
     	</div>
     
	<center><div class="loader loaderProgressBars"></div></center>

    	<div class="panel-body showOnLoadProgressBars">
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
					 <!-- Skill Bars -->
			            <div class="progress skill-bar ">
			                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow={{weightBar}} aria-valuemin="0" aria-valuemax="100">
			                    <span class="skill">Weight <i class="val">{{weightBar}}%</i></span>
			                </div>
			            </div>
			                
			            <div class="progress skill-bar">
			                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow={{heightBar}} aria-valuemin="0" aria-valuemax="100" >
			                    <span class="skill">Height<i class="val">{{heightBar}}%</i></span>
			                </div>
			            </div>
			            
			            <div class="progress skill-bar">
			                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow={{stepsBar}} aria-valuemin="0" aria-valuemax="100">
			                    <span class="skill">Steps<i class="val">{{stepsBar}}%</i></span>
			                </div>
			            </div>  
			            
			            <div class="progress skill-bar">
			                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow={{bpBar}} aria-valuemin="0" aria-valuemax="100">
			                    <span class="skill">Blood pressure<i class="val">{{bpBar}}%</i></span>
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
		            <h3 class="panel-title">Add Measure</h3>
		        </div>
       
				<center><div class="loader loaderAddMeasure"></div></center>
				
		        <div class="panel-body showOnLoadAddMeasure">
		            <div class="tab-content">
		                <div class="tab-pane add-measure active" id="test">
				
						<form class="form-horizontal" ng-controller="addMeasureController" role="form" name="addMeasureModule" onsubmit="return fun();" action="" method="POST">
							
							<div class="row">
								<div class="col-sm-3">
									<label class="control-label" for="type">Measure type:</label>	
								</div>
				        		<div class="col-sm-9">
						        	<select class="form-control" name="type" ng-model="add_measureType">
		            					<option ng-repeat="singleMeasure in measureTypes">{{singleMeasure}}</option>
		                       		</select><br>
	                       		</div>
				        	</div>
				        	
				        	
							<div class="row">
								<div class="col-sm-3">
			        				<label class="control-label" for="measureDate" class="col-sm-4 control-label">Registered:</label>
			        			</div>
			        			
								<div class="col-sm-9">
	                        		<input class="form-control" type="date" name="measureDate" ng-model="add_measureDate"><br>
					        	</div>
				        	</div>
				        	
					        <div class="row">
								<div class="col-sm-3">
								    <label for="measureValue" class="col-sm-4 control-label">Value:</label>
								    
						      	</div>
							    <div class="col-sm-3">
							    	<input type="text" class="form-control" id="measureValue" placeholder="e.g. 80.9" ng-model="add_measureValue">
							    </div>
		      	
						      	
								<div class="col-sm-6">
						      		<button ng-click="addMeasureSave()" type="button" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus"></span> Add Measure</button>
			        			</div>
							</div>
							     <br> 
						</form>
						</div>
					</div>
				</div>
			</div>
			
		<div ng-controller="currentHealthController">
	    	
	    	<div class="panel panel-primary">
	        <div class="panel-heading">
	            <h3 class="panel-title">Current Health</h3>
	        </div>
	        
			<center><div class="loader loaderCurrentHealth"></div></center>
							
	        <div class="panel-body showOnLoadCurrentHealth">
	            <div class="tab-content">
	                <div class="tab-pane current-health active" id="test">
			
					<form class="form-horizontal">
					  	<div class="form-group">
						    <label for="weight" class="col-sm-4 control-label">Weight:</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="weight" placeholder="No value" value={{weight}} disabled>
						      <i class="loading_data fa fa-spinner fa-spin" style="font-size:24px"></i>
						    </div>
					  	</div>
						  <div class="form-group">
						    <label for="height" class="col-sm-4 control-label">Height:</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="height" placeholder="No value" value={{height}} disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="steps" class="col-sm-4 control-label">Steps:</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="steps" placeholder="No value" value={{steps}} disabled>
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="bloodpressure" class="col-sm-4 control-label">Blood pressure:</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="bloodpressure" placeholder="No value" value={{bloodpressure}} disabled>
						    </div>
						  </div>
						</form>
				
				
					                  </div>
					            </div>
					        </div>
					    </div>
			</div>
			</div>
			
			
			
			<div class="col-sm-6" ng-controller="measureHistoryController">
	 			
					    <div class="panel panel-primary">
					        <div class="panel-heading">
					            <h3 class="panel-title">Measure History</h3>
					        </div>            
					        
							<center><div class="loader loaderHistory"></div></center>
							
					        <div class="panel-body showOnLoadHistory">
					            <div class="tab-content">
					                <div class="tab-pane measure-history active" id="test">
					                <div class="card" ng-repeat="singleMeasure in measureHistory">
						 				<div class="card-block">
									  		
									  		<div class="row">
											    <div class="col-sm-5">
												    <h3 class="card-title"><span class="glyphicon glyphicon-object-align-left"></span> {{singleMeasure.measureType}}</h3>
												    
												    <label class="card-text">Registered: {{singleMeasure.dateRegistered}}</label>
												    
											    </div>
									    		<div class="col-sm-4">
												    <br><br>
												    <h4 class="card-text">Value: {{singleMeasure.measureValue}}</h4>
											    </div>
											    
											    <div class="col-sm-3">
											    	<br><br>
											    	<button ng-click="deleteMeasure(singleMeasure.mid)" type="button" class="btn btn-danger btn-block"><span class="glyphicon glyphicon-remove"></span> Delete</button>
			        			
											    </div>
										    </div>
										    <hr>
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