<%@ page import="java.util.*" %>

<html>
<body>
<!-- Step 1 : Create HTML form -->
<form action="todo-demo.jsp">
	Add new item : <input type="text" name="theItem"/>
	<input type="submit" value="Submit" name = "Submit"/>
	<input type = "submit" value="Logout" name = "Logout"/>
</form>
<br>

<!-- Step 2 : Add new item to "To Do" List -->
<%
	if(request.getParameter("Logout") != null){
	session.removeAttribute("myToDoList");
	}

	//get the To DO items from the session
	List<String> items = (List<String>) session.getAttribute("myToDoList");
	//if the To DO items doesn't exist, then create a new one
	if(items==null){
		items = new ArrayList<String>();
		session.setAttribute("myToDoList", items);
	}
	//see if there is form data to add
	String theItem = request.getParameter("theItem");
	
	boolean isItemNotEmpty = (theItem != null && theItem.trim().length() > 0);
	boolean isItemNotDuplicated = (theItem != null && !items.contains(theItem.trim()));
	if(isItemNotEmpty && isItemNotDuplicated){
		items.add(theItem);
		response.sendRedirect("todo-demo.jsp");
	}
	
%>

<!-- Step3 : Display all "To Do" Item from session -->
<hr>
<b>To List Items : </b> <br/>
<ol>
<%
	for(String temp : items){
		out.println("<li>" + temp + "</li>");
	}
%>
</ol>
</body>
</html>