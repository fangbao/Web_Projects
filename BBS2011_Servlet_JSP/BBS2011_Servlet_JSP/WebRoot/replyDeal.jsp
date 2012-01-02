<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="edu.stevens.bbs.pojo.*"%>
<%@page import="edu.stevens.bbs.managementService.ArticleManagement"%>
<%@page import="edu.stevens.bbs.managementService.CategoryManagement"%>
<%@page import="edu.stevens.bbs.common.MethodUtil"%>
<%
	
	
	String strId = request.getParameter("categoryid");
	int categoryid=MethodUtil.validateId(strId,out);
	if(-1==categoryid)
		return;
	
	Article article=new Article();
	article.setPid(Integer.parseInt(request.getParameter("pid")));
	article.setRootid(Integer.parseInt(request.getParameter("rootId")));
	article.setTitle(request.getParameter("title"));
	article.setContent(request.getParameter("cont"));
	article.setUser((User) session.getAttribute("user"));
		
	CategoryManagement cm=new CategoryManagement();
	article.setCategory(cm.getCategory(categoryid));
	
	ArticleManagement am=new ArticleManagement();
	am.replyArticle(article);
%>

<span id="time" style="background: red">5</span>
Seconds automatically jump, if you do not jump, please click the link below

<script language="JavaScript1.2" type="text/javascript">
<!--
//  Place this in the 'head' section of your page.  

function delayURL(url) {
	var delay = document.getElementById("time").innerHTML;
//alert(delay);
	if(delay > 0) {
		delay--;
		document.getElementById("time").innerHTML = delay;
	} else {
		window.top.location.href = url;
    }
    setTimeout("delayURL('" + url + "')", 1000); //delayURL(http://wwer)
}

//-->

</script>


<a href="article.jsp?categoryid=<%=categoryid%>">Topic List</a>
<script type="text/javascript">
	delayURL("articleFlat.jsp?categoryid=<%=categoryid%>");
</script>