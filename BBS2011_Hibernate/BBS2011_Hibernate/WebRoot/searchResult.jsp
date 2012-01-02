<%@ page pageEncoding="utf-8"%>
<%@ page
	import="java.sql.*,java.util.*,edu.stevens.bbs.pojo.*,edu.stevens.bbs.managementService.*"%>
<%@page import="edu.stevens.bbs.dao.*"%>
<%@page import="edu.stevens.bbs.common.MethodUtil"%>



<%
	User user = new User();
	boolean userLogined = false;
	if (session.getAttribute("user") != null) {
		user = (User) session.getAttribute("user");
		userLogined = true;
	}
%>

<%
	
	String qStr=request.getParameter("q");
	int model=Integer.parseInt(request.getParameter("model"));

	int pageNo = 1;
	String strPageNo = request.getParameter("pageNo");
	if (strPageNo != null && !strPageNo.trim().equals("")) {
		try {
			pageNo = Integer.parseInt(strPageNo);
		} catch (NumberFormatException e) {
			pageNo = 1;
		}
	}
	ArticleManagement am = new ArticleManagement();
	FenyeResult result = am.uncertainQuery(qStr,model,pageNo);
	int totalPages = result.getTotalPages();
	pageNo = result.getPageNo();
	List<Article> articles = result.getArticles();
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>Java语言*初级版</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<link rel="stylesheet" type="text/css" href="images/style.css"
			title="Integrated Styles">
		<script language="JavaScript" type="text/javascript"
			src="images/global.js"></script>
		<link rel="alternate" type="application/rss+xml" title="RSS"
			href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20">
		<script language="JavaScript" type="text/javascript"
			src="images/common.js"></script>


		<style type="text/css">
a.a1:link {
	color: red;
	text-decoration: underline;
}

a.a1:visited {
	color: red;
	text-decoration: none;
}

a.a1:hover {
	color: #000000;
	text-decoration: none;
}

a.a1:active {
	color: #FFFFFF;
	text-decoration: none;
}
</style>
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
		<div id="jive-forumpage">
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody>
					<tr valign="top">
						<td width="98%">
							<p class="jive-breadcrumbs">
								<a href="index.jsp">Forum Home</a> 
							</p>
							<p class="jive-description">
								Prohibit any advertising in the forum, thanks!
							</p>
						</td>
					</tr>
				</tbody>
			</table>
			<div id="jive-accountbox" class="clearfix">
				<dl>

					<%
					if (!userLogined) {
					%>
					<dt>
						Welcome, guest
					</dt>
					<dd>


						<a class="jive-acc-login" href="login.jsp"> Login / Register</a>


					</dd>
					<dd>
						<a href="#" class="jive-acc-cp">Guest Settings</a>
					</dd>

					<%
					}
					%>

					<%
					if (userLogined) {
					%>
					<dt>
						Welcome,
						<%=user.getName()%>
					</dt>
					<dd>


						<a class="jive-acc-login" href="LogoutServlet"> Log out</a>


					</dd>
					<dd>
						<a href="userModify.jsp" class="jive-acc-cp">User Settings</a>
					</dd>
					<%
					}
					%>
				</dl>
			</div>
			<br>
			<table border="0" cellpadding="3" cellspacing="0" width="100%">
				<tbody>
					<tr valign="top">
						<td>
							<span class="nobreak"> PAGES: <%=pageNo%>th page,total <%=totalPages%>pages
								- <span class="jive-paginator"> [</span> </span>

							<span class="nobreak"><span class="jive-paginator">
									<a href="searchResult.jsp?pageNo=1&q=<%=qStr%>&model=<%=model%>">First
										Page</a> </span> </span>



							<span class="nobreak"><span class="jive-paginator">|</span>
							</span>
							<span class="nobreak"><span class="jive-paginator">
									<a
									href="searchResult.jsp?pageNo=<%=pageNo - 1%>&q=<%=qStr%>&model=<%=model%>">Previous
										Page</a> </span> </span>

							<span class="nobreak"><span class="jive-paginator">|
							</span> </span>
							<span class="nobreak"><span class="jive-paginator">
									<a
									href="searchResult.jsp?pageNo=<%=pageNo + 1%>&q=<%=qStr%>&model=<%=model%>">Next
										Page</a> |&nbsp; <a
									href="searchResult.jsp?pageNo=<%=totalPages%>&q=<%=qStr%>&model=<%=model%>">Last
										Page</a> ] </span> </span>
						</td>
					</tr>
				</tbody>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tbody>
					<tr valign="top">
						<td width="99%">
							<div class="jive-thread-list">
								<div class="jive-table">
									<table summary="List of threads" cellpadding="0"
										cellspacing="0" width="100%">
										<thead>
											<tr>
												<th class="jive-first" colspan="3">
													Topic
												</th>
												<th class="jive-author">
													<nobr>
														Author &nbsp;
													</nobr>
												</th>
												<th class="jive-view-count">
													<nobr>
														Scans &nbsp;
													</nobr>
												</th>
												<th class="jive-msg-count" nowrap="nowrap">
													Replys
												</th>
												<th class="jive-last" nowrap="nowrap">
													Post Time
												</th>
											</tr>
										</thead>
										<tbody>
											<%
												int lineNo = 0;
												for (Iterator<Article> it = articles.iterator(); it.hasNext();) {
													Article a = it.next();
													String classStr = lineNo % 2 == 0 ? "jive-even" : "jive-odd";
											%>
											<tr class="<%=classStr%>">
												<td class="jive-first" nowrap="nowrap" width="1%">
													<div class="jive-bullet">
														<img src="images/read-16x16.gif" alt="已读" border="0"
															height="16" width="16">
														<!-- div-->
													</div>
												</td>

												<td nowrap="nowrap" width="1%">
													<%
															String url = request.getScheme() + "://"
															+ request.getServerName() + ":"
															+ request.getServerPort();
															url += request.getContextPath();
															url += request.getServletPath();
															url += request.getQueryString() == null ? "" : ("?" + request
															.getQueryString());
															//System.out.println(url);
															//System.out.println(request.getRequestURI());
															//System.out.println(request.getRequestURL());
													%>
													
												</td>
												<td class="jive-thread-name" width="95%">
												<%=a.isZhiding() == true ? "<img src='images/ico_top.gif' title='置顶'/>"
								: ""%>
													<%=a.isJinghua() == true ? "<img src='images/ico_best.gif' title='精华'/>"
								: ""%>
													<a id="jive-thread-1"
														href="articleDetailFlat.jsp?id=<%=a.getId()%>"><%=a.getTitle()%></a>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
												<td class="jive-author" nowrap="nowrap" width="1%">
													<span class=""> <a href="#"><%=a.getUser().getName()%></a>
													</span>
												</td>
												<td class="jive-view-count" width="1%">
													<%=a.getScans()%></td>
												<td class="jive-msg-count" width="1%"><%=a.getRelpys()%></td>
												<td class="jive-last" nowrap="nowrap" width="1%">
													<div class="jive-last-post">
														Post on:
														<%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.format(a.getPdate())%>
														<br>
														Last reply on:
														<%=new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
								.format(a.getLastDate())%>
													</div>
												</td>
											</tr>

											<%
												lineNo++;
												}
											%>
										</tbody>
									</table>
								</div>
							</div>
							<div class="jive-legend"></div>
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<br>
		</div>
	</body>
</html>
