package com.oopsw.servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.oopsw.model.BoardDAO;
import com.oopsw.model.BoardVO;

public class getPostAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		String url="boards.jsp";
		
		int pageNumber = 1;
		int pageSize = 10;

		String pageNumberParam=request.getParameter("pageNumber");
		if(pageNumberParam!=null && !pageNumberParam.isEmpty())
			pageNumber=Integer.parseInt(pageNumberParam);
		
		BoardDAO dao = new BoardDAO();

		Collection<BoardVO> posts = dao.getPosts(pageNumber, pageSize);
		
		request.setAttribute("pageNumber", pageNumber);
		request.setAttribute("postList", posts);
		return url;
	}

}
