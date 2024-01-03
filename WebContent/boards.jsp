<%@page import="java.util.ArrayList"%>
<%@page import="com.oopsw.model.BoardDAO"%>
<%@page import="java.util.Collection"%>
<%@page import="com.oopsw.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String memberNickname = (String)session.getAttribute("memberNickname");	
    if(memberNickname == null || memberNickname.isEmpty()) {
        response.sendRedirect("login.html");
        return;
    }
    int pageNumber = 1;
    String pageNumberParam = request.getParameter("pageNumber");
    if (pageNumberParam != null && !pageNumberParam.isEmpty()) {
        pageNumber = Integer.parseInt(pageNumberParam);
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
	min-width: 900px;
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

.post-list {
	text-align: left;
	margin-bottom: 20px;
	width: 100%;
	max-height: calc(100vh - 200px);
	overflow-y: hidden;
}

.post-item {
	padding: 5px;
	border-bottom: 1px solid #ccc;
	transition: background-color 0.3s ease;
	display: flex;
    justify-content: flex-start;
	align-items: center;
}

.post-item:hover {
	background-color: #f9f9f9;
}

.post-item a {
	text-decoration: none;
	color: #333;
	font-weight: bold;
}

.post-type{
text-align:left;
width: 4%;
}

.post-title{
font-weight:bold;
width:85%;
}

.post-meta {
	color: #666;
	font-size: 14px;
	display: flex;
    justify-content: space-between;
    align-items:center;
    width:15%;
}
.nickname, .date, .likes  {
    margin-left: 5px;
    text-align:center;
    width:45%;
}
.likes{
width:10%;
}
.nickname{
width:50%;
}


.actions {
	display: grid;
	justify-content: end;
	margin-bottom: 20px;
}

.pagination {
	width:95%;
	text-align: center;
}

.pagination ul {
	list-style: none;
	padding: 0;
	display: inline-flex;
}

.pagination li {
	margin: 0 5px;
	cursor: pointer;
	background-color: #4e7dff;
	color: #fff;
	padding: 8px 16px;
	border-radius: 16px;
	transition: all 0.3s ease;
}

.pagination li a.active {
	font-size: 18px;
	font-style: italic;
	font-weight: bold;
    color: #fff; 
    }
    
.pagination li a {
    text-decoration: none;
    color: inherit;
}
.pagination li:hover {
	background-color: #4e7dff;
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
  margin-right: 20px;
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

</style>
<script>
	function logOut(){
		window.location.href= "controller?cmd=logoutAction";
	}
	function addPost(){
		window.location.href= "controller?cmd=addPostUIAction";
	}
	window.onload = function() {
        var pageNumber = <%= pageNumber %>;
        var totalPosts = <%= new BoardDAO().getPostNumbers() %>;
        var totalPages = Math.ceil(totalPosts / 10);

        var previousPageLink = document.querySelector('.pagination li:first-child a');
        if (pageNumber === 1) {
        	previousPageLink.style.pointerEvents = 'none';
        }

        var nextPageLink = document.querySelector('.pagination li:last-child a');
        if (pageNumber === totalPages) {
            nextPageLink.style.pointerEvents = 'none';
        }
    };
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
            <a href="pdf/project.pdf">포트폴리오</a>
            
        </div>

<div class="post-list">

<% 

Collection<BoardVO> postList = (Collection<BoardVO>)request.getAttribute("postList");
if (postList == null) {
    int pageSize = 10;
    postList = new BoardDAO().getPosts(pageNumber, pageSize);
}
for (BoardVO post : postList) {     
	//System.out.println(post);
%>
		<div class="post-item">
			<span class="post-type"><%= post.getPostTitle().substring(0, 2)%></span>
			<span class="post-title"><a href="controller?cmd=viewPostAction&postCode=<%= post.getPostCode() %>"><%= post.getTitle() %></a></span>
			<div class="post-meta">
				<span class="nickname"><%= post.getMemberNickname() %></span>
				<span class="date"><%= post.getUploadDate() %></span>
				
			</div>
		</div>
		<% } %>

        </div>

		<div class="actions">
			<button class="button-up" onclick="addPost()">글 작성</button>
		</div>

		<div class="pagination">
			<ul>
				<li><a href="controller?cmd=getPostAction&pageNumber=<%=pageNumber - 1%>">이전</a></li>
				<%
					int totalPosts = new BoardDAO().getPostNumbers();
					int totalPages = (int) Math.ceil((double) totalPosts / 10);
					int maxPagesToShow = 5;
					
					int startPage = Math.max(1, pageNumber - maxPagesToShow / 2);
					int endPage = Math.min(totalPages, startPage + maxPagesToShow - 1);
					
					
					 if (startPage > 1) { %>
		                <li><a href="controller?cmd=getPostAction&pageNumber=1">1</a></li>
		                <% if (startPage > 2) { %>
		                    <li>...</li>
		                <% }
		            }

		            for (int i = startPage; i <= endPage; i++) { %>
		                <li><a href="controller?cmd=getPostAction&pageNumber=<%=i%>" <% if (i == pageNumber) { %>class="active"<% } %>><%=i%></a></li>
		            <% }

		            if (endPage < totalPages) { %>
		                <% if (endPage < totalPages - 1) { %>
		                    <li>...</li>
		                <% } %>
		                <li><a href="controller?cmd=getPostAction&pageNumber=<%=totalPages%>"><%=totalPages%></a></li>
		            <% } %>
				<li><a href="controller?cmd=getPostAction&pageNumber=<%=pageNumber + 1%>">다음</a></li>
			</ul>
		</div>
    </div>
</body>
</html>