<%@include file="config.jsp"%>
<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("admin-index.jsp");
		return;
	}
	if(request.getParameter("submit")!=null){
    	int bid = Integer.parseInt(request.getParameter("brandId"));
    	String bname = request.getParameter("brandName");
    	String bdesc = request.getParameter("brandDescription");
    	String baddr = request.getParameter("brandAddress");

		PreparedStatement ps = con.prepareStatement("update brand set brandName = ?, brandDescription = ?, brandAddress = ? where id = ?");
		ps.setString(1, bname);
		ps.setString(2, bdesc);
		ps.setString(3, baddr);
		ps.setInt(4, bid);
		ps.executeUpdate();
		
		out.print("<script>alert('Brand details updated successfully');</script>");
		out.print("<script>window.location.href='manage-brands.jsp'</script>");
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
	    <title>AyurCart | Edit Brand</title>
		<link href="css/admin-styles.css" rel="stylesheet" />
	    <script src="js/all.min.js" crossorigin="anonymous"></script>
	    <script src="js/jquery-3.5.1.min.js"></script>
	</head>
	<body>
		<%@include file="admin-header.jsp"%>
		<div id="layoutSidenav">
			<%@include file="admin-sidebar.jsp"%>
			<div id="layoutSidenav_content">
	        	<main>
	            	<div class="container-fluid px-4">
	                	<h1 class="mt-4">Edit Product</h1>
	                    <ol class="breadcrumb mb-4">
	                    	<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
	                        <li class="breadcrumb-item active">Edit Product</li>
	                   	</ol>
						<div class="card mb-4">
	                    	<div class="card-body">
	<% 
		String bid = request.getParameter("id");
		ResultSet query = con.createStatement().executeQuery("select * from brand where id = " + bid);
		query.next();
	%>                                 
								<form  method="post">                                
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand ID</b></div>
										<div class="col-6"><input type="text" name="brandId" value='<%=query.getString("id")%>' class="form-control" readOnly></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand Name</b></div>
										<div class="col-6"><input type="text" name="brandName" value='<%=query.getString("brandName")%>' class="form-control" required></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand Description</b></div>
										<div class="col-6"><textarea  name="brandDescription"  rows="6" class="form-control"><%=query.getString("brandDescription")%></textarea></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand Address</b></div>
										<div class="col-6"><textarea  name="brandAddress"  rows="6" class="form-control"><%=query.getString("brandAddress")%></textarea></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand Image</b></div>
										<div class="col-6">
											<img src='images/brands/<%=query.getString("id")%>.jpg' width="250"><br><br>
									    	<a href='change-brand-image.jsp?id=<%=query.getInt("id")%>' class="btn btn-danger">Change Image</a>
										</div>
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
