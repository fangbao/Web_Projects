<%@ page pageEncoding="utf-8"%>
<%@ page import="java.sql.*,java.util.*,edu.stevens.bbs.pojo.*,edu.stevens.bbs.managementService.*"%>
<%@page import="edu.stevens.bbs.dao.*"%>
<%@page import="edu.stevens.bbs.common.MethodUtil"%>

<%
	
	String strId = request.getParameter("id");
	int id=MethodUtil.validateId(strId,out);
	if(-1==id)
		return;
	
	strId = request.getParameter("categoryid");
	int categoryid=MethodUtil.validateId(strId,out);
	if(-1==categoryid)
		return;
	CategoryManagement cm=new CategoryManagement();
	Category category=cm.getCategory(categoryid);
	
	ArticleManagement am=new ArticleManagement();
	List<Article> articles=am.getChildrenArticles(id);
	String zhuti=am.getArticle(id).getTitle();

%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Java|Java世界_中文论坛|ChinaJavaWorld技术论坛 : 初学java遇一难题！！望大家能帮忙一下 ...</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
<script language="JavaScript" type="text/javascript" src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS" href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?threadID=744236">
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
    <tr>
      <td width="40%"><img src="images/header-stretch.gif" alt="" border="0" height="57" width="100%">
     	</td>
      <td width="1%"><img src="images/header-right.gif" alt="" height="57" border="0"></td>
    </tr>
  </tbody>
</table>
<br>
<div id="jive-flatpage">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="99%"><p class="jive-breadcrumbs"> <a href="index.jsp">Forum Home</a> &#187; <a href="articleFlat.jsp?categoryid=<%=categoryid%>"><%=category.getName() %></a></p>
          <p class="jive-page-title"> Topic:&nbsp;<%=zhuti%> </p></td>
        <td width="1%"><div class="jive-accountbox"></div></td>
      </tr>
    </tbody>
  </table>
  <div class="jive-buttons">
    <table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td class="jive-icon"><a href="reply.jsp?id=<%=((Article)articles.get(0)).getId() %>&rootId=<%=((Article)articles.get(0)).getRootid() %>&categoryid=<%=categoryid%>"><img src="images/reply-16x16.gif" alt="回复本主题" border="0" height="16" width="16"></a></td>
          <td class="jive-icon-label"><a id="jive-reply-thread" href="reply.jsp?id=<%=((Article)articles.get(0)).getId() %>&rootId=<%=((Article)articles.get(0)).getRootid() %>&categoryid=<%=categoryid%>">Reply to this Topic</a> </td>
        </tr>
      </tbody>
    </table>
  </div>
  <br>
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="99%"><div id="jive-message-holder">
            <div class="jive-message-list">
              <div class="jive-table">
                <div class="jive-messagebox">
				
				<!-- start -->
				<%
				for(int i=0; i<articles.size(); i++) {
					Article a = articles.get(i);
					String floor = i == 0 ? "First Floor" :(i+1) + "th Floor";
					
					
					UserManagement um=new UserManagement();
					User user=a.getUser();
				 %>
				
                  <table summary="Message" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody>
                      <tr id="jive-message-780144" class="jive-odd" valign="top">
                        <td class="jive-first" width="1%">
						<!-- personal information table -->
						<table border="0" cellpadding="0" cellspacing="0" width="150">
                            <tbody>
                              <tr>
                                <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                      <tr valign="top">
                                        <td style="padding: 0px;" width="1%"><nobr> <a href="#" title="诺曼底客"><%=user.getName() %></a> </nobr> </td>
                
                                      </tr>
                                    </tbody>
                                  </table>
                                  <img class="jive-avatar" src=<%=(user.isHasUserImg()==true?"'upload/userImage/"+user.getName()+".jpg'":"upload/userImage/def.jpg")%> alt="" border="0" width="80" height="80"> <br><br>
                                          Level：<br><%for(int j=0;j<=user.getTotalPost()/10;j++){ %>
                                          <img class="jive-status-level-image" src="images/level1.gif" title="世界新手" alt="" border="0">
                							<%} %>
                                  <br><br>
                                  <span class="jive-description"> Post:
                                  <%=user.getTotalPost() %> <br>
                                  Score: <%=user.getTotalPost()*10+20 %><br>
                                  Register:
                                  <%=new java.text.SimpleDateFormat("yyyy-MM-dd")
								.format(user.getDatetime()) %> <br>
                                  <a href="#" target="_blank"><font color="red">My Blog</font></a> </span> </td>
                              </tr>
                            </tbody>
                          </table>
						  <!--personal information table ends-->
						  
						  </td>
                        <td class="jive-last" width="99%"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                              <tr valign="top">
                                <td width="1%"></td>
                                <td width="97%"><span class="jive-subject"><%=floor + "-------" + a.getTitle()%></span> </td>
                                <td class="jive-rating-buttons" nowrap="nowrap" width="1%"></td>
                                <td width="1%"><div class="jive-buttons">
                                    <table border="0" cellpadding="0" cellspacing="0">
                                      <tbody>
                                        <tr>
                                          <td>&nbsp;</td>
                                          <td class="jive-icon"><a href="#" title="Reply to this Topic"><img src="images/reply-16x16.gif" alt="Reply to this Topic" border="0" height="16" width="16"></a> </td>
                                          <td class="jive-icon-label"><a href="reply.jsp?id=<%=a.getId() %>&rootId=<%=a.getRootid() %>&categoryid=<%=categoryid%>" title="Reply to this Topic">Reply</a> </td>
                                        </tr>
                                      </tbody>
                                    </table>
                                  </div></td>
                              </tr>
                              <tr>
                                <td colspan="4" style="border-top: 1px solid rgb(204, 204, 204);"><br>
                                
                           		<%  int louNo;
                           			if((louNo=ArticleManagement.getLouNo(articles,a.getPid()))!=-1) {
                           		%>
                                <font color="red">Reply to&nbsp;<%=louNo==1?"First Floor:":louNo+"th Floor:"%></font>
                                <br><br>&nbsp;
                                <%
                                }
                                %>
                                 <%=a.getContent() %> <br>
                                  <br>
                                </td>
                              </tr>
                              <tr>
                                <td colspan="4" style="font-size: 9pt;"><img src="images/sigline.gif"><br>
                                  <font color="#568ac2"><%=user.getSignature() %></font> <br>
                                </td>
                              </tr>
                              <tr>
                                <td colspan="4" style="border-top: 1px solid rgb(204, 204, 204); font-size: 9pt; table-layout: fixed;"> ·<a href="http://www.stevens.edu"><font color="#666666">http://www.stevens.edu</font></a> </td>
                              </tr>
                            </tbody>
                          </table></td>
                      </tr>
                    </tbody>
                  </table>
				  
				  <!-- end -->
				  <%
				  }
				   %>
                </div>
              </div>
            </div>
            <div class="jive-message-list-footer">
              <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                  <tr>
                    <td nowrap="nowrap" width="1%"><br><br></td>
                    <td align="center" width="98%"><table border="0" cellpadding="0" cellspacing="0">
                        <tbody>
                          <tr>
                            <td><a href="articleFlat.jsp?categoryid=<%=categoryid %>"><img src="images/arrow-left-16x16.gif" alt="返回到主题列表" border="0" height="16" hspace="6" width="16"></a> </td>
                            <td><a href="articleFlat.jsp?categoryid=<%=categoryid %>">返回到主题列表</a> </td>
                          </tr>
                        </tbody>
                      </table></td>
                    <td nowrap="nowrap" width="1%">&nbsp;</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div></td>
        <td width="1%">&nbsp;</td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>
