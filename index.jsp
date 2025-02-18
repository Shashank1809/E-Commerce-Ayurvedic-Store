<%@include file="config.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	    <meta name="description" content="" />
	    <meta name="author" content="" />
	    <title>AyurCart - Homepage</title>
		<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
		<link href="css/styles.css" rel="stylesheet" />
		<script src="js/jquery.min.js"></script>
	</head>
	<body>
		<%@include file="header.jsp"%>
		<header class=" bg-dark py-5">
				<div class="container px-4 px-lg-5 my-5">
					<div class="text-center text-white">
						<h1 class="display-4 fw-bolder">Revitalize Your Health Naturally with Ayurvedic Medicines</h1>
					</div>
				</div>	
		</header>
		<section class="py-5">
	    	<div class="container px-4 px-lg-5 mt-5">
	        	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
	<%
		int page_no = 1;
	
		if(request.getParameter("page_no")!=null && !request.getParameter("page_no").toString().equals("")) {
		    page_no = Integer.parseInt(request.getParameter("page_no"));
	    } 
		int total_records_per_page = 12;
	    int offset = (page_no-1) * total_records_per_page;
	    int previous_page = page_no - 1;
	    int next_page = page_no + 1;
	    int adjacents = 2; 
	 
	    ResultSet rs = con.createStatement().executeQuery("SELECT COUNT(*) As total_records FROM products");
		rs.next();
	    int total_records = rs.getInt("total_records");
	    
	    int total_no_of_pages = (int)Math.ceil((double)total_records / total_records_per_page);
	    int second_last = total_no_of_pages - 1;
	
	    rs = con.createStatement().executeQuery("select products.id as pid,products.productImage1,products.productName,products.productPriceBeforeDiscount,products.productPrice from products order by pid desc LIMIT "+offset+", "+total_records_per_page);
		int cnt=1;
		while(rs.next()){
	%> 
					<div class="col mb-5">
	                	<div class="card h-100">
							<img class="card-img-top" src='images/products/<%=rs.getString("productImage1")%>' width="350" height="300" alt='<%=rs.getString("productName")%>' />
							<div class="card-body p-4">
	                        	<div class="text-center">
									<h5 class="fw-bolder"><%=rs.getString("productName")%></h5>
									<span class="text-decoration-line-through">&#8377;<%=rs.getString("productPriceBeforeDiscount")%></span> - &#8377;<%=rs.getString("productPrice")%>
								</div>
	                       	</div>
							<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                        	<div class="text-center"><a class="btn btn-outline-dark mt-auto" href='product-details.jsp?pid=<%=rs.getInt("pid")%>'>View options</a></div>
							</div>
						</div>
					</div>
	<%	} %>				
				</div>
			</div>
			<div style='padding: 10px 20px 0px; border-top: dotted 1px #CCC;'>
				<strong>Page <%=page_no+" of "+total_no_of_pages%></strong>
			</div>
			<nav aria-label="Pagination">
	        	<hr class="my-0">
				<ul class="pagination justify-content-center my-4">
					<li <% if(page_no <= 1){ out.print("class='page-item disabled'"); } %>>
	    				<a <% if(page_no > 1){ out.print("href='?page_no="+previous_page+"'"); } %> class="page-link">Previous</a>
	    			</li>
	<% 
		if (total_no_of_pages <= 10){       
	    	for (int counter = 1; counter <= total_no_of_pages; counter++){
				if (counter == page_no) {
					out.print("<li class='page-link active'><a>"+counter+"</a></li>");  
				}
				else{
	           		out.print("<li><a href='?page_no="+counter+"' class='page-link'>"+counter+"</a></li>");
	           	}
	     	}
		}
	    else if(total_no_of_pages > 10){
			if(page_no <= 4) {         
				for (int counter = 1; counter < 8; counter++){       
					if (counter == page_no) {
						out.print("<li class='active'><a>"+counter+"</a></li>");  
	                }
					else{
	           			out.print("<li><a href='?page_no="+counter+"'>"+counter+"</a></li>");
	                }
	        	}
	        	out.print("<li><a>...</a></li>");
	        	out.print("<li><a href='?page_no="+second_last+"'>"+second_last+"</a></li>");
	        	out.print("<li><a href='?page_no="+total_no_of_pages+"'>"+total_no_of_pages+"</a></li>");
	     	}
			else if(page_no > 4 && page_no < total_no_of_pages - 4) {         
		        out.print("<li><a href='?page_no=1'>1</a></li>");
		        out.print("<li><a href='?page_no=2'>2</a></li>");
		        out.print("<li><a>...</a></li>");
				for (int counter = page_no - adjacents; counter <= page_no + adjacents; counter++) {         
	           		if (counter == page_no) {
	           			out.print("<li class='active'><a>"+counter+"</a></li>");  
	                }
	           		else{
	           			out.print("<li><a href='?page_no="+counter+"' class='page-link'>"+counter+"</a></li>");
	                }                  
	       		}
	       		out.print("<li><a>...</a></li>");
	       		out.print("<li><a href='?page_no="+second_last+"' class='page-link'>"+second_last+"</a></li>");
	       		out.print("<li><a href='?page_no="+total_no_of_pages+"' class='page-link'>"+total_no_of_pages+"</a></li>");      
	      	}
	        else {
		        out.print("<li><a href='?page_no=1' class='page-link'>1</a></li>");
		        out.print("<li><a href='?page_no=2' class='page-link'>2</a></li>");
		        out.print("<li><a>...</a></li>");
	 			for (int counter = total_no_of_pages - 6; counter <= total_no_of_pages; counter++) {
	          		if (counter == page_no) {
	           			out.print("<li class='active'><a>"+counter+"</a></li>");  
	                }
	          		else{
	           			out.print("<li><a href='?page_no="+counter+"'>"+counter+"</a></li>");
	               	}                   
	          	}
	     	}
		}
	%>
					<li <% if(page_no >= total_no_of_pages){ out.print("class='page-item disabled'"); } %>>
	    				<a <% if(page_no < total_no_of_pages) { out.print("href='?page_no="+next_page+"'"); } %> class="page-link">Next</a>
	    			</li>
	<% 	if(page_no < total_no_of_pages){
			out.print("<li><a href='?page_no="+total_no_of_pages+"' class='page-link'>Last &rsaquo;&rsaquo;</a></li>");
		} 
	%>
				</ul>
			</div>
		</section>
	   	<%@include file="footer.jsp"%>
		<script src="js/bootstrap.bundle.min.js"></script>
		<script src="js/scripts.js"></script>
	</body>
</html>
