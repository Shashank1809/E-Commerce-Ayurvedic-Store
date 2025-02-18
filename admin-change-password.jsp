<%@include file="config.jsp"%>

<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("admin-logout.jsp");
		return;
	}

	if(request.getParameter("update")!=null){
		String adminid = session.getAttribute("aid").toString();
		String currentpassword = request.getParameter("cpass");
		String newpassword = request.getParameter("newpass");
		ResultSet rs = con.createStatement().executeQuery("SELECT id FROM admin WHERE id="+adminid+" and password='"+currentpassword+"'");
		if(rs.next()){
			con.createStatement().executeUpdate("update admin set password='"+newpassword+"' WHERE id="+adminid);
			out.print("<script>alert('Password changed successfully.');</script>");
			out.print("<script type='text/javascript'> document.location ='admin-change-password.jsp'; </script>");
		}
		else{
			out.print("<script>alert('Current Password is wrong.');</script>");
			out.print("<script type='text/javascript'> document.location ='admin-change-password.jsp'; </script>");
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
	    <title>AyurCart | Admin Change Password</title>
		<link href="css/admin-styles.css" rel="stylesheet" />
		<script src="js/all.min.js" crossorigin="anonymous"></script>
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
	<body class="sb-nav-fixed">
		<%@include file="admin-header.jsp"%>
		<div id="layoutSidenav">
    		<%@include file="admin-sidebar.jsp"%>
			<div id="layoutSidenav_content">
        		<main>
					<div class="container-fluid px-4">
                		<h1 class="mt-4"> Change Password</h1>
                    	<ol class="breadcrumb mb-4">
                    		<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
                        	<li class="breadcrumb-item active">Change Password</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
								<form method="post" name="chngpwd" onSubmit="return valid();">
     								<div class="row">
										<div class="col-2"><b>Current Password</b></div>
         								<div class="col-6">    
            								<input type="password" class="form-control" id="cpass" name="cpass" required="required">
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
									    <div class="col-6"><input type="password" class="form-control" id="cnfpass" name="cnfpass" required="required" ></div>
									</div>
									<div class="row mt-3">
                 						<div class="col-4">&nbsp;</div>
         								<div class="col-6"><input type="submit" name="update" id="update" class="btn btn-primary" value="Change" required></div>
     								</div>
								</form>
                          	</div>
						</div>
					</div>
				</main>
				<%@include file="admin-footer.jsp"%>
			</div>
		</div>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/admin-scripts.js"></script>
	</body>
</html>