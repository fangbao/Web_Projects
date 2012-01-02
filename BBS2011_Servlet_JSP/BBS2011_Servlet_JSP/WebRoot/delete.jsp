<%@ page pageEncoding="utf-8"%>
<%@ page import="edu.stevens.bbs.pojo.*"%>
<%@page import="edu.stevens.bbs.managementService.ArticleManagement"%>

<%@ include file="_SessionCheck.jsp" %>

<%
Article article=new Article();
article.setId(Integer.parseInt(request.getParameter("id")));
article.setPid(Integer.parseInt(request.getParameter("pid")));

ArticleManagement am=new ArticleManagement();
am.deleteArticle(article,Boolean.parseBoolean(request.getParameter("isLeaf")));

response.sendRedirect(request.getParameter("from"));
%>

