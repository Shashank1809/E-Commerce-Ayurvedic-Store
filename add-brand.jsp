<%@include file="config.jsp"%>
<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("admin-index.jsp");
		return;
	}

	ResultSet rsid = con.createStatement().executeQuery("SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ayurcart_db' AND TABLE_NAME = 'brand';");
	rsid.next();
	int id = rsid.getInt(1);
	
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	    <meta name="description" content="" />
	    <meta name="author" content="" />
	    <title>AyurCart | Add Brand</title>
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
	                	<h1 class="mt-4">Add Brand</h1>
	                    <ol class="breadcrumb mb-4">
	                    	<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
	                        <li class="breadcrumb-item active">Add Brand</li>
	                   	</ol>
						<div class="card mb-4">
	                    	<div class="card-body">
								<form action="AddBrandServlet" method="post" enctype="multipart/form-data">                                
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand ID</b></div>
										<div class="col-4">
											<input type="text" name="brandId" class="form-control" value="<%=id%>" readOnly>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand Name</b></div>
										<div class="col-4">
											<input type="text" name="brandName" placeholder="Enter Brand Name" class="form-control" required>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand Description</b></div>
										<div class="col-4">
											<textarea name="brandDescription" placeholder="Enter Brand Description" rows="6" class="form-control"></textarea>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand Address</b></div>
										<div class="col-4">
											<textarea name="brandAddress" placeholder="Enter Brand Address" rows="6" class="form-control"></textarea>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand Image</b></div>
										<div class="col-4"><input type="file" name="brandimage" id="brandimage"  class="form-control" accept="image/*" title="Accept images only" required></div>
									</div>
									<div class="row">
										<div class="col-2"><button type="submit" name="submit" class="btn btn-primary">Submit</button></div>
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
