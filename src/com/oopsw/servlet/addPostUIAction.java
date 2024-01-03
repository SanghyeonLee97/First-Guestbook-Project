package com.oopsw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

public class addPostUIAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		
		return "addPost.jsp";
	}

}
