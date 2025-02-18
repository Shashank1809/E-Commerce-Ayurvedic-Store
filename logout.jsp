<%
	session.removeAttribute("login");
	session.removeAttribute("id");
	session.removeAttribute("username");
	session.invalidate();
	response.sendRedirect("index.jsp");
%>