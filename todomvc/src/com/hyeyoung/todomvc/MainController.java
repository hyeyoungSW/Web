package com.hyeyoung.todomvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
			List<User> userlist = UserDataUtil.getUserlist();
			for(User user : userlist) {
				out.println("<li>"+user+"</li>");
			}
			out.println("</ol>");
			out.println("</html></body>");
		}
		if(request.getParameter("additem") != null) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List <User> userlist = UserDataUtil.getUserlist();
		String utilname = request.getParameter("util");
		/*response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");*/
		
		HttpSession usersession = request.getSession();//temp init
		if(utilname.equals("SignIn")) {
			/*
			for(User user : userlist) {
			}*/
		}else if(utilname.equals("SignUp")) {
			usersession = request.getSession();
			User newuser = new User(request.getParameter("firstname"),
					request.getParameter("lastname"),
					request.getParameter("id"),
					request.getParameter("pw"),
					request.getSession());
			userlist.add(newuser);
		}
		//out.println("</html></body>");
		request.setAttribute("todolist", usersession.getAttribute("todolist"));
		RequestDispatcher dispatcher = request.getRequestDispatcher("todo.jsp");
		dispatcher.forward(request, response);
	}

}
