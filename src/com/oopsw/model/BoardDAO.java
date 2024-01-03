package com.oopsw.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.jasper.tagplugins.jstl.core.ForEach;

public class BoardDAO {
	private Connection conn;
	
	public BoardDAO(){
		try{
			Context context = new InitialContext();
			DataSource dataSource =
					(DataSource) context.lookup("java:comp/env/jdbc/myoracle");
			conn = dataSource.getConnection();
		}catch (Exception e){
			e.printStackTrace();
		}

	}

	//업무별 SQL

	//로그인
	public String login(String memberID, String pw) {
		String result=null;
		String sql="select member_nickname from members where member_id=? and pw=?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberID);
			pstmt.setString(2, pw);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getString(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}


	//회원정보 입력
	public  boolean addMember(MemberVO vo){
		boolean result=false;
		String sql="insert into members(member_id, pw, member_Nickname, name, birthdate, mobile_number, eMail, agreement)"
				+ "values(?, ?, ?, ?, ?, ?, ?, ?)";
		try{
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMemberID());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getMemberNickname());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getBirthdate());
			pstmt.setString(6, vo.getMobileNumber());
			pstmt.setString(7, vo.getEmail());
			pstmt.setInt(8, vo.getAgreement());
			if(pstmt.executeUpdate()>0)
				result=true;
			pstmt.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}


	//게시글 목록 10개씩 확인
	public Collection<BoardVO> getPosts(int pageNumber, int pageSize){
		Collection<BoardVO> list=new ArrayList<>();
		String sql="select post_code, post_title, title, member_nickname, upload_date, thumbsup from ("
				+ "select post_code, post_title, title, member_nickname, upload_date, thumbsup, row_number() over (order by post_code desc) as row_num "
				+ "from boards b, members m "
				+ "where m.member_id=b.member_id)"
				+ "where row_num > (?-1)*? and row_num<=?*?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pageNumber);
			pstmt.setInt(2, pageSize);
			pstmt.setInt(3, pageNumber);
			pstmt.setInt(4, pageSize);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				BoardVO vo=new BoardVO();
				vo.setPostCode(rs.getInt(1));
				vo.setPostTitle(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setMemberNickname(rs.getString(4));
				vo.setUploadDate(rs.getString(5));
				vo.setThumbsUp(rs.getInt(6));
				list.add(vo);
				
				
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}


	//게시글 전체 갯수
	public int getPostNumbers(){
		int result=0;
		String sql="select count(*) from boards";
		try {
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()){
				result=rs.getInt(1);
			}
			rs.close();
			stmt.close();
			conn.close();
		}
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}


	//상세보기
	public BoardVO getPost(int postCode) {
		BoardVO vo=null;
		String sql="select post_code, post_title, title, writing, member_nickname, upload_date, thumbsup from boards b, members m "
				+ "where m.member_id=b.member_id and post_code=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postCode);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
				vo=new BoardVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

		return vo;
	}


	//게시글 등록
	public boolean addPost(String postTitle, String title, String writing, String memberID){
		boolean result=false;
		String sql="insert into boards(post_code, post_title, title, writing, upload_date, thumbsup, member_id) "
				+ "values(boards_seq.nextval, ?, ?, ?, sysdate, 0, ?)";
		try{
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, postTitle);
			pstmt.setString(2, title);
			pstmt.setString(3, writing);
			pstmt.setString(4, memberID);
			if(pstmt.executeUpdate()>0)
				result=true;
			pstmt.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}


	//게시글 수정
	public boolean updatePost(String postTitle, String title, String writing, int postCode, String memberID){
		boolean result=false;
		String sql="update boards set post_title=?, title=?, writing=? where post_code=? and member_id=?";
		try{
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, postTitle);
			pstmt.setString(2, title);
			pstmt.setString(3, writing);
			pstmt.setInt(4, postCode);
			pstmt.setString(5, memberID);
			if(pstmt.executeUpdate()>0)
				result=true;
			pstmt.close();
			conn.close();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}


	//게시글 삭제
	public boolean removePost(int postCode, String memberID){
		boolean result=false;
		String sql="delete from boards where post_code=? and member_id=?";
		try{
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, postCode);
			pstmt.setString(2, memberID);
			if(pstmt.executeUpdate()>0)
				result=true;			
			pstmt.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}
	
	//구단정보 가져오기
	public TeamsVO getTeamInfo(String teamName){
		TeamsVO vo=null;
		String sql="select team_name, team_logo, found_year, hometown, ground, team_nickname, "
				+ "epl_wins, facup_wins, leaguecup_wins, champs_wins, europa_wins "
				+ "from TEAMS "
				+ "where team_name=?";
		try{
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, teamName);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
				vo=new TeamsVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getInt(11));
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return vo;
	}
	
	//아이디 중복체크
	public boolean idCheck(String memberID) {
		boolean result=false;
		
		String sql="select * from members where member_id=?";
		try{
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberID);
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()){
				result=true;
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch (SQLException e){
			e.printStackTrace();
		}
		return result;
	}
	
	//닉네임 중복체크
		public boolean nicknameCheck(String memberNickname) {
			boolean result=false;
			
			String sql="select * from members where member_nickname=?";
			try{
				PreparedStatement pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, memberNickname);
				ResultSet rs=pstmt.executeQuery();
				
				if(rs.next()){
					result=true;
				}
				rs.close();
				pstmt.close();
				conn.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
			return result;
		}
}