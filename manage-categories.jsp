<%@include file="config.jsp"%>

<%
	if(session.getAttribute("aid")==null){
		response.sendRedirect("admin-logout.jsp");
		return;
	}

	if(request.getParameter("del")!=null){
		String catid = request.getParameter("id");
		con.createStatement().executeUpdate("delete from category where id ="+catid);
		out.print("<script>alert('Category deleted successfully');</script>");
		out.print("<script>window.location.href='manage-categories.jsp'</script>");
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
	    <title>AyurCart | Manage Category</title>
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
						<h1 class="mt-4">Manage Categories</h1>
	                    <ol class="breadcrumb mb-4">
	                    	<li class="breadcrumb-item"><a href="admin-dashboard.jsp">Dashboard</a></li>
	                        <li class="breadcrumb-item active">Manage Category</li>
	                   	</ol>
	                    <div class="card mb-4">
	                    	<div class="card-header"><i class="fas fa-table me-1"></i>Category Details</div>
							<div class="card-body">
	                        	<table id="datatablesSimple">
	                            	<thead>
	                                	<tr>
	                                    	<th>#</th>
	                                        <th>Name</th>
	                                        <th>Description</th>
	                                        <th>Action</th>
	                                 	</tr>
									</thead>
	                          		<tbody>
	<% 
		ResultSet query = con.createStatement().executeQuery("select * from category");
		int cnt=1;
		while(query.next()){
	%>  
										<tr>
	                                    	<td><%=cnt++%></td>
	                                        <td><%=query.getString("categoryName")%></td>
	                                        <td><%=query.getString("categoryDescription")%></td>
	                                        <td>
	                                            <a href='edit-category.jsp?id=<%=query.getInt("id")%>'><i class="fas fa-edit"></i></a> | 
	                                            <a href='manage-categories.jsp?id=<%=query.getInt("id")%>&del=delete' onClick="return confirm('Are you sure you want to delete category?')"><i class="fa fa-trash" aria-hidden="true"></i></a>
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
