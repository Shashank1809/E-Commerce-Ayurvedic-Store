<%
	session.removeAttribute("alogin");
	session.removeAttribute("aid");
	session.invalidate();
	response.sendRedirect("admin-index.jsp");
%>