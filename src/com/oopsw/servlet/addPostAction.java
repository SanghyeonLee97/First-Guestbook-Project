package com.oopsw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oopsw.model.BoardDAO;


public class addPostAction implements Action {
	
	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String url="addPost.jsp";
		String postTitle=request.getParameter("postTitle");
		String title=request.getParameter("title");
		String writing=request.getParameter("writing");
		writing=writing.replace("\n", "<br>");
		
		HttpSession session=request.getSession();
		String memberID=(String)session.getAttribute("loginOK");
//		System.out.println("Received postTitle: " + postTitle);
		if(memberID!=null){
			if(title!=null && writing!=null){
				BoardDAO dao=new BoardDAO();
				dao.addPost(postTitle, title, writing, memberID);
				url="boards.jsp";
			}
		}
		return url;
	}

}
