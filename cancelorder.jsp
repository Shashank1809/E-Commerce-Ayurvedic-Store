<%@include file="config.jsp"%>

<%
	if(session.getAttribute("id")==null){
		response.sendRedirect("index.jsp");
		return;
	}

	if(request.getParameter("submit")!=null){
    	String orderid = request.getParameter("oid");
    	String ressta = "Cancelled";
    	String remark = request.getParameter("restremark");
    	String canclbyuser = "User";
 		con.createStatement().executeUpdate("insert into ordertrackhistory(orderId,remark,status,canceledBy) values("+orderid+",'"+remark+"','"+ressta+"','"+canclbyuser+"')"); 
   		int n = con.createStatement().executeUpdate("update orders set orderStatus='"+ressta+"' where id="+orderid);
    	if(n>0) {
			out.print("<script>alert('Your order cancelled now.')</script>");
  		}
    	else{
			out.print("<script>alert('Something went wrong. Please try again.')</script>");
    	}
 	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>AyurCart - Order Cancelation</title>
</head>
<body>
	<div style="margin-left:50px;">
<%  
	String orderid = request.getParameter("oid");
	ResultSet query = con.createStatement().executeQuery("select orderNumber,orderStatus from orders where id="+orderid);
	query.next();
%>
		<table border="1"  cellpadding="10" style="border-collapse: collapse; border-spacing:0; width: 100%; text-align: center;">
  		<tr align="center">
   			<th colspan="4" >Cancel Order #<%=query.getString("orderNumber")%></th> 
  		</tr>
  		<tr>
			<th>Order Number </th>
			<th>Current Status </th>
		</tr>
		<tr> 
  			<td><%=query.getString("orderNumber")%></td> 
   			<td><%=query.getString("orderStatus")==null?"Waiting for confirmation":query.getString("orderStatus")%></td> 
		</tr>
		</table>
<% 
	String status = query.getString("orderStatus");
	if(status==null || status.equals("Packed") || status.equals("Dispatched") || status.equals("In Transit")) {
%>
		<form method="post">
      	<table>
        	<tr>
          		<th>Reason for Cancel</th>
				<td><textarea name="restremark" placeholder="" rows="12" cols="50" class="form-control wd-450" required="true"></textarea></td>
        	</tr>
			<tr>
  				<td colspan="2" align="center"><button type="submit" name="submit" class="btn btn--box btn--small btn--blue btn--uppercase btn--weight">Update order</button></td>
			</tr>
      	</table>
		</form>
<% 
	} 
	else { 
		if(status.equals("Cancelled")){
%>
		<p style="color:red; font-size:20px;"> Order already Cancelled. No need to cancel again.</p>
<% 
		} 
		else { 
%>
		<p style="color:red; font-size:20px;"> You can't cancel this. Order is Out For Delivery or delivered</p>
<% 
		}  
	} 
%>
  
</div>

</body>
</html>

     