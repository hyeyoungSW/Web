<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="theLocale" 
value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale}"
scope = "session"
/>
<fmt:setLocale value="${theLocale}"/>
<fmt:setBundle basename="i18n.resource.mylabels"/>

<html>
<body>
<header>
<a href="login-page.jsp?theLocale=en_US"><fmt:message key="label.language_English"/></a>
<a href="login-page.jsp?theLocale=ko_KR"><fmt:message key="label.language_Korean"/></a>
</header>
<%
	if(request.getParameter("LogOut") != null){
		session.removeAttribute("lastname");
		session.removeAttribute("firstname");
		session.removeAttribute("itemlist");
		request.setAttribute("LogOut", null);
		
	}
	if(request.getParameter("SignUp") != null){
		 String firstname = request.getParameter("firstname");
		 String lastname = request.getParameter("lastname");
		 
		 if(firstname!=null && lastname!=null){
			 session.setAttribute("firstname", firstname);
			 session.setAttribute("lastname", lastname);
		 }
	}
%>
<c:if test="${not empty lastname}">
	<h1><%=session.getAttribute("firstname")%><fmt:message key="label.greeting"/></h1>
	<a href="list-page.jsp"><fmt:message key="label.continue"/></a>
	<form action="login-page.jsp">
		<input type="Submit" name="LogOut" value="LogOut"/>
	</form>
</c:if>
<c:if test="${empty lastname}">
	<form action="login-page.jsp">
	<h1><fmt:message key="label.firstgreeting"/></h1><br/><br/>
	<fmt:message key="label.firstName"/>
	<input type="text" name="firstname"/><br/>
	<fmt:message key="label.lastName"/>
	<input type="text" name="lastname"/>
	<input type="Submit" name="SignUp" value="SignUp"/>

	</form>
</c:if>


<footer>
<jsp:include page = "footer.jsp"/>
your locale : ${theLocale}
</footer>
</body>
</html>