<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<h1>Todo list</h1>
<form action="MainController" method="get">
	<input type="text" name="newitem"/>
	<input type="submit" name="additem" value="additem"/>
</form>
<ol>
	<c:forEach var="eachitem" items="${todo_list}">
		<li>${eachitem}</li>
	</c:forEach>
</ol>
<form action="MainController" method="get">
	<input type="submit" name="logout" value="Logout"/>
</form>
</body>
</html>