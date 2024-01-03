package com.oopsw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.oopsw.model.BoardDAO;
import com.oopsw.model.BoardVO;

public class viewPostAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String url="posts.jsp";
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		
		BoardDAO dao = new BoardDAO();
        BoardVO post = dao.getPost(postCode);
        request.setAttribute("post", post);
        
//        System.out.println(post);
        
        HttpSession session=request.getSession();
        String memberNickname = (String)session.getAttribute("memberNickname");
        if(!memberNickname.equals(post.getMemberNickname())){
        	return "posts.jsp";
        }else{
        	url="postsUpdate.jsp";
        }
		return url;
	}

}
