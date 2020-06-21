<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="theLocale"
value="${not empty param.theLocale? param.theLocale : pagecontext.request.locale }"
scope="session"
/>
<fmt:setLocale value="${theLocale}"/>
<fmt:setBundle basename="i18n.resource.mylabels"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signup</title>
</head>
<body>
	<form action="MainController" method="post">
		<fmt:message key="label.signin_firstname"/>
		<input type="text" name="firstname"/><br/><br/>
		<fmt:message key="label.signin_lastname" />
		<input type="text" name="lastname"/><br/><br/><hr><br/>
		id<br/>
		<input type="text" name="id"/><br/>
		pw<br/>
		<input type="text" name="pw"/><br/><br/>
		<input type="submit" name="util" value="SignUp"/>
	</form>
</body>
</html>