<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Student Tracker App</title>
	
	<link type="text/css" rel="stylesheet" href="css/style.css">
 </head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>FooBar University</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
			<table>
				<tr>
					<th>FirstName</th>
					<th>LastName</th>
					<th>Email</th>
				</tr>
				<c:forEach var="tempStudent" items="${STUDENTS_LIST}">
					<tr>
						<td> ${tempStudent.firstName} </td>
						<td> ${tempStudent.lastName} </td>
						<td> ${tempStudent.email} </td>						
					</tr>
				</c:forEach>
				
			</table>
		</div>
	</div>
</body>
</html>