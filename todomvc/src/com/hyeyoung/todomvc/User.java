package com.hyeyoung.todomvc;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

public class User {
	private String firstName;
	private String lastName;
	private String id;
	private String pw;
	private HttpSession sessionid;
	private List <String> todolist;
	
	public User(String firstName, String lastName, String id, String pw, HttpSession sessionid) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.id = id;
		this.pw = pw;
		this.sessionid = sessionid;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public HttpSession getSessionid() {
		return sessionid;
	}

	public void setSessionid(HttpSession sessionid) {
		this.sessionid = sessionid;
	}

	public List<String> getTodolist() {
		return todolist;
	}

	public void setTodolist(List<String> todolist) {
		this.todolist = todolist;
	}	
	
}
