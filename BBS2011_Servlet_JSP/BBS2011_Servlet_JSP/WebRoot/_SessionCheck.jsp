

<%
String adminLogined = (String)session.getAttribute("adminLogined");
if(adminLogined == null || !adminLogined.trim().equals("true")) {
	response.sendRedirect("login.jsp");
	return;
} 
 %>

