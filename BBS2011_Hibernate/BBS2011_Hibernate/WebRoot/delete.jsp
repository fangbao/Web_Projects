<%@ page pageEncoding="utf-8"%>
<%@ page import="edu.stevens.bbs.pojo.*"%>
<%@page import="edu.stevens.bbs.managementService.ArticleManagement"%>

<%@ include file="_SessionCheck.jsp" %>

<%
Article rootArticle=new Article();
rootArticle.setId(Integer.parseInt(request.getParameter("id")));
rootArticle.setRootid(rootArticle.getId());

ArticleManagement am=new ArticleManagement();
am.deleteRootArticle(rootArticle);

response.sendRedirect(request.getParameter("from"));
%>

