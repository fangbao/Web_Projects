<%@ page language="java" import="edu.stevens.bbs.pojo.*" pageEncoding="utf-8"%>
<%@ page import="edu.stevens.bbs.managementService.*"%>
<%
	
	String action=request.getParameter("action");
	if(action!=null&&action.equals("post")){
		UserManagement um=new UserManagement();
		User user=um.getUser(request.getParameter("username"));
		session.setAttribute("user",user);
			
		response.sendRedirect("index.jsp");
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>Forum: Login</title>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="images/style.css">

		<script type="text/javascript">
			
			var xmlHttpRequest=null;//声明一个空对象接受XmlHttpRequest对象
			function ajaxSubmit()
			{
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
					var username=document.getElementsByName("username")[0].value;
					var password=document.getElementsByName("password")[0].value;
					var code=document.getElementsByName("code")[0].value;
					
					
					/*xmlHttpRequest.open("GET","AjaxServlet?v1="+v1+"&v2="+v2,true);
					
					//关联好ajax的回调函数
					xmlHttpRequest.onreadystatechange=ajaxCallBack;
					
					//真正向服务器发送数据
					xmlHttpRequest.send(null);*/
					
					xmlHttpRequest.open("POST","LoginServlet",true);
					
					
					xmlHttpRequest.onreadystatechange=ajaxCallBack;
	
					
					xmlHttpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded")
					xmlHttpRequest.send("username="+username+"&password="+password+"&code="+code);
				}
			}
			
			function ajaxCallBack()
			{
				if(xmlHttpRequest.readyState ==4)
				{
					if(xmlHttpRequest.status ==200)
					{
						var responseText=xmlHttpRequest.responseText;
						setMsg(responseText);
					}
				}
			}
			
			function setMsg(responseText)
			{
				if(-3==responseText){
					alert('Verification code is not correct! Please reinput!');
					document.getElementById("span1").innerHTML="";
					document.getElementById("span2").innerHTML="";
					document.getElementsByName("password")[0].value="";
					document.getElementById("span3").innerHTML="<font color='red'> Verification code is not correct!</font>";
					generateCode();
				}
				
				
				if(-1==responseText){
					alert('username doesnot exist!');
					document.getElementById("span2").innerHTML="";
					document.getElementById("span3").innerHTML="";
					document.getElementById("span1").innerHTML="<font color='red'> username doesnot exist!</font>";
				}
				if(-2==responseText){
					alert('password is not correct!');
					document.getElementById("span1").innerHTML="";
					document.getElementById("span3").innerHTML="";
					document.getElementById("span2").innerHTML="<font color='red'> password is not correct!</font>";
				}
				
				if(1==responseText){
					document.loginform.submit();
				}
			}	
		
			function generateCode()
			{
				var dt=new Date();
				document.getElementById('code').src='util/validation/validationImage.jsp?dt='+dt;
			}
		
		</script>

	</head>
	<body>



		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td width="1%">
						<a href="#"><img
								src="images/header-left.gif" alt="JAVA中文世界论坛|JAVA开发者论坛"
								height="38" border="0" width="199"> </a>
					</td>
					<td width="98%">
						<img src="images/header-stretch.gif" alt="" height="38" border="0"
							width="100%">
					</td>
					<td width="1%">
						<img src="images/header-right.gif" alt="" height="38" border="0"
							width="5">
					</td>
				</tr>
			</tbody>
		</table>





		<br>
		<br>

		<div id="jive-accountbox" class="clearfix">
			<dl>

				<dt>
					Welcome, Guest
				</dt>
				<dd>


					<a class="jive-acc-login"
						href="login.jsp">
						Login / Register</a>


				</dd>
				<dd>
					<a
						href="#"
						class="jive-acc-cp">Guest Settings</a>
				</dd>


			</dl>
		</div>





		<p id="jive-breadcrumbs">
			<em> <a
				href="index.jsp">Forum Home</a>





			</em>
		</p>




		<p class="jive-page-title">

			User login

		</p>
		<p class="jive-description">

			Please login.

		</p>

		<div id="jive-loginpage">

			<p>


				If you do not have account, please
				<a href="register.jsp">Register a new account</a>.


			</p>







			<br>

			<form action="login.jsp" method="post" name="loginform">
				<input type="hidden" name="action" value="post">

				<center>
					<div class="jive-login-form">
						<div class="jive-table">
							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th colspan="2">
											User login
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="jive-label">

											<label for="username01">
												User Name:
											</label>
										</td>
										<td>
											<input style="width: 200px;" name="username" size="30"
												maxlength="150" tabindex="1" id="username01" type="text">
											&nbsp;<span id="span1"></span>
										</td>
										
									</tr>
									<tr>
										<td class="jive-label">

											<label for="password01">
												Password:
											</label>
										</td>
										<td>
											<input style="width: 200px;" name="password" size="30"
												maxlength="150" value="" tabindex="2" id="password01"
												type="password">
											&nbsp;<span id="span2"></span>
											
										</td>
									</tr>
									
									
									<tr>
										<td class="jive-label">

											<label for="validation">
												Verification code:
											</label>
										</td>
										<td>
											<input style="width: 80px;" name="code" size="20"
												 value="" tabindex="2" type="text">
											&nbsp;&nbsp;&nbsp;
											<span>
												<img src="util/validation/validationImage.jsp" id="code" border=0>
												<a href="#" onClick="generateCode();">
												Not see verification code, click here</a>
											</span>&nbsp;<span id="span3"></span>
										</td>
									</tr>
									

									<tr>
										<td>
											&nbsp;
										</td>
										<td>
											<input name="autoLogin" id="autoLoginCb" value="true"
												tabindex="3" type="checkbox">
											<label for="autoLoginCb">
												Remember me
											</label>
										</td>
									</tr>

									<tr>
										<td>
											&nbsp;
										</td>
										<td>

											<a
												href="#">I forgot my password</a>
										</td>
									</tr>

								</tbody>
								<tfoot>
									<tr>
										<td>
											&nbsp;
										</td>
										<td>

											<span class="nobreak"> <input name="login" value="登录"
													tabindex="4" class="jive-login-button" type="button"
													onclick="ajaxSubmit();"> <input name="doCancel"
													value="取消" tabindex="5" type="submit"> </span> -
											<input name="newaccount" value="创建帐号" type="submit">

										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
				</center>

			</form>


		</div>

		<br>
		<br>



		<table id="jive-footer" border="0" cellpadding="6" cellspacing="0"
			width="100%">
			<tbody>
				<tr>
					<td>

						<a href="index.jsp">Forum Home</a> |

						<a href="login.jsp">Login / Register</a> |

						<a href="register.jsp">Create Account</a>





						|

						<a href="#">Search</a>



						<br>

						<a href="#" target="_blank"><b><font
								color="red">C</font> </b>hina<b><font color="green">J</font> </b>ava<b><font
								color="blue">W</font> </b>orld.com</a>&nbsp;
						<script src="images/stat.htm" language="JavaScript"></script>
						<a href="#"
							target="_blank" title="站长统计"><img src="images/pic1.gif"
								hspace="0" border="0" vspace="0"> </a>
						<img src="images/stat_002.gif" height="0" border="0" width="0">
						<script src="images/stat_002.htm" language="JavaScript"></script>
						<a href="#"
							target="_blank" title="站长统计"><img src="images/pic1.gif"
								hspace="0" border="0" vspace="0"> </a>
						<img src="images/stat.gif" height="0" border="0" width="0">

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