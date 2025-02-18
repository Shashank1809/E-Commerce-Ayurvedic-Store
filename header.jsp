<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container px-4 px-lg-5">
    	<a class="navbar-brand" href="index.jsp">AyurCart</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        	<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
            	<li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about-us.jsp">About</a></li>
                <li class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    	<li><a class="dropdown-item" href="index.jsp">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="shop-categories.jsp">Category Wise</a></li>
                        <li><a class="dropdown-item" href="shop-brands.jsp">Brand Wise</a></li>
              		</ul>
				</li>
<% if(session.getAttribute("id")==null){%>
				<li class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Users</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    	<li><a class="dropdown-item" href="login.jsp">Login</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="signup.jsp">Sign Up</a></li>
					</ul>
				</li>
    			<li class="nav-item"><a class="nav-link" href="admin-index.jsp">Admin</a></li>
<%	} else { %>
				<li class="nav-item"><a class="nav-link" href="my-wishlist.jsp">My Wishlist</a></li>
                <li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">My Account</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    	<li><a class="dropdown-item" href="my-orders.jsp">Orders</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="my-profile.jsp">Profile</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="change-password.jsp">Change Password</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="manage-addresses.jsp">Addresses</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout.jsp">Logout</a></li>
                  	</ul>
				</li>
<% 	} %>  
                      <li class="nav-item"><a class="nav-link" href="contact-us.jsp">Contact us</a></li> 
			</ul>  
<%	if(session.getAttribute("id")!=null){%>
			<strong>Welcome:</strong> <%=session.getAttribute("username")%> &nbsp;
<%	} %>
			<form class="d-flex">
<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ayurcart_db","root","");

	int cartcount = 0;
	if(session.getAttribute("id")!=null){
		String uid = session.getAttribute("id").toString();
		ResultSet rs = con2.createStatement().executeQuery("select sum(productQty) as qtyy from cart where userId="+uid);
		rs.next();
		cartcount = rs.getInt("qtyy");
	}
%>
				<a class="btn btn-outline-dark" href="my-cart.jsp">
                <i class="bi-cart-fill me-1"></i>Cart
<% 	if(cartcount==0){ %>
				<span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
<%	} else { %>
      			<span class="badge bg-dark text-white ms-1 rounded-pill"><%=cartcount%></span>
<%	} %>
                </a>
           	</form>
		</div>
	</div>
</nav>