<%@include file="config.jsp"%>

<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("admin-logout.jsp");
		return;
	}

	if(request.getParameter("submit")!=null){
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		int id = Integer.parseInt(request.getParameter("id"));
		PreparedStatement ps = con.prepareStatement("update category set categoryName=?, categoryDescription=? where id = ?");
		ps.setString(1, category);
		ps.setString(2, description);
		ps.setInt(3, id);
		ps.executeUpdate();
		out.print("<script>alert('Category details updated');</script>");
		out.print("<script>window.location.href='manage-categories.jsp'</script>");
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
	    <title>AyurCart | Edit Category</title>
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
	                	<h1 class="mt-4">Edit Category</h1>
	                    <ol class="breadcrumb mb-4">
	                    	<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
							<li class="breadcrumb-item active">Edit Category</li>
	                  	</ol>
						<div class="card mb-4">
	                    	<div class="card-body">
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		ResultSet rs = con.createStatement().executeQuery("select * from category where id="+id);
		rs.next();
	%>	                            	
								<form  method="post">                                
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Category ID</b></div>
										<div class="col-4"><input type="text" value='<%=rs.getString("id")%>' name="id" class="form-control" readOnly></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Category Name</b></div>
										<div class="col-4"><input type="text" value='<%=rs.getString("categoryName")%>' name="category" class="form-control" required></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Category Description</b></div>
										<div class="col-4"><textarea placeholder="Enter category Name"  name="description" class="form-control" required><%=rs.getString("categoryDescription")%></textarea></div>
									</div>
									<div class="row">
										<div class="col-2"><button type="submit" name="submit" class="btn btn-primary">Update</button></div>
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
