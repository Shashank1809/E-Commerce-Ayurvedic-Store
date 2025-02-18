<%@include file="config.jsp"%>

<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>AyurCart | My Orders</title>
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
            	<h1 class="display-4 fw-bolder">My Orders</h1>
           	</div>
		</div>
   	</header>
	<section class="py-5">
    	<div class="container px-4  mt-5">
			<div class="table-responsive">
        		<table class="table">
            	<thead>
	                <tr>
	                    <th colspan="4"><h4>My Orders</h4></th>
	                </tr>
            	</thead>
                <thead>
					<tr>
	                    <th>#</th>
	                    <th>Order Number </th>
	                    <th>Order Date</th>
	                    <th>Transaction Type</th>
	                    <th>Total Amount</th>
	                    <th>Order Status</th>
	                    <th>Action</th>
	              	</tr>
                </thead>
				<tbody>
<%
	String uid = session.getAttribute("id").toString();
	ResultSet ret = con.createStatement().executeQuery("select * from orders where userId="+uid);
	int cnt=1;
    if(ret.next()){
		do{
%>
	                <tr>
	                    <td><%=cnt++%></td>
	                    <td><%=ret.getString("orderNumber")%></td>
	                    <td><%=ret.getString("orderDate")%></td>
	                    <td><%=ret.getString("txnType")%></td>
	                    <td><%=ret.getString("totalAmount")%></td>
                    	<td><%=ret.getString("orderStatus")==null?"Not Processed Yet":ret.getString("orderStatus")%></td>
                    	<td><a href='order-details.jsp?id=<%=ret.getInt("id")%>&ono=<%=ret.getInt("orderNumber")%>' class="btn-upper btn btn-primary">Details</a></td>
					</tr>
<%		}while(ret.next());  
	} 
    else{ 
%>
					<tr>
                    	<td style="font-size: 18px; font-weight:bold ">Not Order Yet.&nbsp;<a href="shop-categories.jsp" class="btn-upper btn btn-warning">Continue Shopping</a></td>
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
