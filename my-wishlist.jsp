<%@include file="config.jsp"%>

<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	if(request.getParameter("del")!=null){
		String wid = request.getParameter("del");
		con.createStatement().executeUpdate("delete from wishlist where id="+wid);
 		out.print("<script>alert('Product deleted from wishlist.');</script>");
		out.print("<script type='text/javascript'> document.location ='my-wishlist.jsp'; </script>");
	}
	if(request.getParameter("id")!=null){
 		String wid = request.getParameter("id");
		con.createStatement().executeUpdate("insert into cart(userID,productId,productQty) select userId,productId,1 from wishlist where id="+wid);
		con.createStatement().executeUpdate("delete from  wishlist where id="+wid);
		out.print("<script>alert('Product moved into the cart');</script>");
     	out.print("<script type='text/javascript'> document.location ='my-cart.jsp'; </script>");
 	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>AyurCart | My Wishlist</title>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link href="css/styles.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
</head>
	<script>
		function emailAvailability() {
			$("#loaderIcon").show();
			jQuery.ajax({
				url: "check_availability.jsp",
				data:'email='+$("#emailid").val(),
				type: "POST",
				success:function(data){
					$("#user-email-status").html(data);
					$("#loaderIcon").hide();
				},
				error:function (){}
			});
		}
	</script>
<body>
	<%@include file="header.jsp"%>
	<header class="bg-dark py-5">
    	<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
            	<h1 class="display-4 fw-bolder">Wishlist</h1>
           	</div>
		</div>
	</header>
	<section class="py-5">
    	<div class="container px-4  mt-5">
			<div class="table-responsive">
        		<table class="table">
            	<thead>
	                <tr>
	                    <th colspan="4"><h4>My Wishlist</h4></th>
	                </tr>
            	</thead>
				<tbody>
<%
	String uid = session.getAttribute("id").toString();
	ResultSet ret = con.createStatement().executeQuery("select products.productName as pname,products.productName as proid,products.productImage1 as pimage,products.productPrice as pprice,wishlist.productId as pid,wishlist.id as wid,products.productPriceBeforeDiscount from wishlist join products on products.id=wishlist.productId where wishlist.userId="+uid);
	if(ret.next())
    {
		do	{
%>
					<tr>
                    	<td class="col-md-2"><img src='productImages/<%=ret.getString("pimage")%>' alt='<%=ret.getString("pname")%>' width="100" height="100"></td>
                    	<td class="col-md-6">
                        	<div class="product-name"><a href='product-details.jsp?pid=<%=ret.getInt("pid")%>'><%=ret.getString("pname")%></a></div>
                           	<span class="text-decoration-line-through">&#8377;<%=ret.getString("productPriceBeforeDiscount")%></span>
                            <span>&#8377;<%=ret.getString("pprice")%></span>
                    	</td>
                    	<td>
                        	<a href='my-wishlist.jsp?action=movetocart&id=<%=ret.getInt("wid")%>' class="btn-upper btn btn-primary">Add to cart</a>
                    	</td>
                    	<td>
                        	<a href='my-wishlist.jsp?del=<%=ret.getInt("wid")%>' onClick="return confirm('Are you sure you want to delete?')" class="btn-upper btn btn-danger">Delete</a>
                    	</td>
                	</tr>
<%
		}while(ret.next());
    }
	else{
%>
					<tr>
                    	<td style="font-size: 18px; font-weight:bold ">Your Wishlist is Empty</td>
					</tr>
<%	} %>					
				</tbody>
        	</table>
        </div>
    </section>
   	<%@include file="footer.jsp"%>
    <script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>