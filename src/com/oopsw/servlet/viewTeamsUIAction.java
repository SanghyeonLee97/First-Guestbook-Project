package com.oopsw.servlet;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.oopsw.model.BoardDAO;
import com.oopsw.model.TeamsVO;

public class viewTeamsUIAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		
		return "selectTeam.jsp";
	}

}
