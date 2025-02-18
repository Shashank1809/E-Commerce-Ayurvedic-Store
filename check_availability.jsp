<%@include file="config.jsp"%>
<%
	if(request.getParameter("email")!=null){
		String email = request.getParameter("email");
		ResultSet rs = con.createStatement().executeQuery("SELECT  email FROM  users WHERE  email='"+email+"'");
		if(rs.next()){
			out.print("<span style='color:red'> Email already exists .</span>");
			out.print("<script>$('#submit1').prop('disabled',true);</script>");			
		}
		else{
			out.print("<span style='color:green'> Email available for registration .</span>");
			out.print("<script>$('#submit').prop('disabled',false);</script>");			
		}
	}
%>
