<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

	<link rel="stylesheet" href="static/css/bootstrap.min.css" />
    
    <script src="static/js/jquery-3.1.1.min.js"></script>
    <script src="static/js/angular.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3>Login</h3>
					</div>
					<div class="panel-body">
						<center>
							<form method="POST" action="LoginValidator">
								<label>Username:</label><br/>
								<input type="text" name="username"  /><br/>
								<label>Password:</label><br/>
								<input type="password" name="password"/><br/><br/>
								<input type="submit" class="btn btn-primary"/> <br/>
							</form>
						</center><br>
						<a href="register.jsp">Register now!</a>
					</div>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</body>
</html>