<%@include file="config.jsp"%>

<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("index.jsp");
		return;
	}
	if(request.getParameter("submit")!=null){
		int uid = Integer.parseInt(session.getAttribute("id").toString());    
		String baddress=request.getParameter("baddress");
		String bcity=request.getParameter("bcity");
		String bstate=request.getParameter("bstate");
		String bpincode=request.getParameter("bpincode");
		String bcountry=request.getParameter("bcountry");
		String saddress=request.getParameter("saddress");
		String scity=request.getParameter("scity");
		String sstate=request.getParameter("sstate");
		String spincode=request.getParameter("spincode");
		String scountry=request.getParameter("scountry");

		PreparedStatement ps = con.prepareStatement("insert into addresses(userId,billingAddress,biilingCity,billingState,billingPincode,billingCountry,shippingAddress,shippingCity,shippingState,shippingPincode,shippingCountry) values(?,?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1, uid);
		ps.setString(2, baddress);
		ps.setString(3, bcity);
		ps.setString(4, bstate);
		ps.setString(5, bpincode);
		ps.setString(6, bcountry);
		ps.setString(7, saddress);
		ps.setString(8, scity);
		ps.setString(9, sstate);
		ps.setString(10, spincode);
		ps.setString(11, scountry);
		int n = ps.executeUpdate();
		if(n>0){
    		out.print("<script>alert('You Address added successfully');</script>");
    		out.print("<script type='text/javascript'> document.location ='manage-addresses.jsp'; </script>");
		}
		else{
			out.print("<script>alert('Something went wrong. Please try again.');</script>");
    		out.print("<script type='text/javascript'> document.location ='manage-addresses.jsp'; </script>");
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
    <title>AyurCart | Manage Addresses</title>
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
	<script src="js/jquery.min.js"></script>
</head>
<body>
	<%@include file="header.jsp"%>
	<header class="bg-dark py-5">
    	<div class="container px-4 px-lg-5 my-5">
			<div class="text-center text-white">
            	<h1 class="display-4 fw-bolder">Already Listed Addresses</h1>
			</div>
		</div>
	</header>
	<section class="py-5">
    	<div class="container px-4  mt-5">
			<h5>Already Listed Addresses</h5>
<% 
	String uid1 = session.getAttribute("id").toString();
	ResultSet query = con.createStatement().executeQuery("select * from addresses where userId="+uid1);
	if(!query.next()){
		out.print("<font color='red'>No addresses Found.</font>");	
	}
	else{
%>
			<form method="post">
			<div class="row">
				<div class="col-6">
      				<table class="table">
            		<thead>
                		<tr>
                    		<th colspan="4"><h5>Billing Address</h5></th>
                		</tr>
            		</thead>
					<thead>
						<tr>
		                    <th width="250">Adresss</th>
		                    <th>City</th>
		                    <th>State</th>
		                    <th>Pincode</th>
		                    <th>Country</th>
            			</tr>
                	</thead>
					</table>  
				</div>
				<div class="col-6">
          			<table class="table">
            		<thead>
                		<tr>
                    		<th colspan="4"><h5>Shipping Address</h5></th>
                		</tr>
            		</thead>
					<thead>
						<tr>
	                    	<th width="250">Adresss</th>
	                    	<th>City</th>
	                    	<th>State</th>
	                    	<th>Pincode</th>
	                    	<th>Country</th>
                    	</tr>
					</thead>
            		</table> 
				</div>
			</div>
<% 
		do{ 
%>
			<div class="row">
				<div class="col-6">
      				<table class="table">
            		<tbody> 
	                	<tr>
		                    <td width="250"><%=query.getString("billingAddress")%></td>
		                    <td><%=query.getString("biilingCity")%></td>
		                    <td><%=query.getString("billingState")%></td>
		                    <td><%=query.getString("billingPincode")%></td>
		                    <td><%=query.getString("billingCountry")%></td>
                		</tr>
            		</tbody>
            		</table>  
				</div>
				<div class="col-6">
          			<table class="table">
            		<tbody> 
                		<tr>
		                    <td width="250"><%=query.getString("shippingAddress")%></td>
		                    <td><%=query.getString("shippingCity")%></td>
		                    <td><%=query.getString("shippingState")%></td>
		                    <td><%=query.getString("shippingPincode")%></td>
		                    <td><%=query.getString("shippingCountry")%></td>
                		</tr>
            		</tbody>
            		</table> 
				</div>
			</div>
<%		}while(query.next()); 
	}
%>
			</form>
			<hr>
			<form method="post" name="address">
			<div class="row">
				<div class="col-6">
			    	<div class="row">
			        	<div class="col-9" align="center"><h5>New Billing Address</h5></div>
			         	<hr>
			     	</div>
			     	<div class="row">
			        	<div class="col-3">Address</div>
			         	<div class="col-6"><input type="text" name="baddress" id="baddress" class="form-control" required ></div>
			     	</div>
			       	<div class="row mt-3">
			        	<div class="col-3">City</div>
			         	<div class="col-6"><input type="text" name="bcity" id="bcity"  class="form-control" required></div>
					</div>
					<div class="row mt-3">
			        	<div class="col-3">State</div>
			         	<div class="col-6"><input type="text" name="bstate" id="bstate" class="form-control" required></div>
			     	</div>
					<div class="row mt-3">
			        	<div class="col-3">Pincode</div>
			         	<div class="col-6"><input type="text" name="bpincode" id="bpincode" pattern="^\d{6}$" title="only numbers" maxlength="6" class="form-control" required></div>
			     	</div>
					<div class="row mt-3">
			        	<div class="col-3">Country</div>
			         	<div class="col-6"><input type="text" name="bcountry" id="bcountry" class="form-control" required></div>
			     	</div>
			 	</div>
				<div class="col-6">
			    	<div class="row">
			        	<div class="col-9" align="center"><h5>New Shipping Address</h5> 
			            <input type="checkbox" name="adcheck" value="1"/>
			            <small>Shipping Address same as billing Address</small></div>
			         	<hr>
			     	</div>
			     	<div class="row">
				        <div class="col-3">Address</div>
				        <div class="col-6"><input type="text" name="saddress"  id="saddress" class="form-control" required ></div>
			     	</div>
					<div class="row mt-3">
						<div class="col-3">City</div>
						<div class="col-6"><input type="text" name="scity" id="scity" class="form-control" required></div>
					</div>
					<div class="row mt-3">
			        	<div class="col-3">State</div>
			         	<div class="col-6"><input type="text" name="sstate" id="sstate" class="form-control" required></div>
			     	</div>
					<div class="row mt-3">
			         	<div class="col-3">Pincode</div>
			        	<div class="col-6"><input type="text" name="spincode" id="spincode" pattern="^\d{6}" title="only numbers" maxlength="6" class="form-control" required></div>
			     	</div>
					<div class="row mt-3">
			        	<div class="col-3">Country</div>
			         	<div class="col-6"><input type="text" name="scountry" id="scountry" class="form-control" required></div>
			     	</div>
				</div>
			    <div class="row mt-3">
			    	<div class="col-5">&nbsp;</div>
			        <div class="col-6"><input type="submit" name="submit" id="submit" class="btn btn-primary" value="Add" required></div>
			    </div>
			</div>
			</form>
		</div>
	</section>
	<%@include file="footer.jsp"%>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/scripts.js"></script>
    <script type="text/javascript">
	    $(document).ready(function(){
	        $('input[type="checkbox"]').click(function(){
	            if($(this).prop("checked") == true){
	                $('#saddress').val($('#baddress').val() );
	                $('#scity').val($('#bcity').val());
	                $('#sstate').val($('#bstate').val());
	                $('#spincode').val( $('#bpincode').val());
	                  $('#scountry').val($('#bcountry').val() );
	            } 
	            
	        });
	    });
	</script>
</body>
</html>
