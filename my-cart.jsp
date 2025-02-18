<%@include file="config.jsp"%>

<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	if(request.getParameter("del")!=null)
	{
		String wid = request.getParameter("del");
		con.createStatement().executeUpdate("delete from cart where id="+wid);
	 	out.print("<script>alert('Product deleted from cart.');</script>");
		out.print("<script type='text/javascript'> document.location ='my-cart.jsp'; </script>");
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>AyurCart | My Cart</title>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link href="css/styles.css" rel="stylesheet" />
	<script src="js/jquery.min.js"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<header class="bg-dark py-5">
    	<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
            	<h1 class="display-4 fw-bolder">Cart</h1>
           	</div>
		</div>
	</header>
	<section class="py-5">
    	<div class="container px-4  mt-5">
			<div class="table-responsive">
        		<table class="table">
            	<thead>
                	<tr>
                    	<th colspan="4"><h4>My Cart</h4></th>
                	</tr>
            	</thead>
                <thead>
					<tr>
	                    <th>Product</th>
	                    <th>Product Name</th>
	                    <th>Product Price</th>
	                    <th>Quantity</th>
	                    <th>Total Amount</th>
	                    <th>Action</th>
					</tr>
                </thead>
				<tbody>
<% 
	String uid = session.getAttribute("id").toString();
	ResultSet ret = con.createStatement().executeQuery("select products.productName as pname,products.productName as proid,products.productImage1 as pimage,products.productPrice as pprice,cart.productId as pid,cart.id as cartid,products.productPriceBeforeDiscount,cart.productQty from cart join products on products.id=cart.productId where cart.userId="+uid);
	if(ret.next())
    {
		do{
%>
					<tr>
                    	<td class="col-md-2"><img src='images/products/<%=ret.getString("pimage")%>' alt='<%=ret.getString("pname")%>' width="100" height="100"></td>
                    	<td><a href='product-details.jsp?pid=<%=ret.getInt("pid")%>'><%=ret.getString("pname")%></a></td>
						<td>
                        	<span class="text-decoration-line-through">&#8377; <%=ret.getFloat("productPriceBeforeDiscount")%></span>
                            <span>&#8377; <%=ret.getFloat("pprice")%></span>
                    	</td>
                    	<td><%=ret.getInt("productQty")%></td>
                     	<td><%=ret.getInt("productQty")*ret.getFloat("pprice")%></td>
                    	<td><a href='my-cart.jsp?del=<%=ret.getInt("cartid")%>' onClick="return confirm('Are you sure you want to delete?')" class="btn-upper btn btn-danger">Delete</a></td>
                	</tr>
<% 		}while(ret.next()); %>
    				<tr>
                		<td colspan="6" style="text-align:right;">
							<a href="shop-categories.jsp" class="btn-upper btn btn-warning">Continue Shopping</a>
                			<a href="checkout.jsp" class="btn-upper btn btn-primary">Procced for Checkout</a>
                    	</td>
                	</tr>
<% 
	} 
	else{ 
%>
					<tr>
                    	<td style="font-size: 18px; font-weight:bold ">Your Cart is Empty.&nbsp;<a href="shop-categories.jsp" class="btn-upper btn btn-warning">Continue Shopping</a></td>
					</tr>
<%	} %>
				</tbody>
        		</table>
   			</div>
		</div>
	</section>
   	<%@include file="footer.jsp"%>
	<script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
