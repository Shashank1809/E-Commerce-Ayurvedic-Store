<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    	<div class="sb-sidenav-menu">
        	<div class="nav">
            	<div class="sb-sidenav-menu-heading">Core</div>
               	<a class="nav-link" href="admin-dashboard.jsp"><div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>Dashboard</a>
				<div class="sb-sidenav-menu-heading">Product Management</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
					<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Category
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
				</a>
                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                	<nav class="sb-sidenav-menu-nested nav">
                    	<a class="nav-link" href="add-category.jsp">Add</a>
                        <a class="nav-link" href="manage-categories.jsp">Manage</a>
					</nav>
				</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#subcat" aria-expanded="false" aria-controls="subcat">
					<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Brands
              		<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
               	</a>
                <div class="collapse" id="subcat" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                	<nav class="sb-sidenav-menu-nested nav">
                    	<a class="nav-link" href="add-brand.jsp">Add</a>
                        <a class="nav-link" href="manage-brands.jsp">Manage</a>
                  	</nav>
				</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#product" aria-expanded="false" aria-controls="product">
                	<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Products
                   	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
				</a>
                <div class="collapse" id="product" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                	<nav class="sb-sidenav-menu-nested nav">
                    	<a class="nav-link" href="add-product.jsp">Add</a>
                        <a class="nav-link" href="manage-products.jsp">Manage</a>
					</nav>
				</div>
				<div class="sb-sidenav-menu-heading">Order Management</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#orders" aria-expanded="false" aria-controls="orders">
                	<div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
                    Orders
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
				</a>
                <div class="collapse" id="orders" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                	<nav class="sb-sidenav-menu-nested nav">
<%@page import="java.sql.*"%>
<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ayurcart_db","root","");
%>
<%
	ResultSet ret1 = con1.createStatement().executeQuery("select count(id) as totalorders, count(if((orderStatus='' || orderStatus is null),0,null)) as neworders, count(if(orderStatus='Packed', 0,null)) as packedorders, count(if(orderStatus='Dispatched',  0,null)) as dispatchedorders, count(if(orderStatus='In Transit',  0,null)) as intransitorders, count(if(orderStatus='Out For Delivery', 0,null)) as outfdorders, count(if(orderStatus='Delivered', 0,null)) as deliveredorders, count(if(orderStatus='Cancelled', 0,null)) as cancelledorders from orders;");
	ret1.next();
	int torders1 = ret1.getInt("totalorders");
	int norders1 = ret1.getInt("neworders");
	int porders1 = ret1.getInt("packedorders");
	int dtorders1 = ret1.getInt("dispatchedorders");
	int intorders1 = ret1.getInt("intransitorders");
	int otforders1 = ret1.getInt("outfdorders");
	int deliveredorders1 = ret1.getInt("deliveredorders");
	int cancelledorders1 = ret1.getInt("cancelledorders");
%>          			<a class="nav-link" href="all-orders.jsp">All Orders <span style="color:#fff"> [<%=torders1%>]</span></a>
            			<a class="nav-link" href="new-order.jsp">New Orders <span style="color:#fff"> [<%=norders1%>]</span></a>
            			<a class="nav-link" href="packed-orders.jsp">Packed Orders <span style="color:#fff"> [<%=porders1%>]</span></a>
            			<a class="nav-link" href="dispatched-orders.jsp">Dispatched Order <span style="color:#fff"> [<%=dtorders1%>]</span></a>
			            <a class="nav-link" href="intransit-orders.jsp">In Transit Order <span style="color:#fff"> [<%=intorders1%>]</span></a>
			            <a class="nav-link" href="outfordelivery-orders.jsp">Out for Delivery Order <span style="color:#fff"> [<%=otforders1%>]</span></a>
			            <a class="nav-link" href="delivered-orders.jsp">Delivered Order <span style="color:#fff"> [<%=deliveredorders1%>]</span></a>
			            <a class="nav-link" href="cancelled-orders.jsp">Cancelled Order <span style="color:#fff"> [<%=cancelledorders1%>]</span></a>
					</nav>
             	</div>
				<div class="sb-sidenav-menu-heading">Reports</div>
				<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#reports" aria-expanded="false" aria-controls="collapseLayouts">
                	<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    	Reports
                   	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
				</a>
                <div class="collapse" id="reports" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                	<nav class="sb-sidenav-menu-nested nav">
                    	<a class="nav-link" href="bwdates-ordersreport.jsp">Orders Report</a>
                        <a class="nav-link" href="sales-report.jsp">Sales Report</a>
					</nav>
				</div>
				<a class="nav-link" href="registered-users.jsp"><div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>Registered Users</a>
			</div>
		</div>
        <div class="sb-sidenav-footer">
        	<div class="small">Logged in as:</div>
            <%=session.getAttribute("alogin")%>
		</div>
	</nav>
</div>