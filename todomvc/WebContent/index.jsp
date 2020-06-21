<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="theLocale"
value="${not empty param.theLocale? param.theLocale : pagecontext.request.locale}"
scope="session"
/>
<fmt:setLocale value="${theLocale}"/>
<fmt:setBundle basename="i18n.resource.mylabels"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<form action="MainController" method="get">
	<input type="submit" name="manager" value="showmethelist"/>
	<br/><br/>
</form>
<form action="MainController" method="post">
	<h1><fmt:message key="label.index_greeting"/></h1>
	<h3>id</h3>
	<input type="text" name="id"/><br/>
	<h3>pw</h3>
	<input type="text" name="pw"/><br/><br/>
	<input type="submit" name="util" value="SignIn"/><br/><br/>
</form>
<a href="signup.jsp"><fmt:message key="label.index_newmember"/></a>
</body>
</html>