<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="edu.stevens.bbs.pojo.*"%>
<%@page import="edu.stevens.bbs.managementService.ArticleManagement"%>
<%@page import="edu.stevens.bbs.managementService.CategoryManagement"%>
<%@page import="edu.stevens.bbs.common.MethodUtil"%>
<%@page import="java.util.Date"%>
<%
	Article article=new Article();
	article.setPid(Integer.parseInt(request.getParameter("pid")));
	article.setRootid(Integer.parseInt(request.getParameter("rootId")));
	article.setTitle(request.getParameter("title"));
	article.setContent(request.getParameter("cont"));
	article.setUser((User) session.getAttribute("user"));
	

	article.setPdate(new Date());
	article.setScans(0);
	article.setLeaf(true);
	article.setJinghua(false);
	article.setZhiding(false);
	article.setLastDate(new Date());
		
	CategoryManagement cm=new CategoryManagement();
	ArticleManagement am=new ArticleManagement();
	Category category=am.getArticle(article.getRootid()).getCategory();
	article.setCategory(category);
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


<a href="article.jsp?categoryid=<%=category.getId()%>">Topic List</a>
<script type="text/javascript">
	delayURL("articleFlat.jsp?categoryid=<%=category.getId()%>");
</script>