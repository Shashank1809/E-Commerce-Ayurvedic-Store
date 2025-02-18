<%@include file="config.jsp"%>
<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("admin-index.jsp");
		return;
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
	    <title>AyurCart | Update Image</title>
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
	                	<h1 class="mt-4">Update Image</h1>
	                    <ol class="breadcrumb mb-4">
	                    	<li class="breadcrumb-item"><a href="admin-dashboard.php">Dashboard</a></li>
	                        <li class="breadcrumb-item active">Update Image</li>
	                   	</ol>
						<div class="card mb-4">
	                    	<div class="card-body">
	<% 
		String pid = request.getParameter("id");
		ResultSet query = con.createStatement().executeQuery("select * from products where id="+pid);
		query.next();
	%>                                 
								<form  method="post" action="UpdateProductImage1" enctype="multipart/form-data">                                
									<input type="hidden" name="name" value='<%=query.getString("productImage1")%>'>
									<input type="hidden" name="id" value='<%=query.getString("id")%>'>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Name</b></div>
										<div class="col-4"><input type="text" name="productName" value='<%=query.getString("productName")%>' class="form-control" required></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Featured Image</b></div>
										<div class="col-4"><img src='images/products/<%=query.getString("productImage1")%>' width="250"><br></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Featured Image</b></div>
										<div class="col-4"><input type="file" name="productimage1" id="productimage1"  class="form-control" accept="image/*" title="Accept images only" required></div>
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
