<%@include file="config.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>AyurCart | Brand wise Shop </title>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<%@include file="header.jsp"%>
	<header class="bg-dark py-5">
    	<div class="container px-4 px-lg-5 my-5">

<% 
	String bid = request.getParameter("bid");
	ResultSet query = con.createStatement().executeQuery("select * from brand where id="+bid);
	while(query.next()){ 
%>
			<div class="text-center text-white">
            	<h1 class="display-4 fw-bolder"><%=query.getString("brandName")%></h1>
                <p class="lead fw-normal text-white-50 mb-0">Brand Products/Items</p>
           	</div>
<%	} %>
		</div>
	</header>
	<section class="py-5">
    	<div class="container px-4 px-lg-5 mt-5">
        	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
<% 
	query = con.createStatement().executeQuery("select products.id as pid,products.productImage1,products.productName,products.productPriceBeforeDiscount,products.productPrice from products where brandId="+bid+" order by pid desc");
	if(query.next()){
		do{
%> 
				<div class="col mb-5">
                	<div class="card h-100">
						<img class="card-img-top" src='images/products/<%=query.getString("productImage1")%>' width="350" height="300" alt='<%=query.getString("productName")%>' />
						<div class="card-body p-4">
                        	<div class="text-center">
								<h5 class="fw-bolder"><%=query.getString("productName")%></h5>
								<span class="text-decoration-line-through">&#8377;<%=query.getString("productPriceBeforeDiscount")%></span> - &#8377;<%=query.getString("productPrice")%>
                           	</div>
                       	</div>
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        	<div class="text-center"><a class="btn btn-outline-dark mt-auto" href='product-details.jsp?pid=<%=query.getInt("pid")%>'>View options</a></div>
                            </div>
                        </div>
                    </div>
<%		
		}while(query.next()); 
	}  
	else{ 
%>
     				<h4 style="color:red">No Record found</h4>
<%	} %>
				</div>
        	</div>
		</div>
	</section>
	<%@include file="footer.jsp"%>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
