<%@page import="java.util.Collection"%>
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
	background-color: #fff; border-radius : 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	width: calc(100vw -40px);
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
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
    width: 74px; 
    height: 100px; 
  }
.second-table td {
        width: 200px; 
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

        <span style="text-align: left; font-size: 30px;">EPL</span><br/>
        
        <table class="second-table">
        <tr><td><a href="teamInfo.jsp?teamName=리버풀">
        <img src="Logos/liverpool.png" alt="Liverpool" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=아스날">
        <img src="Logos/arsenal.png" alt="Arsenal" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=아스톤빌라">
        <img src="Logos/astonvilla.png" alt="AstonVilla" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=맨체스터 시티">
        <img src="Logos/manchestercity.png" alt="ManchesterCity" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=토트넘 핫스퍼">
        <img src="Logos/tottenham.png" alt="Tottenham" class="team-logo"></a></td>
        </tr>
        <tr>
        <td>리버풀</td>
        <td>아스날</td>
        <td>아스톤 빌라</td>
        <td>맨시티</td>
        <td>토트넘</td>
        </tr>
        <tr><td><a href="teamInfo.jsp?teamName=맨체스터 유나이티드">
        <img src="Logos/manchesterUnited.png" alt="ManchesterUnited" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=뉴캐슬">
        <img src="Logos/newCastle.png" alt="NewCastle" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=브라이턴">
        <img src="Logos/brighton.png" alt="Brighton" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=웨스트햄">
        <img src="Logos/westham.png" alt="Westham" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=풀럼">
        <img src="Logos/fulham.png" alt="Fulham" class="team-logo"></a></td>
        </tr>
        <tr>
        <td>맨유</td>
        <td>뉴캐슬</td>
        <td>브라이턴</td>
        <td>웨스트햄</td>
        <td>풀럼</td>
        </tr>
        <tr><td><a href="teamInfo.jsp?teamName=브렌트포드">
        <img src="Logos/brentford.png" alt="Brentford" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=첼시">
        <img src="Logos/chelsea.png" alt="Chelsea" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=울버햄튼">
        <img src="Logos/wolverhampton.png" alt="Wolverhampton" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=본머스">
        <img src="Logos/bournemouth.png" alt="Bournemouth" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=크리스탈 팰리스">
        <img src="Logos/crystalpalace.png" alt="Crystalpalace" class="team-logo"></a></td>
        </tr>
        <tr>
        <td>브렌트포드</td>
        <td>첼시</td>
        <td>울버햄튼</td>
        <td>본머스</td>
        <td>크리스탈 팰리스</td>
        </tr>
        <tr></tr>
 
        
        <tr><td><a href="teamInfo.jsp?teamName=노팅엄 포레스트">
        <img src="Logos/nottingham.png" alt="Nottingham" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=에버튼">
        <img src="Logos/everton.png" alt="Everton" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=루턴 타운">
        <img src="Logos/lutontown.png" alt="Lutontown" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=번리">
        <img src="Logos/burnley.png" alt="Burnley" class="team-logo"></a></td>
        <td><a href="teamInfo.jsp?teamName=셰필드 유나이티드">
        <img src="Logos/sheffield.png" alt="Sheffield" class="team-logo"></a></td>
        </tr>
        <tr>
        <td>노팅엄</td>
        <td>에버턴</td>
        <td>루턴 타운</td>
        <td>번리</td>
        <td>셰필드</td>
        </tr>
        
        </table>
</div>
</body>
</html>