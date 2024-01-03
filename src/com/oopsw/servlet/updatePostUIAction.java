package com.oopsw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.oopsw.model.BoardDAO;
import com.oopsw.model.BoardVO;

public class updatePostUIAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String url="updatePosts.jsp";
		int postCode = Integer.parseInt(request.getParameter("postCode"));
		
		BoardDAO dao = new BoardDAO();
        BoardVO post = dao.getPost(postCode);
        request.setAttribute("post", post);
		
		return url;
	}

}
