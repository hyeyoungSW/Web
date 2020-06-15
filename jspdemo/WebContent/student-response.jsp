<html>
<body>
<jsp:include page = "my-header.html"/>
The student is confirmed: ${param.firstName} ${param.lastName}
<br/><br/>
The student is from : ${param.country}
<br/><br/>
The student's favorite programming language : ${param.favoritelanguage}
<br/><br/>
<%
String[] checklist = request.getParameterValues("checkboxexample");
for(String option : checklist){
	out.println("<li>" + option + "</li>");
}
%>
<br/>
<jsp:include page = "my-footer.jsp"/>
</body>
</html>