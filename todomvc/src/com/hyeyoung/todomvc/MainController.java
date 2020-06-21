package com.hyeyoung.todomvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("manager") != null) {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<ol>");
			out.println("list!!<br/>");
			List<User> userlist = UserDataUtil.getmanagelist();
			for(User user: userlist) {
				out.println("<li> firstname : " + user.getFirstName() + ", id : " + user.getId() + ", pw : " + user.getPw() + "</li>");				
			}
		}
		
		if(request.getParameter("additem") != null) {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("existuser");
			String newitem = request.getParameter("newitem");
			user.addNewItem(newitem);
			request.setAttribute("todo_list", user.getTodolist());
			RequestDispatcher dispatcher = request.getRequestDispatcher("todo.jsp");
			dispatcher.forward(request, response);			
		}
		
		if(request.getParameter("logout") != null) {
			HttpSession session = request.getSession();
			session.removeAttribute("existuser");
			response.sendRedirect("index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		/*out.println("<html><body>");*/
		Map <String, User> userlist = UserDataUtil.getUserlist();
		List <User> managelist = UserDataUtil.getmanagelist();
		String utilname = request.getParameter("util");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("existuser");
		
		if(user != null) {
			request.setAttribute("todo_list", user.getTodolist());
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("todo.jsp");
			dispatcher.forward(request, response);
		}
		
		if(utilname.equals("SignIn")) {
			String userid = request.getParameter("id");
			if(userlist.containsKey(userid)) {
				user = userlist.get(userid);
				if(user.getPw().equals(request.getParameter("pw"))) {
					request.getSession().setAttribute("existuser", user);
				}else{//wrong pw
					out.println("<script>alert('Wrong Password');</script>");
					RequestDispatcher dispatcher = 
							request.getRequestDispatcher("index.jsp");
					dispatcher.forward(request, response);
				}
			}else {//not a member

				out.println("<script>");
				out.println("alert('You are not a member! Sign up');");
				out.println("</script>");
				RequestDispatcher dispatcher = 
						request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			}
		}
		
		if(utilname.equals("SignUp")) {
			user = new User(request.getParameter("firstname"),
					request.getParameter("lastname"),
					request.getParameter("id"),
					request.getParameter("pw"),
					new ArrayList<String>());
			userlist.put(request.getParameter("id"), user);
			managelist.add(user);
			request.getSession().setAttribute("existuser", user);
		}
		//out.println("</html></body>");		
		
		request.setAttribute("todo_list", user.getTodolist());
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("todo.jsp");
		dispatcher.forward(request, response);

	}
}
