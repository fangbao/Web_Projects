<%@ page pageEncoding="utf-8"%>
<%@ page import="java.sql.*,edu.stevens.bbs.pojo.*"%>
<%@page import="edu.stevens.bbs.dao.*"%>
<%@page import="edu.stevens.bbs.managementService.ArticleManagement"%>

<%
	
	String action = request.getParameter("action");
	
	int id = Integer.parseInt(request.getParameter("id"));
	ArticleManagement am=new ArticleManagement();
	
	if (action != null && action.trim().equals("modify")) {
		
		Article newArticle=new Article();
		newArticle.setId(id);
		newArticle.setTitle(request.getParameter("title"));
		newArticle.setContent(request.getParameter("cont"));
		am.update(newArticle);
		
		response.sendRedirect("articleFlat.jsp");
		return;

	}
%>


<%
Article a = new Article();

a=am.getArticle(id);

 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>Post new topic</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css" href="images/style.css"
			title="Integrated Styles">
		<script language="JavaScript" type="text/javascript"
			src="images/global.js"></script>
		<!-- fckeditor -->
		<!-- 为了速度而没有使用fckeditor -->
		<!-- end of fckeditor -->

		<link rel="alternate" type="application/rss+xml" title="RSS"
			href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?threadID=744236">
	</head>
	<body>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td width="40%">&nbsp; 
						<img src="images/header-stretch.gif" alt="" border="0" height="57"
							width="100%">
					</td>
					<td width="1%">
						<img src="images/header-right.gif" alt="" height="57" border="0">
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		<div id="jive-flatpage">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody>
					<tr valign="top">
						<td width="99%">
							<p class="jive-breadcrumbs">
								<a href="index.jsp">Home</a> &#187;
								<a
									href="http://bbs.chinajavaworld.com/forumindex.jspa?categoryID=1">ChinaJavaWorld技术论坛|Java世界_中文论坛</a>
								&#187;
								<a
									href="http://bbs.chinajavaworld.com/category.jspa?categoryID=2">Java
									2 Platform, Standard Edition (J2SE)</a> &#187;
								<a
									href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=0">Java语言*初级版</a>
							</p>
							<p class="jive-page-title">
								Modify
								<br>
							</p>
						</td>
						<td width="1%"><br>
							
						<br></td>
					</tr>
				</tbody>
			</table>
			<div class="jive-buttons">
				<br>
			</div>
			<br>
			<table border="0" cellpadding="0" cellspacing="0" width="930"
				height="61">
				<tbody>
					<tr valign="top">
						<td width="99%">
							<div id="jive-message-holder">
								<div class="jive-message-list">
									<div class="jive-table">
										<div class="jive-messagebox">

											<form action="modify.jsp" method="post">
												<input type="hidden" name="action" value="modify" />
												<input type="hidden" name="id" value="<%=id %>"/>
												
												Title:
												<input type="text" name="title" value="<%=a.getTitle() %>">
												<br>
												Content:
												<textarea name="cont" rows="15" cols="80"><%=a.getContent() %></textarea>
												<br>
												<input type="submit" value="submit" />
											</form>

										</div>
									</div>
								</div>
								<div class="jive-message-list-footer">
									<br>
								</div>
							</div>
						</td>
						<td width="1%">
							&nbsp;
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</body>
</html>
