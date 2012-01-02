<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="edu.stevens.bbs.pojo.*"%>
<%@page import="edu.stevens.bbs.managementService.CategoryManagement"%>
<%@page import="edu.stevens.bbs.managementService.BanzhuManagement"%>
<%@ include file="_SessionCheck.jsp" %>
<%
	BanzhuManagement bm=new BanzhuManagement();
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
		<title>admin</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="../images/style.css">
		<link rel="alternate" type="application/rss+xml" title="RSS"
			href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?categoryID=1">
		<script language="JavaScript" type="text/javascript"
			src="../images/common.js"></script>

		<script type="text/javascript">
			 function selectAll()
			    {
			    	var allCategories = document.getElementsByName("allCategories")[0];
			    	var categories = document.getElementsByName("category");
			    	
			    	if(allCategories.checked)
			    	{
			    		for(var i = 0; i < categories.length; i++)
			    		{
			    			categories[i].checked = true;
			    		}
			    	}
			    	else
			    	{
			    		for(var i = 0; i < categories.length; i++)
			    		{
			    			categories[i].checked = false;
			    		}
			    	}
			    }
			 
			function calChecked()
			{
				var result=0;
				var categories = document.getElementsByName("category");
				for(var i = 0; i < categories.length; i++)
				{
					if(categories[i].checked == true)
						result++;
				}
				
				return result;
			} 
			 
			function addBanzhu()
			{
				if(calChecked()!=1)
				{
					alert('请选择一个category添加版主');
					return;
				}
					
				
				var categories = document.getElementsByName("category");
				for(var i = 0; i < categories.length; i++)
				{
			    		if(categories[i].checked == true)
			    		{
			    			var categoryid=categories[i].value;
			    			var divNode=document.getElementById('div'+categoryid);
			    			divNode.innerHTML="<form action='AddBanZhuServlet' method='post'>版主用户名：<input type='text' name='banzhuname' size=20>"
								+"<input type='hidden' name='categoryid' value="+categoryid+">"
								+"<input type='submit' value='确定'></form>";
			    		}
				}
			} 
			
			function deleteBanzhu()
			{
				if(calChecked()!=1)
				{
					alert('请选择一个category删除版主');
					return;
				}
					
				
				var categories = document.getElementsByName("category");
				for(var i = 0; i < categories.length; i++)
				{
			    		if(categories[i].checked == true)
			    		{
			    			var categoryid=categories[i].value;
			    			var divNode=document.getElementById('div'+categoryid);
			    			divNode.innerHTML="<form action='DeleteBanZhuServlet' method='post'>版主用户名：<input type='text' name='banzhuname' size=20>"
								+"<input type='hidden' name='categoryid' value="+categoryid+">"
								+"<input type='submit' value='确定'></form>";
			    		}
				}
			}
			 
			 
			function changeStatus()
			{
				if(calChecked()!=1)
				{
					alert('请选择一个category进行修改');
					return;
				}
					
				
				var categories = document.getElementsByName("category");
				for(var i = 0; i < categories.length; i++)
				{
			    		if(categories[i].checked == true)
			    		{
			    			var categoryid=categories[i].value;
			    			var parentNode=categories[i].parentNode;
			    			parentNode.innerHTML="<form action='ModifyCategoryServlet' method='post'>分类名称：<input type='text' name='categoryname' size=20>"
								+"&nbsp;&nbsp;分类描述：<input type='text' name='description' size=50>&nbsp;&nbsp;"
								+"<input type='hidden' name='categoryid' value="+categoryid+">"
								+"<input type='submit' value='确定'></form>";
			    		}
				}
			}    
			    
			function add()
			{
				
				var tr=document.getElementById("addC");
				tr.innerHTML="<form action='AddCategoryServlet' method='post'>分类名称：<input type='text' name='categoryname' size=20>"
								+"&nbsp;&nbsp;分类描述：<input type='text' name='description' size=50>&nbsp;&nbsp;"
								+"<input type='submit' value='确定'></form>";
			}

			function get_array_value(a)  
			{
			    var b = '';
				for(i=0;i<a.length;i++)
				{
					
				   if(true==a[i].checked){
					   var c = a[i].value;
					  
					   b+='#'+c;
				   }
				}
			
				return b;
			}     
			  
			    
			var xmlHttpRequest=null;//声明一个空对象接受XmlHttpRequest对象
			function deleteAjax()
			{
				if(calChecked()<=0)
				{
					alert('请选择一个或多个category进行删除');
					return;
				}
				
				
				//alert(window.ActiveXObject);
				if(window.ActiveXObject)	//IE浏览器
				{
					xmlHttpRequest=new ActiveXObject("Microsoft.XMLHTTP");
				}
				else if(window.XMLHttpRequest)	//非IE外多的其他浏览器实现
				{
					xmlHttpRequest=new XMLHttpRequest();
				}
				
				if(null!=xmlHttpRequest)
				{
					var categories=document.getElementsByName("category");
					var str=get_array_value(categories);
					
					
					/*xmlHttpRequest.open("GET","AjaxServlet?v1="+v1+"&v2="+v2,true);
					
					//关联好ajax的回调函数
					xmlHttpRequest.onreadystatechange=ajaxCallBack;
					
					//真正向服务器发送数据
					xmlHttpRequest.send(null);*/
					
					xmlHttpRequest.open("POST","DeleteCategoriesServlet",true);
					
					xmlHttpRequest.onreadystatechange=ajaxCallBack;
					xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
					xmlHttpRequest.send("str="+str);
				}
			}
			
			function ajaxCallBack()
			{
				if(xmlHttpRequest.readyState ==4)
				{
					if(xmlHttpRequest.status ==200)
					{
						var responseText=xmlHttpRequest.responseText;
						alert("删除成功");
						location.reload();
						var categories = document.getElementsByName("category");
						for(var i = 0; i < categories.length; i++)
						{
			    			categories[i].checked = false;
						}
					}
				}
			}
			
		</script>
	</head>
	<body>



		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td width="1%">
						<a href="http://bbs.chinajavaworld.com/index.jspa"><img
								src="../images/header-left.gif" alt="JAVA中文世界论坛|JAVA开发者论坛"
								border="0" height="38" width="199"> </a>
					</td>
					<td width="98%">
						<img src="../images/header-stretch.gif" alt="" border="0"
							height="38" width="100%">
					</td>
					<td width="1%">
						<img src="../images/header-right.gif" alt="" border="0"
							height="38" width="5">
					</td>
				</tr>
			</tbody>
		</table>





		<br>
		<br>

		<div id="jive-accountbox" class="clearfix">
			<dl>

				<dt>
					欢迎, 游客
				</dt>
				<dd>


					<a class="jive-acc-login"
						href="#">
						登录 / 注册</a>


				</dd>
				<dd>
					<a
						href="http://bbs.chinajavaworld.com/guestsettings%21default.jspa;jsessionid=aaanQSGLTng7V6jAYSAht"
						class="jive-acc-cp">游客设置</a>
				</dd>


			</dl>
		</div>





		<p id="jive-breadcrumbs">
			<em> <a
				href="../index.jsp">论坛主页</a>





			</em>
		</p>




		<p class="jive-page-title">

			论坛主页

		</p>




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

												论坛 / 分类
											</th>



											<th nowrap="nowrap" width="1%">

												查看
											</th>



											<th nowrap="nowrap" width="1%">

												主题 / 帖子
											</th>
											<th class="jive-last" nowrap="nowrap" width="1%">

												版主
											</th>
										</tr>
									</thead>

									<tbody>
										
										<!--category循环开始 -->
										<%
										for (Category category : categories) {
										%>
										<tr class="jive-even">
											<td class="jive-first" valign="top" width="1%">

												<div class="jive-icon">
													<img src="../images/read-16x16.gif" alt="读" border="0"
														height="16" width="16">

												</div>

											</td>
											<td class="jive-category-name" valign="top" width="96%">

												<!-- Forum Name -->
												<div id="categoryDiv">
												
													<input type="checkbox" name="category" value="<%=category.getId()%>">
													<a class="jive-forum-name" id="jive-forum-1"
														href="../articleFlat.jsp?categoryid=<%=category.getId()%>"><%=category.getName()%></a>
													
													<!-- Forum Description (if it exists) -->
	
													<span class="jive-description"> <br><%=category.getDescription()%>
													</span>
												</div>

											</td>



											<td class="jive-category-name" nowrap="nowrap" width="1%">

												1,422,750

											</td>



											<td class="jive-category-name nowrap=" nowrap" width="1%">

												<!-- Thread and Message Counts -->
												36,911 / 152,270

											</td>
											<td class="jive-category-name" nowrap="nowrap" width="1%">

												<div class="jive-last-post" id="div<%=category.getId()%>">
													
													<% for(Banzhu banzhu:bm.getBanzhus(category)){ %>
														<img src="../images/fenqubanzhu.gif"><font color="gray"><%=banzhu.getUser().getName()%></font>
														&nbsp;&nbsp;
													<%} %>
												</div>
											</td>
										</tr>
										<%
										}
										%>
										<!-- category循环结束 -->

									</tbody>
								</table>
								<span id="addC" class="jive-even"></span>
								<br>
								<div>
									全选
									<input type="checkbox" onclick="selectAll()"
										name="allCategories">
								</div>
								
								<div align="right">
									<input type="button" value="添加版主" onclick="addBanzhu();">&nbsp;
									<input type="button" value="删除版主" onclick="deleteBanzhu();">&nbsp;
									<input type="button" value="添加分类" onclick="add();">&nbsp;
									<input type="button" value="删除分类" onclick="deleteAjax();">&nbsp;
									<input type="button" value="修改分类" onclick="changeStatus();">
								</div>
							</div>
						</div>



						<a
							href="http://bbs.chinajavaworld.com/rss.jspa?feed=rss/rssmessages.jspa?categoryID=1"><img
								src="../images/feed-icon-16x16.gif"
								alt="把 RSS 阅读器指向这里读取所有论坛的最新回帖" class="jive-rss-cell" border="0"
								height="16" vspace="2" width="16"> </a>



						<br>





						<div class="jive-legend">
							<table summary="" border="0" cellpadding="0" cellspacing="0">






							</table>
						</div>

					</td>
					<td width="1%"><!-- BEGIN sidebar box 'POPULAR TAGS' -->
						<!-- END sidebar box 'POPULAR TAGS' -->
					</td>
				</tr>

			</tbody>
		</table>


		<br>
		<br>



		<table id="jive-footer" border="0" cellpadding="6" cellspacing="0"
			width="100%">
			<tbody>
				<tr>
					<td>

						<a
							href="http://bbs.chinajavaworld.com/index.jspa;jsessionid=aaanQSGLTng7V6jAYSAht">Forum
							Home</a> |

						<a
							href="http://bbs.chinajavaworld.com/login%21default.jspa;jsessionid=aaanQSGLTng7V6jAYSAht">Login
							/ Register</a> |

						<a
							href="http://bbs.chinajavaworld.com/account%21input.jspa;jsessionid=aaanQSGLTng7V6jAYSAht">Create
							Account</a> |

						<a
							href="http://bbs.chinajavaworld.com/search%21default.jspa;jsessionid=aaanQSGLTng7V6jAYSAht">Search</a>



						<br>

						<a href="http://www.chinajavaworld.com/" target="_blank"><b><font
								color="red">C</font> </b>hina<b><font color="green">J</font> </b>ava<b><font
								color="blue">W</font> </b>orld.com</a>&nbsp;
						<script src="../images/stat.htm" language="JavaScript"></script>
						<a href="http://www.cnzz.com/stat/website.php?web_id=2632601"
							target="_blank" title="站长统计"><img src="../images/pic1.gif"
								border="0" hspace="0" vspace="0"> </a>
						<img src="../images/stat_002.gif" border="0" height="0" width="0">
						<script src="../images/stat_002.htm" language="JavaScript"></script>
						<a href="http://www.cnzz.com/stat/website.php?web_id=2632614"
							target="_blank" title="站长统计"><img src="../images/pic1.gif"
								border="0" hspace="0" vspace="0"> </a>
						<img src="../images/stat.gif" border="0" height="0" width="0">

					</td>
				</tr>
			</tbody>
		</table>





		<div style="position: absolute; display: none; z-index: 9999;"
			id="livemargins_control">
			<img src="../images/monitor-background-horizontal.png"
				style="position: absolute; left: -77px; top: -5px;" height="5"
				width="77">
			<img src="../images/monitor-background-vertical.png"
				style="position: absolute; left: 0pt; top: -5px;">
			<img id="monitor-play-button" src="../images/monitor-play-button.png"
				onMouseOver="this.style.opacity=1"
				onMouseOut="this.style.opacity=0.5"
				style="position: absolute; left: 1px; top: 0pt; opacity: 0.5; cursor: pointer;">
		</div>
	</body>
</html>