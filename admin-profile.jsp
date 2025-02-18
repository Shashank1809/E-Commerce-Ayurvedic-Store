<%@include file="config.jsp"%>

<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("admin-logout.jsp");
		return;
	}

	if(request.getParameter("submit")!=null){
		String contactno = request.getParameter("cnumber");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String id = session.getAttribute("aid").toString();
		con.createStatement().executeUpdate("update admin set phone = '"+contactno+"', name = '"+name+"', email = '"+email+"' where id="+id);
		session.setAttribute("alogin", name);
		out.print("<script>alert('Profile Updated successfully');</script>");
		out.print("<script>window.location.href='admin-profile.jsp'</script>");
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
	    <title>AyurCart | Admin Profile</title>
	    <link href="css/admin-styles.css" rel="stylesheet" />
		<script src="js/all.min.js" crossorigin="anonymous"></script>
	</head>
	<body class="sb-nav-fixed">
		<%@include file="admin-header.jsp"%>
		<div id="layoutSidenav">
	    	<%@include file="admin-sidebar.jsp"%>
			<div id="layoutSidenav_content">
	        	<main>
					<div class="container-fluid px-4">
	                	<h1 class="mt-4">Update Admin Profile</h1>
	                    <ol class="breadcrumb mb-4">
	                    	<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
	                        <li class="breadcrumb-item active">Update Admin Profile</li>
	                   	</ol>
	                    <div class="card mb-4">
	                    	<div class="card-body">
	<%
		String id = session.getAttribute("aid").toString();
		ResultSet rs = con.createStatement().executeQuery("select * from admin where id="+id);
		rs.next();
	%>	                            	
								<form  method="post">                                
									<div class="row" style="margin-top:1%;">
										<div class="col-3"><b>Name</b></div>
										<div class="col-4"><input type="text" value='<%=rs.getString("name")%>'  name="name" class="form-control" required></div>
									</div>							
									<div class="row" style="margin-top:1%;">
										<div class="col-3"><b>Email (used for login)</b></div>
										<div class="col-4"><input type="email" value='<%=rs.getString("email")%>'  name="email" class="form-control" required></div>
									</div>							
									<div class="row" style="margin-top:1%;">
										<div class="col-3"><b>Contact No.</b></div>
										<div class="col-4"><input type="text" value='<%=rs.getString("phone")%>'  name="cnumber" class="form-control" pattern="^[6789]\d{9}$" required></div>
									</div>								
									<div class="row" style="margin-top:1%;">
										<div class="col-7" align="center"><button type="submit" name="submit" class="btn btn-primary">Update</button></div>
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
