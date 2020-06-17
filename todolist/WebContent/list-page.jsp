<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
/*To do list which can memorize the user's name and identify by the session*/
/*Use multiple languages. Default language is based on the user's language setting.*/
%>

<c:set var="theLocale"
value="${not empty param.theLocale ? param.theLocale : session.request.locale}"
scope = "session"/>

<fmt:setLocale value="${theLocale}"/>
<fmt:setBundle basename="i18n.resource.mylabels"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my list</title>
</head>
<body>
<a href="list-page.jsp?theLocale=en_US"><fmt:message key="label.language_English"/></a>
<a href="list-page.jsp?theLocale=ko_KR"><fmt:message key="label.language_Korean"/></a>
<hr>
<header>
<h1><fmt:message key="label.firstgreeting"/></h1>
<h1><%=session.getAttribute("firstname")%><fmt:message key="label.title"/></h1>
<br/><br/>
</header>

<form action = "list-page.jsp">
<input type="text" name="newitem">
<input type="Submit" name="submit">
</form>
<%
	List<String> items = (List<String>) session.getAttribute("itemlist");
	if(items==null){
		items = new ArrayList<String>();
		session.setAttribute("itemlist", items);	
	}
	
	String item = request.getParameter("newitem");
	if(item != null){
		boolean isItemDuplicated = items.contains(item.trim());
		if(item.trim().length() > 0 && !isItemDuplicated){
			items.add(item);	
		}
	}
%>

<ol>
<%
for(String tmpitem : items){
	out.println("<li>" + tmpitem + "</li>");
}
%>
</ol>
<hr>
<footer>
last updated : <%=new java.util.Date()%> <br/>
selected locale : ${theLocale}
</footer>
</body>
</html>