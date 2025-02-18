<%@include file="config.jsp"%>

<%
	if(request.getParameter("login")!=null){
		String email = request.getParameter("emailid");
		String password = request.getParameter("inputuserpwd");
		ResultSet rs = con.createStatement().executeQuery("SELECT id,name FROM users WHERE email='"+email+"' and password='"+password+"'");
		if(rs.next()){
			session.setAttribute("login", email);
			session.setAttribute("id", rs.getString("id"));
			session.setAttribute("username", rs.getString("name"));
			out.print("<script type='text/javascript'> document.location ='index.jsp'; </script>");
		}
		else{
    		out.print("<script>alert('Invalid login details');</script>");
    		out.print("<script type='text/javascript'> document.location ='login.jsp'; </script>");
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>AyurCart | User Sign up</title>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link href="css/styles.css" rel="stylesheet" />
	<script src="js/jquery.min.js"></script>
	<style type="text/css">
    	input { 
    		border:solid 1px #000;
    	}
	</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<header class="bg-dark py-5">
    	<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
            	<h1 class="display-4 fw-bolder">User Login /Signin </h1>
              	<p class="lead fw-normal text-white-50 mb-0">Login is required to make the order</p>
         	</div>
		</div>
	</header>
	<section class="py-5">
    	<div class="container px-4  mt-5">
			<form method="post" name="login">
				<div class="row mt-3">
         			<div class="col-2"><b>Email ID</b></div>
         			<div class="col-6">
         				<input type="email" name="emailid" id="emailid" class="form-control" onBlur="emailAvailability()" required>
         				<span id="user-email-status" style="font-size:12px;"></span>
         			</div>
				</div>
				<div class="row mt-3">
         			<div class="col-2"><b>Password</b></div>
         			<div class="col-6">
         				<input type="password" name="inputuserpwd" class="form-control" required>
         				<small><a href="password-recovery.jsp" style="text-decoration: none;padding: 10px;">Forgot Password?</a></small>
         			</div>
				</div>
				<div class="row mt-3">
                	<div class="col-4">&nbsp;</div>
         			<div class="col-6">
         				<input type="submit" name="login" id="login" class="btn btn-primary" value="Login" required>
         			</div>
     			</div>
 			</form>
		</div>
  	</section>
	<%@include file="footer.jsp"%>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
