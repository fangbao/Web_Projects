<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="edu.stevens.bbs.pojo.Category"%>
<%@page import="edu.stevens.bbs.managementService.CategoryManagement"%>
<%@page import="edu.stevens.bbs.pojo.*"%>
<%@page import="edu.stevens.bbs.managementService.UserManagement"%>
<%
	User user=new User();
	boolean userLogined = false;
	if (session.getAttribute("user") != null) {
		user = (User) session.getAttribute("user");
		userLogined = true;
	}
%>

<%
	UserManagement um=new UserManagement();
	CategoryManagement cm = new CategoryManagement();
	List<Category> categories = cm.getCategories();

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>Forum: Forum Home</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="images/style.css">
		<link rel="alternate" type="application/rss+xml" title="RSS"
			href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?categoryID=1">

		<script language="JavaScript" type="text/javascript"
			src="images/common.js"></script>
	</head>
	<body>



		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td width="1%">
						<a href="http://bbs.chinajavaworld.com/index.jspa"><img
								src="images/header-left.gif" alt="JAVA中文世界论坛|JAVA开发者论坛"
								border="0" height="38" width="199">
						</a>
					</td>
					<td width="98%">
						<img src="images/header-stretch.gif" alt="" border="0" height="38"
							width="100%">
					</td>
					<td width="1%">
						<img src="images/header-right.gif" alt="" border="0" height="38"
							width="5">
					</td>
				</tr>
			</tbody>
		</table>





		<br>
		<br>

			<div id="jive-accountbox" class="clearfix">
				<dl>

					<%
					if (!userLogined) {
					%>
					<dt>
						Welcome, guest
					</dt>
					<dd>


						<a class="jive-acc-login"
							href="login.jsp">
							Login / Register</a>


					</dd>
					<dd>
						<a
							href="http://bbs.chinajavaworld.com/guestsettings%21default.jspa"
							class="jive-acc-cp">Guest Settings</a>
					</dd>

					<%
					}
					%>
					
					<%
					if (userLogined) {
					%>
					<dt>
						Welcome, <%=user.getName() %>
					</dt>
					<dd>


						<a class="jive-acc-login"
							href="LogoutServlet">
							Log out</a>


					</dd>
					<dd>
						<a
							href="userModify.jsp"
							class="jive-acc-cp">User Settings</a>
					</dd>
					<%
					}
					%>
				</dl>
			</div>





		<p id="jive-breadcrumbs">
			<em> <a
				href="index.jsp">Forum Home</a>





			</em>
		</p>




		<p class="jive-page-title">

			Forum Home

		</p>
		<p class="jive-description">

			Welcome to JAVA world community. <%=um.getTotalUsersCount()%> registered users,. Welcome New Member&nbsp;
			<a href="#"><%=um.getLastUser().getName() %></a>。

		</p>

		<div id="jive-frontpage">





			<form action="searchResult.jsp" id="jive-searchform">



				<br>

				<div class="jive-search-form">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tbody>
							<tr>
								<td class="jive-description" nowrap="nowrap" width="1%">


									<label for="q01">
										<a href="#"
											title="More Search Functions">Search</a> In All Forums:
									</label>

									<input name="q" size="30" maxlength="100" id="q01"
										accesskey="s" type="text">
									<input type="radio" name="model" checked value="1">in title
									<input type="radio" name="model" value="2">in content
									&nbsp;&nbsp;<input value="Go" type="submit">

								</td>
								<td class="jive-description" align="right" width="98%">




									Online users: 1,551 Guest, 2 User.


									<a href="#">More Information »</a>



								</td>
							</tr>
						</tbody>
					</table>
				</div>

				</form>

				<table border="0" cellpadding="0" cellspacing="0" width="100%">
					<tbody>
						<tr valign="top">
							<td width="99%">



								<div class="jive-forum-list">
									<div class="jive-table">
										<table summary="分类和论坛列表" cellpadding="0" cellspacing="0"
											width="100%">
											<thead>
												<tr>
													<th colspan="2" class="jive-first" width="97%">

														Forum / Category
													</th>



													<th nowrap="nowrap" width="1%">

														Scan
													</th>



													<th nowrap="nowrap" width="1%">

														Topics / Articles
													</th>
													<th class="jive-last" nowrap="nowrap" width="1%">

														Moderator
													</th>
												</tr>
											</thead>

											<tbody>








												<tr>
													<td class="jive-category-name" colspan="5">
														<a
															href="#">JAVA open-source project classification Forum</a>

														<span class="jive-description"> <br>Discuss the Spring / Hibernate and other open source project applications contain virtually all of the popular open-source project.
															<a
															href="#">Click here to enter&gt;&gt;</a>。Latest addition<a
															href="#"><b>Jive-depth study</b>
														</a> </span>

													</td>
												</tr>

												
												<!--category循环开始 -->
												<% for(Category category:categories) {%>
												<tr class="jive-even">
													<td class="jive-first" valign="top" width="1%">

														<div class="jive-icon">



															<img src="images/read-16x16.gif" alt="读" border="0"
																height="16" width="16">



														</div>

													</td>
													<td class="jive-forum-name" valign="top" width="96%">

														<!-- Forum Name -->
														<a class="jive-forum-name" id="jive-forum-1"
															href="articleFlat.jsp?categoryid=<%=category.getId()%>"><%=category.getName() %></a>

														<!-- Forum Description (if it exists) -->

														<span class="jive-description"> <br><%=category.getDescription() %>
														</span>


													</td>



													<td class="jive-view-count" nowrap="nowrap" width="1%">

														<%=cm.getScanCount(category.getId()) %>

													</td>



													<td class="jive-msg-count" nowrap="nowrap" width="1%">

														<!-- Thread and Message Counts -->
														<%=cm.getRootArticleCount(category.getId())%> / <%=cm.getArticleCount(category.getId()) %>

													</td>
													<td class="jive-last" nowrap="nowrap" width="1%">

													<div class="jive-last-post" id="div<%=category.getId()%>">
													
													<% for(Banzhu banzhu:category.getBanzhus()){ %>
														<img src="images/fenqubanzhu.gif"><font color="gray"><%=banzhu.getUser().getName()%></font>
														&nbsp;&nbsp;
													<%} %>
												</div>
													</td>
												</tr>
												<%} %>
												<!-- category循环结束 -->

											</tbody>
										</table>
									</div>
								</div>



								<a
									href="#"><img
										src="images/feed-icon-16x16.gif"
										alt="把 RSS 阅读器指向这里读取所有论坛的最新回帖" class="jive-rss-cell"
										border="0" height="16" vspace="2" width="16">
								</a>



								<br>





								<div class="jive-legend">
									<table summary="" border="0" cellpadding="0" cellspacing="0">






									</table>
								</div>

							</td>
							<td width="1%">
								<!-- BEGIN sidebar box 'POPULAR TAGS' -->
								<!-- END sidebar box 'POPULAR TAGS' -->
							</td>
						</tr>

					</tbody>
				</table>

			

		</div>

		<br>
		<br>



		<table id="jive-footer" border="0" cellpadding="6" cellspacing="0"
			width="100%">
			<tbody>
				<tr>
					<td>

						<a
							href="index.jsp">Forum
							Home</a> |

						<a
							href="login.jsp">Login
							/ Register</a> |

						<a
							href="register.jsp">Create
							Account</a> |

						<a
							href="#">Search</a>



						<br>

						<a href="index.jsp" target="_blank"><b><font
								color="red">C</font>
						</b>hina<b><font color="green">J</font>
						</b>ava<b><font color="blue">W</font>
						</b>orld.com</a>&nbsp;
						<script src="images/stat.htm" language="JavaScript"></script>
						<a href="#"
							target="_blank" title="站长统计"><img src="images/pic1.gif"
								border="0" hspace="0" vspace="0">
						</a>
						<img src="images/stat_002.gif" border="0" height="0" width="0">
						<script src="images/stat_002.htm" language="JavaScript"></script>
						<a href="#"
							target="_blank" title="站长统计"><img src="images/pic1.gif"
								border="0" hspace="0" vspace="0">
						</a>
						<img src="images/stat.gif" border="0" height="0" width="0">

					</td>
				</tr>
			</tbody>
		</table>





		<div style="position: absolute; display: none; z-index: 9999;"
			id="livemargins_control">
			<img src="images/monitor-background-horizontal.png"
				style="position: absolute; left: -77px; top: -5px;" height="5"
				width="77">
			<img src="images/monitor-background-vertical.png"
				style="position: absolute; left: 0pt; top: -5px;">
			<img id="monitor-play-button" src="images/monitor-play-button.png"
				onMouseOver="this.style.opacity=1"
				onMouseOut="this.style.opacity=0.5"
				style="position: absolute; left: 1px; top: 0pt; opacity: 0.5; cursor: pointer;">
		</div>
	</body>
</html>