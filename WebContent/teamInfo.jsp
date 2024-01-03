<%@page import="com.oopsw.model.BoardDAO"%>
<%@page import="com.oopsw.model.TeamsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%
    String memberNickname = (String)session.getAttribute("memberNickname");	
       if(memberNickname == null || memberNickname.isEmpty()) {
           response.sendRedirect("login.html");
           return;
       }
    %>
    <% 
        String teamName = request.getParameter("teamName");
        TeamsVO info = new BoardDAO().getTeamInfo(teamName);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 20px;
}

.board-container {
display: flex;
    justify-content: center;
    align-items: center;
	background-color: #fff; border-radius : 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: left;
	width: calc(100vw -40px);
	height: 100vh;
	flex-direction: column;
	border-radius: 8px;
	padding: 0 30px;
}

.main-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.sub-title {
	text-align: left; font-size : 20px;
	margin-bottom: 20px;
	font-size: 20px;
}

.board-menu {
	text-align: left;
	margin-bottom: 20px;
	width: 100%;
	display: flex;
	justify-content: flex-start;
}

.board-menu a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	margin-right: 20px;
}


.actions {
	display: grid;
	justify-content: end;
	margin-bottom: 20px;
}


.button-up {
	padding: 6px 12px;
    border: 2px solid #4e7dff; 
    border-radius: 16px;
    background-color: #fff; 
    color: #4e7dff; 
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;
    text-decoration: none;
}
.button-up:hover {
	background-color: #4e7dff; 
    color: #fff; 
}


.dropdown {
font-weight: bold;
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  padding: 12px 16px;
  z-index: 1;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.team-logo {
    width: 293px; 
    height: 400px; 
  }
  
.leftmenu{
height: 100%;
width: 40%;
display: flex;
justify-content: center;
align-items: center;
display:flex;
}

.rightmenu{
width: 60%;
justify-content: center;
float: center;
display:inline-block;
}

.datatable{

margin: 0 auto;
    width: 80%;
    border-collapse: collapse; 
    padding: 20px;

}

.maincontainer{
display: flex;
    justify-content: center;
    align-items: center;
height: 100%;
width: 90%;
margin: 30px;
}
.data-table {
 
    width: 100%;
    padding: 20px;
    border: 2px solid #6EB5FF;
    border-radius: 10px;
    border-spacing: 0;
    background-color: #fff;
}

.data-table td, 
.data-table th {
    border-collapse: separate;
    border: 1px solid #999999;
    text-align: left;
    padding: 8px;
}
</style>
<script type="text/javascript">
	function logOut(){
		window.location.href= "controller?cmd=logoutAction";
	}

</script>
</head>
<body>
	<table style="width:100%;">
	<tr>
	<td style="text-align: right;"><%=memberNickname %>님 환영합니다.</td>
	<td style="width:130px; text-align: right;"><button class="button-up" onclick="logOut()">로그아웃</button></td>
	</tr>
	</table>
    <div class="board-container">
        <h1 class="main-title">축구인들의 모임</h1>

        <div class="board-menu">
            <a href="controller?cmd=getPostAction&pageNumber=1">자유게시판</a>
            <span class="dropdown">구단 정보
            <span class="dropdown-content">
            <a href="controller?cmd=viewTeamsUIAction">EPL</a></span>
            </span>
        </div>
	<div class="maincontainer">
	<div class="leftmenu" ><img src=<%= info.getTeamLogo() %> alt="Tottenham" class="team-logo"></div>
	<div class="rightmenu">
	<div class="datatable">
	<table class="data-table">
	<tr ><td colspan="2" style="text-align: center; font-weight: bold; font-size: 22px;"><%= info.getTeamName()%></td></tr>
	<tr><td>창단연도</td><td><%= info.getFoundYear() %>년</td></tr>
	<tr><td>연고지</td><td><%= info.getHometown() %></td></tr>
	<tr><td>홈구장</td><td><%= info.getGround() %></td></tr>
	<tr><td>닉네임</td><td><%= info.getTeamNickname() %></td></tr>
	<tr><td>EPL 우승</td><td><%= info.getEplWins() %>회</td></tr>
	<tr><td>FA컵 우승</td><td><%= info.getFacupWins() %>회</td></tr>
	<tr><td>리그컵 우승</td><td><%= info.getLeaguecupWins() %>회</td></tr>
	<tr><td>챔피언스리그 우승</td><td><%= info.getChampsWins() %>회</td></tr>
	<tr><td>유로파리그 우승</td><td><%= info.getEuropaWins() %>회</td></tr>
	</table>
	
	</div>
	</div>
	
	</div>


    </div>
</body>
</html>