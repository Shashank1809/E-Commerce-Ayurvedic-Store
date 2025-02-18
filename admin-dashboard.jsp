<%@include file="config.jsp"%>

<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("admin-logout.jsp");
		return;
	}

	ResultSet ret = con.createStatement().executeQuery("select count(id) as totalorders, count(if((orderStatus='' || orderStatus is null),0,null)) as neworders, count(if(orderStatus='Packed', 0,null)) as packedorders, count(if(orderStatus='Dispatched',  0,null)) as dispatchedorders, count(if(orderStatus='In Transit',  0,null)) as intransitorders, count(if(orderStatus='Out For Delivery', 0,null)) as outfdorders, count(if(orderStatus='Delivered', 0,null)) as deliveredorders, count(if(orderStatus='Cancelled', 0,null)) as cancelledorders from orders;");
	ret.next();
	int torders = ret.getInt("totalorders");
	int norders = ret.getInt("neworders");
	int porders = ret.getInt("packedorders");
	int dtorders = ret.getInt("dispatchedorders");
	int intorders = ret.getInt("intransitorders");
	int otforders = ret.getInt("outfdorders");
	int deliveredorders = ret.getInt("deliveredorders");
	int cancelledorders = ret.getInt("cancelledorders");

	ResultSet ret2 = con.createStatement().executeQuery("select count(id) as totalusers from users");
	ret2.next();
	int tregusers = ret2.getInt("totalusers");
	
	ret2 = con.createStatement().executeQuery("select count(id) as totalbrands from brand");
	ret2.next();
	int tbrands = ret2.getInt("totalbrands");
	
	ret2 = con.createStatement().executeQuery("select count(id) as totalcategory from category");
	ret2.next();
	int tcat = ret2.getInt("totalcategory");

	ret2 = con.createStatement().executeQuery("select count(id) as totalproducts from products");
	ret2.next();
	int tprod = ret2.getInt("totalproducts");
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	    <meta name="description" content="" />
	    <meta name="author" content="" />
	    <title>AyurCart | Admin Dashboard</title>
		<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	    <link href="css/admin-styles.css" rel="stylesheet" />
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
	</head>	 
	<body class="sb-nav-fixed">
		<%@include file="admin-header.jsp"%>
		<div id="layoutSidenav">
	    	<%@include file="admin-sidebar.jsp"%>
			<div id="layoutSidenav_content">
	        	<main>
	            	<div class="container-fluid px-4">
	                	<h1 class="mt-4">Dashboard</h1>
	                    <ol class="breadcrumb mb-4"><li class="breadcrumb-item active">Dashboard</li></ol>
						<div class="row">
	                    	<div class="col-lg-6 col-xl-3 mb-4">
	                        	<div class="card bg-primary text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">Total Order</div>
	                                            <div class="text-lg fw-bold"><%=torders%></div>
	                                       	</div>
										</div>
	                              	</div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="all-orders.jsp">View Details</a>
	                                </div>
								</div>
							</div>
	                        <div class="col-lg-6 col-xl-3 mb-4">
	                        	<div class="card bg-danger text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">New Orders</div>
	                                            <div class="text-lg fw-bold"><%=norders%></div>
	                                       	</div>
										</div>
	                              	</div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="new-order.jsp">View Details</a>
	                               	</div>
	                      		</div>
	                 		</div>
	                        <div class="col-lg-6 col-xl-3 mb-4">
	                        	<div class="card bg-warning text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">Packed Orders</div>
	                                            <div class="text-lg fw-bold"><%=porders%></div>
	                                     	</div>
										</div>
	                          		</div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="packed-orders.jsp">View Details</a>
	                               	</div>
	                          	</div>
	                      	</div>
	                        <div class="col-lg-6 col-xl-3 mb-4">
	                        	<div class="card bg-secondary text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">Dispatched Orders</div>
	                                            <div class="text-lg fw-bold"><%=dtorders%></div>
	                                       	</div>
										</div>
	                               	</div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="dispatched-orders.jsp">View Details</a>
	                               	</div>
	                           	</div>
	                      	</div>
	                  	</div>
						<div class="row">
	                    	<div class="col-lg-6 col-xl-3 mb-4">
	                        	<div class="card bg-warning text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">In Transit Orders</div>
	                                            <div class="text-lg fw-bold"><%=intorders%></div>
	                                       	</div>
	                                	</div>
	                              	</div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="intransit-orders.jsp">View Details</a>
									</div>
	                           	</div>
	                       	</div>
	                        <div class="col-lg-6 col-xl-3 mb-4">
	                        	<div class="card bg-primary text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">Out for Delivery Orders</div>
	                                            <div class="text-lg fw-bold"><%=otforders%></div>
	                                     	</div>
										</div>
	                                </div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="outfordelivery-orders.jsp">View Details</a>
	                              	</div>
	                           	</div>
	                       	</div>
	                        <div class="col-lg-6 col-xl-3 mb-4">
	                        	<div class="card bg-success text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">Delivered Orders</div>
	                                            <div class="text-lg fw-bold"><%=deliveredorders%></div>
	                                       	</div>
	                                  	</div>
	                               	</div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="delivered-orders.jsp">View Details</a>
	                               	</div>
	                          	</div>
	                     	</div>
	                    	<div class="col-lg-6 col-xl-3 mb-4">
	                    		<div class="card bg-danger text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">Cancelled Orders</div>
	                                            <div class="text-lg fw-bold"><%=cancelledorders%></div>
	                                      	</div>
	                                 	</div>
	                              	</div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="cancelled-orders.jsp">View Details</a>
	                               	</div>
	                         	</div>
	                      	</div>
	                  	</div>
						<div class="row">
	                        <div class="col-lg-6 col-xl-3 mb-4">
	                        	<div class="card bg-black text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">Registered Users</div>
	                                            <div class="text-lg fw-bold"><%=tregusers%></div>
	                                       	</div>    
	                                 	</div>
	                             	</div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="registered-users.jsp">View Details</a>
	                              	</div>
	                          	</div>
	                      	</div>
	                        <div class="col-lg-6 col-xl-3 mb-4">
	                        	<div class="card bg-success text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">Brands</div>
	                                            <div class="text-lg fw-bold"><%=tbrands%></div>
	                                       	</div>    
	                                 	</div>
	                             	</div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="manage-brands.jsp">View Details</a>
	                              	</div>
	                          	</div>
	                      	</div>
	                        <div class="col-lg-6 col-xl-3 mb-4">
	                        	<div class="card bg-danger text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">Category</div>
	                                            <div class="text-lg fw-bold"><%=tcat%></div>
	                                       	</div>    
	                                 	</div>
	                             	</div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="manage-categories.jsp">View Details</a>
	                              	</div>
	                          	</div>
	                      	</div>
	                        <div class="col-lg-6 col-xl-3 mb-4">
	                        	<div class="card bg-info text-white h-100">
	                            	<div class="card-body">
	                                	<div class="d-flex justify-content-between align-items-center">
	                                    	<div class="me-3">
	                                        	<div class="text-white-75 small">Products</div>
	                                            <div class="text-lg fw-bold"><%=tprod%></div>
	                                       	</div>    
	                                 	</div>
	                             	</div>
	                                <div class="card-footer d-flex align-items-center justify-content-between small">
	                                	<a class="text-white stretched-link" href="manage-products.jsp">View Details</a>
	                              	</div>
	                          	</div>
	                      	</div>
	                   	</div>
					</div>
	            </main>
				<%@include file="admin-footer.jsp"%>
	    	</div>
		</div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="js/admin-scripts.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	    <script src="assets/demo/chart-area-demo.js"></script>
	    <script src="assets/demo/chart-bar-demo.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
		<script src="js/datatables-simple-demo.js"></script>
	</body>
</html>