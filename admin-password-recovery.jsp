<%@include file="config.jsp"%>
<%
	if(request.getParameter("submit")!=null){
		String email = request.getParameter("email");
		String cnumber = request.getParameter("contactno");
		String newpassword = request.getParameter("inputPassword");
		ResultSet ret = con.createStatement().executeQuery("SELECT * FROM admin WHERE email = '"+email+"' and phone='"+cnumber+"'");
		if(ret.next()){
			con.createStatement().executeUpdate("update admin set password = '"+newpassword+"' WHERE email = '"+email+"' and phone = '"+cnumber+"'");
			out.print("<script>alert('Password reset successfully.');</script>");
			out.print("<script type='text/javascript'> document.location ='admin-index.jsp'; </script>");
		}
		else{
			out.print("<script>alert('Invalid Email or Contact Number');</script>");
			out.print("<script type='text/javascript'> document.location ='admin-password-recovery.jsp'; </script>");
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
	    <title>AyurCart | Admin Password Recovery </title>
	    <link href="css/admin-styles.css" rel="stylesheet" />
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
		<script type="text/javascript">
			function valid(){
	 			if(document.passwordrecovery.inputPassword.value!= document.passwordrecovery.cinputPassword.value){
					alert("Password and Confirm Password Field do not match  !!");
					document.passwordrecovery.cinputPassword.focus();
					return false;
				}
				return true;
			}
		</script>
	</head>

	<body class="bg-primary">
		<div id="layoutAuthentication">
	    	<div id="layoutAuthentication_content">
	        	<main>
	            	<div class="container">
	                	<div class="row justify-content-center">
	                    	<div class="col-lg-5">
	                        	<div class="card shadow-lg border-0 rounded-lg mt-5">
	                            	<div class="card-header"><h3 class="text-center font-weight-light my-4">AyurCart | Admin Password Recovery</h3></div>
	                                    <div class="card-body">
	                                        <form method="post" name="passwordrecovery" onSubmit="return valid();">
	                                            <div class="form-floating mb-3">
	                                                <input class="form-control" id="username" name="email" type="email" placeholder="Email" required>
	                                                <label for="username">Email</label>
	                                            </div>
												<div class="form-floating mb-3">
	                                                <input class="form-control" id="contactno" name="contactno" type="text" pattern="^[6789]\d{9}$" placeholder="Contact Number" required>
	                                                <label for="username">Contact No.</label>
	                                            </div>
	                                            <div class="form-floating mb-3">
	                                                <input class="form-control" id="inputPassword" name="inputPassword" type="password" placeholder="Password" required />
	                                                <label for="inputPassword">New Password</label>
	                                            </div>
	                                             <div class="form-floating mb-3">
	                                                <input class="form-control" id="cinputPassword" name="cinputPassword" type="password" placeholder="Password" required />
	                                                <label for="inputPassword">Confirm Password</label>
	                                            </div>
	                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
	                                                <button type="submit" name="submit" class="btn btn-primary">Submit</button>
	                                            </div>
	                                        </form>
	                                    </div>
	                              		<div class="card-footer text-center py-3">
	                                        <div class="small"><a href="admin-index.jsp">Back to Home Page</a></div>
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
