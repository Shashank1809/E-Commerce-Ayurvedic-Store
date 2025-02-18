<%@include file="config.jsp"%>
<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("admin-index.jsp");
		return;
	}

	ResultSet rsid = con.createStatement().executeQuery("SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ayurcart_db' AND TABLE_NAME = 'products';");
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
	    <title>AyurCart | Add Product</title>
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
	                	<h1 class="mt-4">Add Product</h1>
	                    <ol class="breadcrumb mb-4">
	                    	<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
	                        <li class="breadcrumb-item active">Add Product</li>
	                   	</ol>
						<div class="card mb-4">
	                    	<div class="card-body">
								<form action="AddProductServlet" method="post" enctype="multipart/form-data">                                
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product ID</b></div>
										<div class="col-4">
											<input type="text" name="productId" class="form-control" value="<%=id%>" readOnly>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Category Name</b></div>
										<div class="col-4">
											<select name="category" id="category" class="form-control" required>
												<option value="">Select Category</option> 
	<% 
		ResultSet query = con.createStatement().executeQuery("select * from category");
		while(query.next()){
	%>
												<option value='<%=query.getString("id")%>'><%=query.getString("categoryName")%></option>
	<%	} %>
											</select>    
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand Name</b></div>
										<div class="col-4">
											<select name="brand" id="brand" class="form-control" required>
												<option value="">Select Category</option> 
	<% 
		query = con.createStatement().executeQuery("select * from brand");
		while(query.next()){
	%>
												<option value='<%=query.getString("id")%>'><%=query.getString("brandName")%></option>
	<%	} %>
											</select>    
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Name</b></div>
										<div class="col-4">
											<input type="text" name="productName" placeholder="Enter Product Name" class="form-control" required>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Price Before Discount</b></div>
										<div class="col-4">
											<input type="text" name="productpricebd" placeholder="Enter Product Price" class="form-control" required>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Price After Discount(Selling Price)</b></div>
										<div class="col-4">
											<input type="text" name="productprice" placeholder="Enter Product Price" class="form-control" required>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Description</b></div>
										<div class="col-4">
											<textarea name="productDescription" placeholder="Enter Product Description" rows="6" class="form-control"></textarea>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Shipping Charge</b></div>
										<div class="col-4">
											<input type="text" name="productShippingcharge" placeholder="Enter Product Shipping Charge" class="form-control" required>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Availability</b></div>
										<div class="col-4">
											<select name="productAvailability" id="productAvailability" class="form-control" required>
											<option value="">Select</option>
											<option value="In Stock">In Stock</option>
											<option value="Out of Stock">Out of Stock</option>
											</select>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Featured Image</b></div>
										<div class="col-4"><input type="file" name="productimage1" id="productimage1"  class="form-control" accept="image/*" title="Accept images only" required></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Image 2</b></div>
										<div class="col-4"><input type="file" name="productimage2"  class="form-control" accept="image/*" title="Accept images only" required></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Image 3</b></div>
										<div class="col-4"><input type="file" name="productimage3"  class="form-control" accept="image/*" title="Accept images only" required></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Mfg Date</b></div>
										<div class="col-4">
											<input type="date" name="mfgDate" class="form-control" required>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Exp Date</b></div>
										<div class="col-4">
											<input type="date" name="expDate" class="form-control" required>
										</div>
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
