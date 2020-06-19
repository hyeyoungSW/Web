<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<body>
<h1>Todo list</h1>

<c:forEach var="item" items="%{todolist}">
	<ol>
		<li>${item}</li>
	</ol>
</c:forEach>
<a href="index.jsp">go to main..</a>
</body>
</html>