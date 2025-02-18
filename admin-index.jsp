<%@include file="config.jsp"%>
<%
	if(request.getParameter("submit")!=null){
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		ResultSet ret = con.createStatement().executeQuery("SELECT * FROM admin WHERE email = '"+email+"' and password = '"+password+"'");
		if(ret.next()){
			session.setAttribute("alogin", ret.getString("name"));
			session.setAttribute("aid", ret.getString("id"));
			response.sendRedirect("admin-dashboard.jsp");
		}
		else{
			out.print("<script>alert('Invalid email or password');</script>");
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	    <meta name="description" content="" />
	    <meta name="author" content="" />
	    <title>AyurCart | Admin Login</title>
	    <link href="css/styles.css" rel="stylesheet" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	</head>
	<body class="bg-primary">
		<div id="layoutAuthentication">
	    	<div id="layoutAuthentication_content">
	        	<main>
	            	<div class="container">
	                	<div class="row justify-content-center">
	                    	<div class="col-lg-5">
	                        	<div class="card shadow-lg border-0 rounded-lg mt-5">
	                            	<div class="card-header"><h3 class="text-center font-weight-light my-4">AyurCart | Admin Login</h3></div>
									<div class="card-body">
	                                	<form method="post">
	                                    	<div class="form-floating mb-3">
	                                        	<input class="form-control" id="username" name="email" type="text" placeholder="Email" required />
	                                            <label for="username">Email</label>
	                                      	</div>
	                                        <div class="form-floating mb-3">
	                                        	<input class="form-control" id="inputPassword" name="password" type="password" placeholder="Password" required />
	                                            <label for="inputPassword">Password</label>
	                                       	</div>
											<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
	                                        	<a class="small" href="admin-password-recovery.jsp" style="text-decoration: none;">Forgot Password?</a>
	                                            <button type="submit" name="submit" class="btn btn-primary">Login</button>
	                                       	</div>
	                                 	</form>
	                              	</div>
	                              	<div class="card-footer text-center py-3">
	                                	<div class="small"><a href="index.jsp" style="text-decoration: none;">Back to Home Page</a></div>
	                               	</div>
	                       		</div>
	                   		</div>
	                	</div>
					</div>
				</main>
			</div>
		</div>
	    <script src="js/bootstrap.bundle.min.js"></script>
	    <script src="js/scripts.js"></script>
	</body>
</html>
