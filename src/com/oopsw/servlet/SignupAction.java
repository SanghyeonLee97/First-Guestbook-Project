package com.oopsw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.oopsw.model.BoardDAO;
import com.oopsw.model.MemberVO;

public class SignupAction implements Action {
	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String agreementParam = request.getParameter("agreement");
		int agreement = 0;

		if(agreementParam!=null && !agreementParam.isEmpty()){
			agreement=Integer.parseInt(agreementParam);
			System.out.println(agreement);

			String memberID = request.getParameter("memberID");
			String pw = request.getParameter("pw");
			String memberNickname = request.getParameter("memberNickname");
			String name = request.getParameter("name");
			String birthdate = request.getParameter("birthdate");
			String mobileNumber = request.getParameter("mobileNumber");
			String email = request.getParameter("email");




			if (memberID == null || memberID.isEmpty() || pw == null || pw.isEmpty() ||
					memberNickname == null || memberNickname.isEmpty() || name == null || name.isEmpty()) {
				request.setAttribute("errorMessage", "필수 항목을 입력하세요.");
				return "signup.jsp";
			}


			MemberVO vo=new MemberVO();
			vo.setMemberID(memberID);
			vo.setPw(pw);
			vo.setMemberNickname(memberNickname);
			vo.setName(name);
			vo.setBirthdate(birthdate);
			vo.setMobileNumber(mobileNumber);
			vo.setEmail(email);
			vo.setAgreement(agreement);

			System.out.println(vo);

			BoardDAO dao=new BoardDAO();
			boolean result=dao.addMember(vo);
			if(result){
				return "login.html";
			}else {
				request.setAttribute("errorMessage", "회원가입에 실패하였습니다.");
				return "signup.jsp";
			}

		}else {
			request.setAttribute("errorMessage", "약관에 동의하세요.");
			return "signup.jsp";
		}
	}
}
