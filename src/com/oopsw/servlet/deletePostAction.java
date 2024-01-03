package com.oopsw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oopsw.model.BoardDAO;

public class deletePostAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String url="postUpdate.jsp";
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		
		HttpSession session=request.getSession();
		String memberID=(String)session.getAttribute("loginOK");
		
		if(postCode!=0){
		BoardDAO dao=new BoardDAO();
		dao.removePost(postCode, memberID);
		url= "boards.jsp";
		}
		
		return url;
	}

}
