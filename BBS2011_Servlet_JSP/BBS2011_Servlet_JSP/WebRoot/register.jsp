<%@ page language="java" import="edu.stevens.bbs.bbsException.*,edu.stevens.bbs.managementService.*,edu.stevens.bbs.pojo.*" pageEncoding="utf-8"%>
<%
	
	String action=request.getParameter("action");
	if(action!=null&&action.trim().equals("post")){
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		//------------
		String passwordConfirm=request.getParameter("passwordConfirm");
		
		String address=request.getParameter("location");
		String job=request.getParameter("occupation");
		String website=request.getParameter("homepage");
		String description=request.getParameter("biography");
		String signature=request.getParameter("signature");
		boolean autoLogin=Boolean.parseBoolean(request.getParameter("autoLogin"));
		
		User user=new User();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAddress(address);
		user.setJob(job);
		user.setWebsite(website);
		user.setDescription(description);
		user.setSignature(signature);
		user.setAutoLogin(autoLogin);
		
		UserManagement um=new UserManagement();
		
		try{
			um.add(user);
		}catch(UserNameExistException e){
			out.println("<script>alert('"+e.getMessage()+"')</script>");
			out.println("<a href='register.jsp'>Return</a>");
			return;
		}
		
		session.setAttribute("user",user);
		response.sendRedirect("registerOK.jsp");
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html><head>
	<script language="javascript">
<!--	
	//javascript去空格函数 
	function LTrim(str){ //去掉字符串 的头空格
		var i;
		for(i=0;i<str.length; i++) {
			if(str.charAt(i)!=" ") break;
		}
		str = str.substring(i,str.length);
		return str;
	}
	
	function RTrim(str){
		var i;
		for(i=str.length-1;i>=0;i--){
			if(str.charAt(i)!=" "&&str.charAt(i)!=" ") break;
		}
		str = str.substring(0,i+1);
		return str;
	}
	function Trim(str){
	
		return LTrim(RTrim(str));
	
	}
	
	function check() {
		if(Trim(document.accountform.name.value) == "") {
			alert("please input the username!");
			document.accountform.password.value="";
			document.accountform.passwordConfirm.value="";
			document.accountform.name.focus();
			return false;
		}
		
			if(Trim(document.accountform.password.value) == "") {
			alert("please input the password!");
			document.accountform.password.value="";
			document.accountform.passwordConfirm.value="";
			document.accountform.password.focus();
			return false;
		}
		
		if(Trim(document.accountform.passwordConfirm.value) == "") {
			alert("please input the passwordConfirm!");
			document.accountform.password.value="";
			document.accountform.passwordConfirm.value="";
			document.accountform.passwordConfirm.focus();
			return false;
		}
		
		if(Trim(document.accountform.email.value) == "") {
			alert("please input the email!");
			document.accountform.password.value="";
			document.accountform.passwordConfirm.value="";
			document.accountform.email.focus();
			return false;
		}
		
		var name=document.getElementsByName("name")[0].value;
		var password=document.getElementsByName("password")[0].value;
		var passwordConfirm=document.getElementsByName("passwordConfirm")[0].value;
		
		
		if(password!=passwordConfirm){
			alert("password and passwordConfirm are not identical");
			document.accountform.password.value="";
			document.accountform.passwordConfirm.value="";
			document.accountform.password.focus();
			return false;
		}
		
		if(name.length<6 || name.lenght>12){
			alert("the length of name must be in 6 to 12 digits");
			document.accountform.name.value="";
			document.accountform.password.value="";
			document.accountform.passwordConfirm.value="";
			document.accountform.name.focus();
			return false;
		}
		
		if(password.length<6 || password.lenght>12){
			alert("the length of password must be in 6 to 12 digits");
			document.accountform.password.value="";
			document.accountform.passwordConfirm.value="";
			document.accountform.password.focus();
			return false;
		}
		
		
		
		
		return true;
		
	}
-->
</script>


    <title>Forum: Register New Account</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="images/style.css">
   
</head>
<body>



    <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
        <tr>
            <td width="1%"><a href="#"><img src="images/header-left.gif" alt="JAVA中文世界论坛|JAVA开发者论坛" height="38" border="0" width="199"></a></td>
            <td width="98%"><img src="images/header-stretch.gif" alt="" height="38" border="0" width="100%"></td>
            <td width="1%"><img src="images/header-right.gif" alt="" height="38" border="0" width="5"></td>
        </tr>
    </tbody>
    </table>





        <br>
        <br>

<div id="jive-accountbox" class="clearfix">
    <dl>
        
            <dt>欢迎, 游客</dt>
            <dd>


                        <a class="jive-acc-login" href="login.jsp">
                            登录 / 注册</a>


            </dd>
            <dd><a href="#" class="jive-acc-cp">游客设置</a></dd>


    </dl>
</div>





    <p id="jive-breadcrumbs">
    <em>


    <a href="index.jsp">Forum Home</a>





    </em>
</p>




<p class="jive-page-title">
    
</p>
<p class="jive-description">
    
</p>

<!-- BEGIN main body column container -->
<div id="jive-body-maincol-container">

<!-- BEGIN main body column -->
<div id="jive-body-maincol">


     <!-- BEGIN header & intro  -->
    <div id="jive-body-intro">
        <div id="jive-body-intro-content">
            <h1>Create new account</h1>
            <p>Please fill out the form below to create a new account. With * Items that are required.</p>
        </div>
    </div>
    <!-- END header & intro -->




    <form action="register.jsp" method="post" name="accountform" onsubmit="return check();">

	<input type="hidden" name="action" value="post">
    <!-- BEGIN jive table -->
    <div class="jive-table">
    


        <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th colspan="2" class="jive-first-last">
Create new account                </th>
            </tr>
        </thead>
        <tbody>
        <tr>
            <td class="jive-table-cell-label jive-label-required">
                <label for="username01">
User Name:                    <span>*</span>                </label>            </td>
            <td>
                <input name="name" size="30" maxlength="30" onFocus="this.select();" id="username01" type="text">            </td>
        </tr>
        <tr>
            <td class="jive-table-cell-label jive-label-required">
                <label for="email01">
Email:                    <span>*</span>                </label>            </td>
            <td>
                <input name="email" size="40" maxlength="80" onFocus="this.select();" id="email01" type="text">


                <div>
                    <input name="emailVisible" value="true" id="ev01" checked="checked" type="radio">
                    <label for="ev01">Display</label>
                    <input name="emailVisible" value="false" id="ev02" type="radio">
                    <label for="ev02">Hidden</label>
                </div>            </td>
        </tr>
        <tr>
            <td class="jive-table-cell-label jive-label-required">
                <label for="password01">
Password:                    <span>*</span>                </label>            </td>
            <td>
                <input name="password" size="15" maxlength="30" value="" onFocus="this.select();" id="password01" type="password">            </td>
        </tr>
        <tr>
            <td class="jive-table-cell-label jive-label-required">
                <label for="confirmpass01">
Confirm Password:                    <span>*</span>                </label>            </td>
            <td>
                <input name="passwordConfirm" size="15" maxlength="30" value="" onFocus="this.select();" id="confirmpass01" type="password">            </td>
        </tr>
        
        <tr>
            <td class="jive-table-cell-label jive-label-required">
                <label for="location01">
Location:                </label>            </td>
            <td>
                <input name="location" size="30" maxlength="30" onFocus="this.select();" id="location01" type="text">            </td>
        </tr>
        
        <tr>
            <td class="jive-table-cell-label jive-label-required">
                <label for="occupation01">
Occupation:                </label>            </td>
            <td>
                <input name="occupation" size="30" maxlength="30" onFocus="this.select();" id="occupation01" type="text">            </td>
        </tr>
        
        <tr>
            <td class="jive-table-cell-label jive-label-required">
                <label for="homepage01">
Blog:                </label>            </td>
            <td>
                <input name="homepage" size="30" maxlength="100" onFocus="this.select();" id="homepage01" type="text">            </td>
        </tr>
        
        <tr>
            <td class="jive-table-cell-label jive-label-required">
                <label for="biography01">
Description:                </label>            </td>
            <td>
                <textarea name="biography" cols="30" rows="3" id="biography01"></textarea>            </td>
        </tr>
        
        <tr>
            <td class="jive-table-cell-label jive-label-required">
                <label for="signature01">
Signature:                </label>            </td>
            <td>
								<textarea name="signature" cols="30" rows="3" id="signature01"></textarea>            </td>
        </tr>


<tr>
            <td class="jive-table-cell-label">
Auto Login:            </td>
            <td>
                <input name="autoLogin" id="cb01" type="checkbox">
                <label for="cb01">Remember me</label>            </td>
        </tr>
    <tr>
        <td>&nbsp;</td>
        <td>

           <input name="createButton" class="jive-form-button jive-form-button-submit" value="Create Account" type="submit">
            <input name="method:cancel" class="jive-form-button jive-form-button-cancel" value="Cancel" type="reset">        </td>
    </tr>
    </tbody></table>

    </div>

    </form>

  </div>
    <!-- END main body column -->


</div>
    <!-- END main body column container -->

<br><br>



    <table id="jive-footer" border="0" cellpadding="6" cellspacing="0" width="100%">
    <tbody><tr>
        <td>
            
            <a href="index.jsp">Forum Home</a>

            
                |
                
                <a href="login.jsp">Login / Register</a>
            

            
                |
                
                <a href="register.jsp">Create Account</a>
            

            

            
            |
            
            <a href="#">Search</a>
            

            
                <br>
                
               
            
        </td>
    </tr>
    </tbody></table>


</body></html>