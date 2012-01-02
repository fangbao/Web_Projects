<%@ page pageEncoding="utf-8"%>


<%
	request.setCharacterEncoding("utf-8");
	String action = request.getParameter("action");
	String username = "";
	if (action != null && action.trim().equals("login")) {
		username = request.getParameter("username");
		//check username whether valid or not!
		String password = request.getParameter("password");
		if(username == null || !username.trim().equals("admin")) {
			out.println("username not correct!");
		} else if(password == null || !password.trim().equals("admin")) {
			out.println("password not correct!");
		} else {
			session.setAttribute("adminLogined" , "true");
			response.sendRedirect("admin.jsp");
		}
	}
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>管理员登录</title>

	</head>
	<body>

		<form action="login.jsp" method="post">
			<input type="hidden" name="action" value="login"/>
			用户名：
			<input type="text" name="username" value="<%=username %>"/>
			<br>
			密码：
			<input type="password" name="password" />
			<br>
			<input type="submit" value="login" />
		</form>


	</body>
</html>
