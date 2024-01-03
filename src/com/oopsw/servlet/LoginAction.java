package com.oopsw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oopsw.model.BoardDAO;



public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String url="login.html";
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");

		String memberNickname=new BoardDAO().login(id,pw);
		if(memberNickname !=null){
			HttpSession session=request.getSession(true);
			session.setAttribute("loginOK", id);
			session.setAttribute("memberNickname", memberNickname);
			url="boards.jsp";
		}
		return url;
	}
}
