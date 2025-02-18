<%@include file="config.jsp"%>

<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	if(request.getParameter("takeaction")!=null){
    	String oid = request.getParameter("orderid");
    	String status = request.getParameter("ostatus");
    	String remark = request.getParameter("remark");
    	String actionby = session.getAttribute("aid").toString();
    	String canceledBy = "Admin";
		int n;
    	if(status.equals("Cancelled")){
   			con.createStatement().executeUpdate("insert into ordertrackhistory(orderId,status,remark,actionBy,canceledBy) values("+oid+",'"+status+"','"+remark+"','"+actionby+"','"+canceledBy+"')");
   			n = con.createStatement().executeUpdate("update orders set orderStatus='"+status+"' where id="+oid);
    	}
    	else{
    		con.createStatement().executeUpdate("insert into ordertrackhistory(orderId,status,remark,actionBy) values("+oid+",'"+status+"','"+remark+"','"+actionby+"')");
    		n = con.createStatement().executeUpdate("update orders set orderStatus='"+status+"' where id="+oid);
    	}
   	    
		if(n>0) {
			out.print("<script>alert('Action has been updated successfully')</script>");
			out.print("<script>window.location.href ='all-orders.jsp'</script>");
		}
		else{
			out.print("<script>alert('Something Went Wrong. Please try again.')</script>");
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
    <title>AyurCart | Order Details</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="css/admin-styles.css" rel="stylesheet" />
	<script src="js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<%@include file="admin-header.jsp"%>
	<div id="layoutSidenav">
		<%@include file="admin-sidebar.jsp"%>
		<div id="layoutSidenav_content">
        	<main>
				<tbody>
<% 
	String oid = request.getParameter("orderid");
	ResultSet query = con.createStatement().executeQuery("SELECT orders.id,orderNumber,totalAmount,orderStatus,orderDate,users.contactno,orders.txnType,orders.txnNumber,users.name,users.email,users.contactno,billingAddress,biilingCity,billingState,billingPincode,billingCountry,shippingAddress,shippingCity,shippingState,shippingPincode,shippingCountry FROM orders join users on users.id=orders.userId join addresses on addresses.id=orders.addressId where orders.id="+oid);
	query.next();
	String ostatus = query.getString("orderStatus");					
%>  
					<div class="container-fluid px-4" >
                    	<h1 class="mt-4">#<%=query.getString("orderNumber")%> Details</h1>
                        <div class="card mb-4">
                        	<div class="card-header"><i class="fas fa-table me-1"></i>Order Details</div>
							<div class="card-body" id="print">
								<div class="row">
                                	<div class="col-5">
                                		<table class="table table-bordered" border='1' width="100%">
                                        <tbody>
                                        <tr>
                                            <th colspan="2" style="text-align:center;">Order Details</th>
                                        </tr>
                                        <tr>
                                            <th>Order No.</th>
                                            <td><%=query.getString("orderNumber")%></td>
										</tr>
                                        <tr>
                                            <th>Order Amount</th>
                                            <td><%=query.getString("totalAmount")%></td>
                                        </tr>
                                        <tr>
                                            <th>Order Date</th>
                                            <td><%=query.getString("orderDate")%></td>
                                        </tr>
                                        <tr>
                                            <th>Order Status</th>
											<td><%=query.getString("orderStatus")==null?"Not Processed Yet":query.getString("orderStatus")%></td>
										</tr>
                                        <tr>
                                            <th>Txn Type</th>
                                        	<td><%=query.getString("txnType")%></td>
                                        </tr>
   										<tr>
                                        	<th>Txn Number</th>
                                            <td><%=query.getString("txnNumber")%></td>
                                        </tr>                   
										</tbody>
                                		</table>
                                	</div>
									<div class="col-7" style="float:left;">
        								<table class="table table-bordered" border="1" width="100%">
                                        <tbody>
                                        <tr>
                                            <th colspan="2" style="text-align:center;">Customer/User Details</th>
                                        </tr>
                                        <tr>
                                            <th>Customer/User Name</th>
                                            <td><%=query.getString("name")%></td>
                                        </tr>
                                        <tr>
                                            <th>Email ID</th>
                                            <td><%=query.getString("email")%></td>
                                       	</tr>
                                        <tr>
                                            <th>Contact</th>
                                            <td><%=query.getString("contactno")%></td>
                                        </tr>
                                        <tr>
                                        	<th>Billing Address</th>
                                            <td>
                                            	<%=query.getString("billingAddress")%><br />
                                            	<%=query.getString("biilingCity")%>, <%=query.getString("billingState")%><br />
                                            	<%=query.getString("billingCountry")%>-<%=query.getString("billingPincode")%>
											</td>
                                       	</tr>
										<tr>
                                        	<th>Shipping Address</th>
                                            <td>
                                            	<%=query.getString("shippingAddress")%><br />
                                            	<%=query.getString("shippingCity")%>, <%=query.getString("shippingState")%><br />
                                            	<%=query.getString("shippingCountry")%>-<%=query.getString("shippingPincode")%>
                                           	</td>
                                       	</tr>                  
                                    	</tbody>
                                		</table>
                                	</div>
									<div class="col-12">
        								<table class="table table-bordered" border="1">
                                        <tr>
                                            <th colspan="6" style="text-align:center;">Products / Items Details</th>
                                        </tr>
                                        <tr>
                                            <th>Product</th>
                                            <th>Product Name</th>
                                            <th>Product Price </th>
                                            <th>Product Qty</th>
                                            <th>Total Amount</th>
                                            <th>Shipping Amount</th>
                                        </tr>
<% 
	query = con.createStatement().executeQuery("SELECT products.id as pid,products.productName,products.productImage1,products.productPrice,products.shippingCharge,ordersdetails.quantity FROM ordersdetails JOIN orders on orders.id=ordersdetails.orderId join products on products.id=ordersdetails.productId where orders.id="+oid);
	float grandtotalamount=0, totalamount=0, grandtshipping=0, tshipping=0;
	while(query.next()){
%>  
										<tr>
                    						<td><img src='images/products/<%=query.getString("productImage1")%>' alt='<%=query.getString("productName")%>' width="100" height="100"></td>
                    						<td><a href='edit-product.jsp?id=<%=query.getInt("pid")%>' target="_blank"><%=query.getString("productName")%></a></td>
											<td><%=query.getString("productPrice")%></td>
                    						<td><%=query.getString("quantity")%></td>
                     						<td><%=totalamount=query.getInt("quantity")*query.getFloat("productPrice")%></td>
                        					<td><%=tshipping=query.getInt("shippingCharge")%></td>
										</tr>
<% 
		grandtotalamount+=totalamount;
		grandtshipping+=tshipping;
	} 
%>
										<tr>
										    <th colspan="4" style="text-align:right;">Sub-Total</th>
										    <th><%=grandtotalamount%></th>
										    <th><%=grandtshipping%></th>
										</tr>
										<tr>
    										<th colspan="4" style="text-align:right;">Grand-Total</th>
    										<th colspan="2" style="text-align:center;"><%=grandtotalamount+grandtshipping%></th>
										</tr>
    	                            	</table>
    	                            </div>
<% 
	query = con.createStatement().executeQuery("SELECT remark,status,postingDate,admin.name FROM ordertrackhistory join admin on admin.id=ordertrackhistory.actionBy where ordertrackhistory.orderId="+oid);
	if(query.next()){
%>
 									<div class="col-12">
        								<table class="table table-bordered" border="1" width="100%">
                                        <tr>
                                            <th colspan="6" style="text-align:center;">Order History</th>
                                        </tr>
                                        <tr>
                                            <th>Remark</th>
                                            <th>Status</th>
                                            <th>Remark By </th>
                                            <th>Action Date</th>
                                        </tr>
<% 
		do{
%>  
										<tr>
											<td><%=query.getString("remark")%></td>
											<td><%=query.getString("status")%></td>
											<td><%=query.getString("name")%></td>
											<td><%=query.getString("postingDate")%></td>
            							</tr>
<% 		
		}while(query.next()); 
	}
%>
										</table>
									</div>
<% 
	if(ostatus==null || ostatus.equals("Packed") || ostatus.equals("Dispatched") || ostatus.equals("In Transit") || ostatus.equals("Out For Delivery")){ %>
									<div align="center"><button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Take Action</button></div>
<% 
	}
%>
									<div style="float:right;"><button class="btn btn-primary" style="cursor: pointer;"  OnClick="CallPrint(this.value)" >Print</button></div>
                            	</div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    		<div class="modal-dialog" role="document">
				<form method="post" name="takeaction">
					<div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="exampleModalLabel">Update the Order Status</h5>
			                <button class="btn-close" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
						<div class="modal-body">
						<p>
							<select name="ostatus" class="form-control" required>
    						<option value="">Select</option>
    						<% if(ostatus==null){ %>
						    <option value="Cancelled">Cancel</option>
						    <option value="Packed">Packed</option>
						    <option value="Dispatched">Dispatched</option>
						    <option value="In Transit">In Transit</option>
						    <option value="Out For Delivery">Out For Delivery</option>
						    <option value="Delivered">Delivered</option>
    						<% } else if(ostatus.equals("Packed")){ %>
					        <option value="Dispatched">Dispatched</option>
					    	<option value="In Transit">In Transit</option>
					     	<option value="Out For Delivery">Out For Delivery</option>
					    	<option value="Delivered">Delivered</option>
   							<% } else if(ostatus.equals("Dispatched")){ %>
							<option value="In Transit">In Transit</option>
							<option value="Out For Delivery">Out For Delivery</option>
							<option value="Delivered">Delivered</option>
							<% } else if(ostatus.equals("In Transit")){ %>
							<option value="Out For Delivery">Out For Delivery</option>
							<option value="Delivered">Delivered</option>
    						<% } else if(ostatus.equals("Out For Delivery")){ %>
        					<option value="Delivered">Delivered</option>
        					<% } %>
							</select>
						</p>		
						<p>
							<textarea class="form-control" required name="remark" placeholder="Remark"></textarea>
						</p>
            		</div>
            		<div class="modal-footer">
            			<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">Close</button>
                		<button class="btn btn-primary" type="submit" name="takeaction">Save changes</button>
                	</div>
        		</div>
    			</form>
    		</div>
		</div>
	</div>
	<script src="js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
    <script>
		function CallPrint(strid) {
			var prtContent = document.getElementById("print");
			var WinPrint = window.open('', '', 'left=0,top=0,width=800,height=900,toolbar=0,scrollbars=0,status=0');
			WinPrint.document.write(prtContent.innerHTML);
			WinPrint.document.close();
			WinPrint.focus();
			WinPrint.print();
		}
	</script>
</body>
</html>
