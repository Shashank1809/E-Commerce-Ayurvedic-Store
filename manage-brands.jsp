<%@include file="config.jsp"%>
<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("admin-index.jsp");
		return;
	}
	if(request.getParameter("del")!=null){
		String id = request.getParameter("id");
		con.createStatement().executeUpdate("delete from brand where id = "+id);

		String appPath = request.getServletContext().getRealPath("/");
		new java.io.File(appPath+"/images/brands/"+id+".jpg").delete();
		
		out.print("<script>alert('Data Deleted');</script>");
		out.print("<script>window.location.href='manage-brands.jsp'</script>");
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
	    <title>AyurCart | Manage Brands</title>
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
	            	<div class="container-fluid px-4">
	                	<h1 class="mt-4">Manage Brands</h1>
	                    <ol class="breadcrumb mb-4">
		                    <li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
							<li class="breadcrumb-item active">Manage Brands</li>
	                    </ol>
						<div class="card mb-4">
	                    	<div class="card-header"><i class="fas fa-table me-1"></i>Brand Details</div>
							<div class="card-body">
	                        	<table id="datatablesSimple">
	                            <thead>
	                                <tr>
	                                	<th>#</th>
	                                	<th></th>
	                                    <th>Name</th>
	                                    <th>Description</th>
	                                    <th>Address</th>
	                                    <th>Action</th>
	                            	</tr>
	                            </thead>
	                            <tbody>
	<% 
		ResultSet query = con.createStatement().executeQuery("select * from brand");
		int cnt=1;
		while(query.next()){
	%>  
									<tr>
	                                	<td><%=cnt++%></td>
	                                    <td><img src='images/brands/<%=query.getString("id")%>.jpg' width="120"></td>
	                                    <td><b><%=query.getString("brandName")%></b></td>
										<td><%=query.getString("brandDescription")%></td>
	                                    <td><%=query.getString("brandAddress")%></td>
	                              		<td>
	                              			<a href='edit-brand.jsp?id=<%=query.getString("id")%>'><i class="fas fa-edit"></i></a> | 
	                                       	<a href='manage-brands.jsp?id=<%=query.getString("id")%>&del=delete' onClick="return confirm('Are you sure you want to delete?')"><i class="fa fa-trash" aria-hidden="true"></i></a>
	                                   	</td>
	              					</tr>
	<%	} %>
								</tbody>
	                           	</table>
	                       	</div>
	                 	</div>
	             	</div>
	       		</main>
	       		<%@include file="admin-footer.jsp"%>
			</div>
	    </div>
	    <script src="js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	    <script src="js/admin-scripts.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	    <script src="js/datatables-simple-demo.js"></script>
	</body>
</html>
