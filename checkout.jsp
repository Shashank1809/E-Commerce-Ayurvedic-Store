<%@include file="config.jsp"%>

<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	if(request.getParameter("del")!=null){
		String wid = request.getParameter("del");
		con.createStatement().executeUpdate("delete from cart where id="+wid);
 		out.print("<script>alert('Product deleted from cart.');</script>");
		out.print("<script type='text/javascript'> document.location ='checkout.jsp'; </script>");
	}
	if(request.getParameter("submit")!=null){
		String uid = session.getAttribute("id").toString();    
		String baddress=request.getParameter("baddress");
		String bcity=request.getParameter("bcity");
		String bstate=request.getParameter("bstate");
		String bpincode=request.getParameter("bpincode");
		String bcountry=request.getParameter("bcountry");
		String saddress=request.getParameter("saddress");
		String scity=request.getParameter("scity");
		String sstate=request.getParameter("sstate");
		String spincode=request.getParameter("spincode");
		String scountry=request.getParameter("scountry");

		PreparedStatement ps = con.prepareStatement("insert into addresses(userId,billingAddress,biilingCity,billingState,billingPincode,billingCountry,shippingAddress,shippingCity,shippingState,shippingPincode,shippingCountry) values(?,?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1, Integer.parseInt(uid));
		ps.setString(2, baddress);
		ps.setString(3, bcity);
		ps.setString(4, bstate);
		ps.setString(5, bpincode);
		ps.setString(6, bcountry);
		ps.setString(7, saddress);
		ps.setString(8, scity);
		ps.setString(9, sstate);
		ps.setString(10, spincode);
		ps.setString(11, scountry);
		int n = ps.executeUpdate();
		if(n>0){
    		out.print("<script>alert('You Address added successfully');</script>");
    		out.print("<script type='text/javascript'> document.location ='checkout.jsp'; </script>");
		}
		else{
			out.print("<script>alert('Something went wrong. Please try again.');</script>");
    		out.print("<script type='text/javascript'> document.location ='checkout.jsp'; </script>");
		}
	}
	if(request.getParameter("proceedpayment")!=null){
 		String address = request.getParameter("selectedaddress");  
 		String gtotal = request.getParameter("grandtotal"); 
 		session.setAttribute("address", address);
 		session.setAttribute("gtotal", gtotal);
   		out.print("<script type='text/javascript'> document.location ='payment.jsp'; </script>");   
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>AyurCart | Checkout</title>
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
            	<h1 class="display-4 fw-bolder">Checkout</h1>
           	</div>
		</div>
	</header>
	<section class="py-5">
    	<div class="container px-4  mt-5">
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
	float grantotal=0, totalamount=0;
    if(ret.next()){
		do {
%>
					<tr>
                    	<td class="col-md-2"><img src='images/products/<%=ret.getString("pimage")%>' alt='<%=ret.getString("pname")%>' width="100" height="100"></td>
                    	<td><a href='product-details.jsp?pid=<%=ret.getInt("pid")%>'><%=ret.getString("pname")%></a></td>
						<td>
                        	<span class="text-decoration-line-through">&#8377; <%=ret.getString("productPriceBeforeDiscount")%></span>
                            <span>&#8377; <%=ret.getString("pprice")%></span>
                    	</td>
                    	<td><%=ret.getInt("productQty")%></td>
                     	<td><%=totalamount=ret.getInt("productQty")*ret.getFloat("pprice")%></td>
                    	<td><a href='my-cart.jsp?del=<%=ret.getInt("cartid")%>' onClick="return confirm('Are you sure you want to delete?')" class="btn-upper btn btn-danger">Delete</a></td>
                	</tr>
<% 
			grantotal+=totalamount;
		}while(ret.next()); 
%>
					<tr>
					    <th colspan="4">Grand Total</th>
					    <th colspan="2"><%=grantotal%></th>
					</tr>
<% 
	} 
    else{  
		out.print("<script type='text/javascript'> document.location ='my-cart.jsp'; </script>"); 
	} 
%>   
 				</tbody>
        	</table>
			<h5>Already Listed Addresses</h5>
<% 
	ResultSet query = con.createStatement().executeQuery("select * from addresses where userId="+uid);
	if(!query.next()){
		out.print("<font color='red'>No addresses Found.</font>");
	}
	else{
%>
			<form method="post">
				<input type="hidden" name="grandtotal" value='<%=grantotal%>'>
				<div class="row">
					<div class="col-6">
      					<table class="table">
            			<thead>
                			<tr>
                    			<th colspan="4"><h5>Billing Address</h5></th>
                			</tr>
            			</thead>
						<thead>
							<tr>
			                    <th>#</th>
			                    <th width="250">Address</th>
			                    <th>City</th>
			                    <th>State</th>
			                    <th>Pincode</th>
			                    <th>Country</th>
							</tr>            
                		</thead>
						</table>  
					</div>
					<div class="col-6">
          				<table class="table">
				            <thead>
				                <tr>
				                    <th colspan="4"><h5>Shipping Address</h5></th>
				                </tr>
				            </thead>
			                <thead>
			                    <tr>
				                    <th width="250">Address</th>
				                    <th>City</th>
				                    <th>State</th>
				                    <th>Pincode</th>
				                    <th>Country</th>
								</tr>           
			                </thead>
						</table> 
					</div>
				</div>
				<div class="row">
					<div class="col-6">
      					<table class="table">
				            <tbody> 
				                <tr>
				                    <td><input type="radio" name="selectedaddress" value='<%=query.getInt("id")%>' required></td>
				                    <td width="250"><%=query.getString("billingAddress")%></td>
				                    <td><%=query.getString("biilingCity")%></td>
				                    <td><%=query.getString("billingState")%></td>
				                    <td><%=query.getString("billingPincode")%></td>
				                    <td><%=query.getString("billingCountry")%></td>
				                </tr>
            				</tbody>
            			</table>  
					</div>
					<div class="col-6">
          				<table class="table">
            				<tbody> 
                				<tr>
				                    <td width="250"><%=query.getString("shippingAddress")%></td>
				                    <td><%=query.getString("shippingCity")%></td>
				                    <td><%=query.getString("shippingState")%></td>
				                    <td><%=query.getString("shippingPincode")%></td>
				                    <td><%=query.getString("shippingCountry")%></td>
				                </tr>
            				</tbody>
            			</table> 
					</div>
				</div>
<%	} %>
				<div align="right">
					<button class="btn-upper btn btn-primary" type="submit" name="proceedpayment">Procced for Payment</button>
				</div>
			</form>
			<hr>
			<form method="post" name="address">
				<div class="row">
					<div class="col-6">
				    	<div class="row">
				        	<div class="col-9" align="center"><h5>New Billing Address</h5><br></div>
				        	<hr>
				     	</div>
				     	<div class="row">
				        	<div class="col-3">Address</div>
				         	<div class="col-6"><input type="text" name="baddress" id="baddress" class="form-control" required ></div>
				     	</div>
				       	<div class="row mt-3">
				        	<div class="col-3">City</div>
				         	<div class="col-6"><input type="text" name="bcity" id="bcity"  class="form-control" required></div>
						</div>
						<div class="row mt-3">
							<div class="col-3">State</div>
							<div class="col-6"><input type="text" name="bstate" id="bstate" class="form-control" required></div>
						</div>
						<div class="row mt-3">
							<div class="col-3">Pincode</div>
							<div class="col-6"><input type="text" name="bpincode" id="bpincode" pattern="^\d{6}$" title="Only numbers" maxlength="6" class="form-control" required></div>
						</div>
						<div class="row mt-3">
							<div class="col-3">Country</div>
							<div class="col-6"><input type="text" name="bcountry" id="bcountry" class="form-control" required></div>
						</div>
					</div>
				    <div class="col-6">
				    	<div class="row">
				        	<div class="col-9" align="center"><h5>New Shipping Address</h5> 
				            	<input type="checkbox" name="adcheck" value="1"/>
				            	<small>Shipping Adress same as billing Address</small>
				            </div>
				         	<hr>
				     	</div>
						<div class="row">
							<div class="col-3">Address</div>
							<div class="col-6"><input type="text" name="saddress"  id="saddress" class="form-control" required ></div>
						</div>
						<div class="row mt-3">
							<div class="col-3">City</div>
							<div class="col-6"><input type="text" name="scity" id="scity" class="form-control" required></div>
						</div>
						<div class="row mt-3">
							<div class="col-3">State</div>
							<div class="col-6"><input type="text" name="sstate" id="sstate" class="form-control" required></div>
						</div>
						<div class="row mt-3">
							<div class="col-3">Pincode</div>
							<div class="col-6"><input type="text" name="spincode" id="spincode" pattern="^\d{6}$" title="only numbers" maxlength="6" class="form-control" required></div>
						</div>
						<div class="row mt-3">
							<div class="col-3">Country</div>
							<div class="col-6"><input type="text" name="scountry" id="scountry" class="form-control" required></div>
						</div>
					</div>
				    <div class="row mt-3">
				    	<div class="col-5">&nbsp;</div>
				        <div class="col-6"><input type="submit" name="submit" id="submit" class="btn btn-primary" value="Add" required></div>
				    </div>
				</div>
			</form>
		</div>
	</section>
	<%@include file="footer.jsp"%>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){
	        $('input[type="checkbox"]').click(function(){
	            if($(this).prop("checked") == true){
	                $('#saddress').val($('#baddress').val() );
	                $('#scity').val($('#bcity').val());
	                $('#sstate').val($('#bstate').val());
	                $('#spincode').val( $('#bpincode').val());
	                  $('#scountry').val($('#bcountry').val() );
	            } 
	            
	        });
	    });
	</script>
</body>
</html>
