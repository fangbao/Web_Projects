<%@ page language="java" import="edu.stevens.bbs.pojo.*" pageEncoding="utf-8" 
contentType="text/html; charset=GB18030"%>
<%
User user=(User)session.getAttribute("user");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	
    <base href="<%=basePath%>">
    
    <title>My JSP 'Reply.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GB18030">
    <meta http-equiv= "Refresh" content= "5;url=index.jsp">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		.td{
			color:red
		}
	</style>

	<script type="text/javascript">
	
		window.onload=function(){
			var times=6;
			var time=document.getElementById("time");
			
			var clock=function(){
				window.setTimeout(clock,1000);
				times=times-1;
				time.innerHTML=times;
			}
			clock();
		}
		
	</script>


  </head>
  
  <body>
	  <div align="center">
	    <table>
	    	<tr>
	    		<td>Congratulations! Registration successful!</td>
	    	</tr>
	    	<tr>
	    		<td>Please remember user name and password:</td>
				<td><font color="brown">User Name:<%=user.getName() %></font></td>
				<td><font color="brown">Password:<%=user.getPassword() %></font></td>
	    	</tr>
	    	<tr>
	    		<td>The page will after</td>
	    		<td class="td"><div id="time">5</div></td>
	    		<td>seconds Jump back to home page</td>
	    	</tr>
	    </table>
	   </div>
	   <div align="center">
	  		<h4><a href="index.jsp">If the page does not jump, please click here</a></h4>
	  </div>
  </body>
</html>
