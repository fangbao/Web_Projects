<%@ page pageEncoding="utf-8"%>
<%@ page import="edu.stevens.bbs.pojo.*"%>
<%@page import="edu.stevens.bbs.managementService.ArticleManagement"%>
<%@page import="edu.stevens.bbs.common.MethodUtil"%>
<%@page import="edu.stevens.bbs.managementService.CategoryManagement"%>

<%
	String strId = request.getParameter("categoryid");
	int categoryid = MethodUtil.validateId(strId, out);
	if (-1 == categoryid)
		return;

	String action = request.getParameter("action");

	if (action != null && action.trim().equals("post")) {

		Article article = new Article();
		article.setTitle(request.getParameter("title"));
		article.setContent(request.getParameter("cont"));
		article.setUser((User) session.getAttribute("user"));

		CategoryManagement cm = new CategoryManagement();
		article.setCategory(cm.getCategory(categoryid));

		ArticleManagement am = new ArticleManagement();
		am.addArticle(article);

		response.sendRedirect("articleFlat.jsp?categoryid="
		+ categoryid);

	}
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>Post new topic</title>
		<meta http-equiv="content-type" content="text/html; charset=GBK">
		<link rel="stylesheet" type="text/css" href="images/style.css"
			title="Integrated Styles">
		<script language="JavaScript" type="text/javascript"
			src="images/global.js"></script>
		<!-- fckeditor -->
		<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
		<script type="text/javascript">

			window.onload = function()
			{
				// Automatically calculates the editor base path based on the _samples directory.
				// This is usefull only for these samples. A real application should use something like this:
				// oFCKeditor.BasePath = '/fckeditor/' ;	// '/fckeditor/' is the default value.
				// var sBasePath = document.location.pathname.substring(0,document.location.pathname.lastIndexOf('_samples')) ;
				var sBasePath = "<%=request.getScheme() + "://"
								+ request.getServerName() + ":" + request.getServerPort()
								+ request.getContextPath() + "/fckeditor/"%>"
			//alert(sBasePath);
				var oFCKeditor = new FCKeditor( 'cont' ) ;
				oFCKeditor.BasePath	= sBasePath ;
				oFCKeditor.ReplaceTextarea() ;
			}

		</script>
		<!-- end of fckeditor -->

		<link rel="alternate" type="application/rss+xml" title="RSS"
			href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?threadID=744236">
	</head>
	<body>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td width="40%">
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
								<a href="http://bbs.chinajavaworld.com/index.jspa">首页</a> &#187;
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
								Post new topic
								<br>
							</p>
						</td>
						<td width="1%">
							<div class="jive-accountbox"></div>
						</td>
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

											<form action="post.jsp" method="post">
												<input type="hidden" name="action" value="post" />
												<input type="hidden" name="categoryid" value=<%=categoryid%>>
												Title:
												<input type="text" name="title">
												<br>
												Content:
												<textarea name="cont" rows="15" cols="80"></textarea>
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
