<%@include file="config.jsp"%>

<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	if(request.getParameter("update")!=null){
		String name = request.getParameter("fullname");
		String uid1 = session.getAttribute("id").toString();
		String contactno = request.getParameter("contactnumber");
		int n = con.createStatement().executeUpdate("update users set name='"+name+"',contactno='"+contactno+"' where id="+uid1);
		if(n>0){
    		out.print("<script>alert('Profile Updated successfully');</script>");
    		out.print("<script type='text/javascript'> document.location ='my-profile.jsp'; </script>");
		}
		else{
			out.print("<script>alert('Something went wrong. Please try again.');</script>");
    		out.print("<script type='text/javascript'> document.location ='my-profile.jsp'; </script>");
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>AyurCart | My Profile</title>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link href="css/styles.css" rel="stylesheet" />
	<script src="js/jquery.min.js"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<header class="bg-dark py-5">
    	<div class="container px-4 px-lg-5 my-5">
<% 
	String uid2 = session.getAttribute("id").toString();
	ResultSet query = con.createStatement().executeQuery("select * from users where id="+uid2);
	query.next();
%>
			<div class="text-center text-white">
            	<h1 class="display-4 fw-bolder"><%=query.getString("name")%>'s Profile</h1>
			</div>
		</div>
	</header>
	<section class="py-5">
    	<div class="container px-4  mt-5">
			<form method="post" name="profile">
			<div class="row">
				<div class="col-2"><b>Full Name</b></div>
				<div class="col-6"><input type="text" name="fullname" value='<%=query.getString("name")%>' class="form-control" required ></div>
			</div>
			<div class="row mt-3">
				<div class="col-2"><b>Email Id</b></div>
				<div class="col-6"><input type="email" name="emailid" id="emailid" class="form-control" value='<%=query.getString("email")%>' readonly></div>
			</div>
			<div class="row mt-3">
	         	<div class="col-2"><b>Contact Number</b></div>
	         	<div class="col-6"><input type="text" name="contactnumber" value='<%=query.getString("contactno")%>' pattern="^[6789]\d{9}$" title="10 numeric characters only" class="form-control" required></div>
     		</div>
			<div class="row mt-3">
            	<div class="col-4">&nbsp;</div>
         		<div class="col-6"><input type="submit" name="update" id="update" class="btn btn-primary" value="Update" required></div>
     		</div>
 			</form>
		</div>
	</section>
	<%@include file="footer.jsp"%>
    <script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
