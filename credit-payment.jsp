<%@include file="config.jsp"%>

<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	if(request.getParameter("submit")!=null){
		ResultSet rs = con.createStatement().executeQuery("SELECT `AUTO_INCREMENT` FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ayurcart_db' AND TABLE_NAME = 'orders'");
		rs.next();
		int oid = rs.getInt(1);
	
		int orderno = 100000 + (int)(Math.random() * ((999999 - 100000) + 1));
		int userid = Integer.parseInt(session.getAttribute("id").toString());
		int address = Integer.parseInt(session.getAttribute("address").toString());
		float totalamount = Float.parseFloat(session.getAttribute("gtotal").toString());
		String txntype = "Debit/Credit Card";
		String txnno = Integer.toString(100000 + (int)(Math.random() * ((999999 - 100000) + 1)));
		PreparedStatement ps = con.prepareStatement("insert into orders(orderNumber,userId,addressId,totalAmount,txnType,txnNumber) values(?,?,?,?,?,?)");
		ps.setInt(1, orderno);
		ps.setInt(2, userid);
		ps.setInt(3, address);
		ps.setFloat(4, totalamount);
		ps.setString(5, txntype);
		ps.setString(6, txnno);
		int n = ps.executeUpdate();
		
		if(n>0){
			con.createStatement().executeUpdate("insert into ordersdetails (orderId,userId,productId,quantity) select "+oid+",userID,productId,productQty from cart where userID="+userid);
			n = con.createStatement().executeUpdate("delete from cart where userID="+userid);
			if (n>0) {
				session.removeAttribute("address");
				session.removeAttribute("gtotal");
				out.print("<script>alert('Your order successfully placed. Order number is "+orderno+"')</script>");
    			out.print("<script type='text/javascript'> document.location ='my-orders.jsp'; </script>");
			} 
		} 
		else{
			out.print("<script>alert('Something went wrong. Please try again');</script>");
    		out.print("<script type='text/javascript'> document.location ='payment.jsp'; </script>");
		}
	}
%>
	

<!DOCTYPE html>
<html lang="en" >
	<head>
		<meta charset="UTF-8">
	  	<title>AyurCart - CheckOut</title>
	  	<link rel="stylesheet" href="css/style.css">
	</head>

	<body>
		<div class="mainscreen">
			<div class="card">
        		<div class="leftside">
          			<img src="images/checkout.jpg" class="product" alt="Shoes"/>
        		</div>
        		<div class="rightside">
          			<form method="post">
            			<h1>CheckOut</h1>
            			<h2>Payment Information</h2>
            			<p>Card Holder Name</p>
            			<input type="text" class="inputbox" name="name" required />
            			<p>Card Number</p>
            			<input type="number" class="inputbox" name="card_number" id="card_number" placeholder="xxxxxxxxxxxxxxxx" title="16 digits card number" pattern="^\d{16}$" required />
						<p>Card Type</p>
			            <select class="inputbox" name="card_type" id="card_type" required>
			              	<option value="">--Select a Card Type--</option>
			              	<option value="Visa">Visa</option>
			              	<option value="RuPay">RuPay</option>
			              	<option value="MasterCard">MasterCard</option>
			            </select>
						<div class="expcvv">
							<p class="expcvv_text">Expiry</p>
            				<input type="date" class="inputbox" name="exp_date" id="exp_date" required />
							<p class="expcvv_text2">CVV</p>
            				<input type="password" class="inputbox" name="cvv" id="cvv" placeholder="xxx" title="3 digit CVV" pattern="^\d{3}$" required />
        				</div>
            			<p></p>
            			<button type="submit" name="submit" class="button">CheckOut</button>
          			</form>
        		</div>
      		</div>
    	</div>
	</body>
</html>