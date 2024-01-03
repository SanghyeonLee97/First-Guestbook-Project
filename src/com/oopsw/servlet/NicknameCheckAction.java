package com.oopsw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.oopsw.model.BoardDAO;

public class NicknameCheckAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
String memberNickname=request.getParameter("memberNickname");
		
		boolean nicknameCheck=new BoardDAO().nicknameCheck(memberNickname);
		if(nicknameCheck==true){
			request.setAttribute("message", "중복 닉네임 입니다.");
		}
		else{
			request.setAttribute("message", "사용 가능한 닉네임 입니다.");
		}
		
		return "signup_check.jsp";
	}

}