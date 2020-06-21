package com.hyeyoung.todomvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public class UserDataUtil {
	private static List<User> managelist = new ArrayList<User>();
	private static Map<String, User> userlist = new HashMap<String, User>();
	
	public static Map<String, User> getUserlist() {
		return userlist;
	}
	
	public void addUser(String firstname, String lastname, String id, String pw, List<String> todolist) {
		User newuser = new User(firstname, lastname, id, pw, todolist);
		userlist.put(id, newuser);
		managelist.add(newuser);
	}
	
	public static List<User> getmanagelist() {
		return managelist;
	}

}
