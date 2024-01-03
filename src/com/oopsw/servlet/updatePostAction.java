package com.oopsw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oopsw.model.BoardDAO;

public class updatePostAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String url="updatePosts.jsp";
		String postTitle=request.getParameter("postTitle");
		String title=request.getParameter("title");
		String writing=request.getParameter("writing");
		writing=writing.replace("\n", "<br>");
		
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		
		HttpSession session=request.getSession();
		String memberID=(String)session.getAttribute("loginOK");
		
		if(memberID!=null){
			if(title!=null && writing!=null){
		BoardDAO dao=new BoardDAO();
		dao.updatePost(postTitle, title, writing, postCode, memberID);
		url="boards.jsp";
			}
		}
		return url;
	}

}
