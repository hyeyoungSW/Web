package com.hyeyoung.todomvc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

public class UserDataUtil {
	private static List<User> userlist = new ArrayList<User>();
	
	public static List<User> getUserlist() {
		return userlist;
	}
	
	public void addUser(String firstname, String lastname, String id, String pw, HttpSession sessionid) {
		User newuser = new User(firstname, lastname, id, pw, sessionid);
		userlist.add(newuser);
	}

}
