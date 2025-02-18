<%@include file="config.jsp"%>

<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	if(request.getParameter("update")!=null){
		String currentpwd = request.getParameter("cpass");
		String newpwd = request.getParameter("newpass");
		String uid = session.getAttribute("id").toString();
		ResultSet rs = con.createStatement().executeQuery("SELECT id FROM  users where password='"+currentpwd+"' and id="+uid);
		if(rs.next()){
 			con.createStatement().executeUpdate("update users set password='"+newpwd+"' where id="+uid);
			out.print("<script>alert('Password Changed Successfully !!');</script>");
 			out.print("<script type='text/javascript'> document.location ='change-password.jsp'; </script>");
		}
		else{
    		out.print("<script>alert('Current Password not match !!');</script>");
     		out.print("<script type='text/javascript'> document.location ='change-password.jsp'; </script>");
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
    <title>AyurCart | Change Password</title>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link href="css/styles.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
	<script type="text/javascript">
		function valid(){
			if(document.chngpwd.newpass.value!= document.chngpwd.cnfpass.value){
				alert("Password and Confirm Password Field do not match  !!");
				document.chngpwd.cnfpass.focus();
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<header class="bg-dark py-5">
    	<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
            	<h1 class="display-4 fw-bolder">Change Password</h1>
			</div>
		</div>
	</header>
	<section class="py-5">
    	<div class="container px-4  mt-5">
			<form method="post" name="chngpwd" onSubmit="return valid();">
     		<div class="row">
         		<div class="col-2"><b>Current Password</b></div>
         		<div class="col-6">    
            		<input type="password" class="form-control" id="cpass" name="cpass" required>
            	</div>
     		</div>
       		<div class="row mt-3">
         		<div class="col-2"><b>New Password</b></div>
         		<div class="col-6">
     				<input type="password" class="form-control" id="newpass" name="newpass" required>
         		</div>
			</div>
       		<div class="row mt-3">
         		<div class="col-2"><b>Confirm Password</b></div>
         		<div class="col-6">
         			<input type="password" class="form-control" id="cnfpass" name="cnfpass" required>
         		</div>
     		</div>
			<div class="row mt-3">
            	<div class="col-4">&nbsp;</div>
         		<div class="col-6">
         			<input type="submit" name="update" id="update" class="btn btn-primary" value="Update" required>
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
