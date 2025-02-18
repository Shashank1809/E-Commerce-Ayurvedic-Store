<%@include file="config.jsp"%>

<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("index.jsp");
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
    <title>AyurCart | Between dates Orders</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="css/admin-styles.css" rel="stylesheet" />
	<script src="js/all.min.js" crossorigin="anonymous"></script>
</head>
<body>
	<%@include file="admin-header.jsp"%>
	<div id="layoutSidenav">
   		<%@include file="admin-sidebar.jsp"%>
		<div id="layoutSidenav_content">
        	<main>
            	<div class="container-fluid px-4">
                	<h1 class="mt-4">Between Dates Order Report</h1>
                    <ol class="breadcrumb mb-4">
                    	<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">Between Dates Order Report</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
								<form  method="post">                                
								<div class="row">
									<div class="col-2">From Date</div>
									<div class="col-4"><input type="date"  name="fromdate" class="form-control" required></div>
								</div>
								<div class="row" style="margin-top:1%;">
									<div class="col-2">To Date</div>
									<div class="col-4"><input type="date"  name="todate" class="form-control" required></div>
								</div>
								<div class="row" style="margin-top:1%;">
									<div class="col-6" align="center"><button type="submit" name="submit" class="btn btn-primary">Submit</button></div>
								</div>
								</form>
                            </div>
                        </div>
                    </div>
<% 
	if(request.getParameter("submit")!=null) { 
		String fdate = request.getParameter("fromdate");
		String tdate = request.getParameter("todate");
%>
					<div class="card-body">
						<h4 align="center" style="color:blue">Orders Report Form <%=fdate%> To <%=tdate%></h4>
						<hr>
                        	<table id="datatablesSimple">
                            	<thead>
                                	<tr>
                                    	<th>#</th>
                                        <th>Order No.</th>
                                        <th>Order By</th>
                                        <th>Order Amount</th>
                                        <th>Order Date</th>
                                        <th>Order Status</th>
                                        <th>Action</th>
                               		</tr>
                             	</thead>

                              	<tbody>
<% 
		ResultSet query = con.createStatement().executeQuery("SELECT orders.id,orderNumber,totalAmount,orderStatus,orderDate,users.name,users.contactno FROM orders join users on users.id=orders.userId where date(orderDate) >= '"+fdate+"' and  date(orderDate) <= '"+tdate+"'");
		int cnt=1;
		while(query.next()){
%>  
									<tr>
                                    	<td><%=cnt++%></td>
                                        <td><%=query.getString("orderNumber")%></td>
                                        <td><%=query.getString("name")%></td>
                                        <td><%=query.getString("totalAmount")%></td>
                                        <td><%=query.getString("orderDate")%></td>
                                        <td><%=query.getString("orderStatus")==null?"-":query.getString("orderStatus")%></td>
                                        <td><a href='admin-order-details.jsp?orderid=<%=query.getString("id")%>'><i class="fas fa-file fa-2x" title="View Order Details"></i></a></td>
									</tr>
<% 		} %>
								</tbody>
                           	</table>
                       	</div>
 					</div>
               	</div>
<%	} %>
           	</main>
		</div>
	</div>
    <script src="js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/admin-scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>
</html>
