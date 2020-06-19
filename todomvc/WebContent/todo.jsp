<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<body>
<h1>Todo list</h1>
<input type="text" name="item"/>
<form action="MainController" method="get">
	<input type="submit" name="additem" value="additem"/>

</form>

<c:forEach var="item" items="%{todolist}">
	<ol>
		<li>${item}</li>
	</ol>
</c:forEach>
<a href="index.jsp">go back to main page...</a>
</body>
</html>