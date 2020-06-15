<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%
//just crate some sample data ... normally provided by MVC
	String[] cities = {"Mumbai", "Singapore", "LA"};
	pageContext.setAttribute("myCities", cities);
%>

<html>
<body>
	<c:forEach var = "tempCity" items = "${myCities}">
	${tempCity} <br/>

	</c:forEach>
</body>
</html>