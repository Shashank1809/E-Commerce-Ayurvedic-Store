<%@include file="config.jsp"%>
<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("admin-index.jsp");
		return;
	}
	if(request.getParameter("submit")!=null){
    	int pid = Integer.parseInt(request.getParameter("id"));
    	int category = Integer.parseInt(request.getParameter("category"));
    	int brand = Integer.parseInt(request.getParameter("brand"));
    	String productname = request.getParameter("productName");
    	float productprice = Float.parseFloat(request.getParameter("productprice"));
    	float productpricebd = Float.parseFloat(request.getParameter("productpricebd"));
    	String productdescription = request.getParameter("productDescription");
    	float productscharge = Float.parseFloat(request.getParameter("productShippingcharge"));
    	String productavailability = request.getParameter("productAvailability");
    	String mfgdate = request.getParameter("mfgDate");
    	String expdate = request.getParameter("expDate");

		PreparedStatement ps = con.prepareStatement("update products set categoryId=?,brandId=?,productName=?,productPrice=?,productDescription=?,shippingCharge=?,productAvailability=?,productPriceBeforeDiscount=?,mfgDate=?,expDate=? where id=?");
		ps.setInt(1, category);
		ps.setInt(2, brand);
		ps.setString(3, productname);
		ps.setFloat(4, productprice);
		ps.setString(5, productdescription);
		ps.setFloat(6, productscharge);
		ps.setString(7, productavailability);
		ps.setFloat(8, productpricebd);
		ps.setString(9, mfgdate);
		ps.setString(10, expdate);
		ps.setInt(11, pid);
		ps.executeUpdate();
		
		out.print("<script>alert('Product details updated successfully');</script>");
		out.print("<script>window.location.href='manage-products.jsp'</script>");
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
	    <title>AyurCart | Edit Product</title>
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
		String pid = request.getParameter("id");
		ResultSet query = con.createStatement().executeQuery("select products.id as pid,products.productImage1,products.productImage2,products.productImage3,products.productName,category.categoryName,brand.brandName as brandName,products.mfgDate,products.expDate,brand.id as brandid,category.id as catid,products.productPrice,products.productPriceBeforeDiscount,products.productAvailability,products.productDescription,products.shippingCharge from products join brand on products.brandId=brand.id join category on products.categoryId=category.id where products.id="+pid);
		query.next();
	%>                                 
								<form  method="post">                                
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product ID</b></div>
										<div class="col-6"><input type="text" name="id" value='<%=query.getString("pid")%>' class="form-control" readOnly></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Category Name</b></div>
										<div class="col-6">
											<select name="category" id="category" class="form-control" required>
											<option value='<%=query.getInt("catid")%>'><%=query.getString("categoryName")%></option> 
	<% 
		ResultSet ret = con.createStatement().executeQuery("select * from category");
		while(ret.next()){
	%>
											<option value='<%=ret.getInt("id")%>'><%=ret.getString("categoryName")%></option>
	<%	} %>
											</select>    
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Brand Name</b></div>
										<div class="col-6">
											<select name="brand" id="brand" class="form-control" required>
											<option value='<%=query.getInt("brandid")%>'><%=query.getString("brandName")%></option> 
	<% 
		ret = con.createStatement().executeQuery("select * from brand");
		while(ret.next()){
	%>
											<option value='<%=ret.getInt("id")%>'><%=ret.getString("brandName")%></option>
	<%	} %>
											</select>    
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Name</b></div>
										<div class="col-6"><input type="text" name="productName" value='<%=query.getString("productName")%>' class="form-control" required></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Price Before Discount</b></div>
										<div class="col-6"><input type="text" name="productpricebd" value='<%=query.getString("productPriceBeforeDiscount")%>' class="form-control" required></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Price After Discount(Selling Price)</b></div>
										<div class="col-6"><input type="text" name="productprice" value='<%=query.getString("productPrice")%>' class="form-control" required></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Description</b></div>
										<div class="col-6"><textarea  name="productDescription"  placeholder="Enter Product Description" rows="6" class="form-control"><%=query.getString("productDescription")%></textarea></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Shipping Charge</b></div>
										<div class="col-6"><input type="text" name="productShippingcharge"  value='<%=query.getString("shippingCharge")%>' class="form-control" required></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Availability</b></div>
										<div class="col-6">
											<select name="productAvailability" id="productAvailability" class="form-control" required>
	<%
		String pa = query.getString("productAvailability");
		if(pa.equals("In Stock")){
	%>
											<option value="In Stock">In Stock</option>
											<option value="Out of Stock">Out of Stock</option>
	<%	} else { %>
											<option value="Out of Stock">Out of Stock</option>    
											<option value="In Stock">In Stock</option>
	<%	} %>
											</select>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Featured Image</b></div>
										<div class="col-6">
											<img src='images/products/<%=query.getString("productImage1")%>' width="250"><br><br>
									    	<a href='change-image1.jsp?id=<%=query.getInt("pid")%>' class="btn btn-danger">Change Image</a>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Image 2</b></div>
										<div class="col-6">
											<img src='images/products/<%=query.getString("productImage2")%>' width="250"><br><br>
									    	<a href='change-image2.jsp?id=<%=query.getInt("pid")%>' class="btn btn-danger">Change Image</a>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Product Image 3</b></div>
										<div class="col-6">
											<img src='images/products/<%=query.getString("productImage3")%>' width="250"><br><br>
									    	<a href='change-image3.jsp?id=<%=query.getInt("pid")%>' class="btn btn-danger">Change Image</a>
										</div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Mfg Date</b></div>
										<div class="col-6"><input type="date" name="mfgDate"  value='<%=query.getString("mfgDate")%>' class="form-control" required></div>
									</div>
									<div class="row" style="margin-top:1%;">
										<div class="col-2"><b>Exp Date</b></div>
										<div class="col-6"><input type="date" name="expDate"  value='<%=query.getString("expDate")%>' class="form-control" required></div>
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
