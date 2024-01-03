<%@page import="com.oopsw.model.BoardDAO"%>
<%@page import="com.oopsw.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    String memberNickname = (String)session.getAttribute("memberNickname");	
    if(memberNickname == null || memberNickname.isEmpty()) {
        response.sendRedirect("login.html");
        return;
    }
            int postCode = Integer.parseInt(request.getParameter("postCode"));
            BoardVO post = new BoardDAO().getPost(postCode);
            
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

.div-container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: left;
	width: calc(100vw -40px);
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	border-radius: 8px;
	padding: 0 30px;
}

.back-button, .button-up {
	padding: 6px 12px;
	border: 2px solid #4e7dff;
	border-radius: 16px;
	background-color: #fff;
	color: #4e7dff;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	transition: all 0.3s ease;
	text-decoration: none;
}

.back-button:hover, .button-up:hover {
	background-color: #4e7dff;
	color: #fff;
}
.button-up a {
  color: #4e7dff;
  text-decoration: none;
}

.post-container {
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 20px;
}

.post-header {
	border-bottom: 2px solid #ccc;
	padding-bottom: 10px;
	margin-bottom: 20px;
}

.post-header h1 {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

.post-info {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.post-meta {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 4px;
	border: 1px solid #ccc;
}

.post-content {
	font-size: 16px;
	color: #444;
	line-height: 1.6;
	border: 1px solid #ccc;
	padding: 10px;
	border-radius: 4px;
}

.author {
	font-size: 14px;
	color: #666;
	width: 80vw;
}

.timestamp, .likes {
	font-size: 14px;
	color: #666;
	width: 10vw;
	margin-left: auto;
}


</style>
<script type="text/javascript">
function logOut(){
	window.location.href= "controller?cmd=logoutAction";
}

function returnToBoards(){
	window.history.back();
}

function confirmDelete(postCode){
	if(confirm("삭제하시겠습니까?")){
		window.location.href="controller?cmd=deletePostAction&postCode=" + postCode;
	}
}

</script>
</head>
<body>
	<table style="width:100%;">
	<tr>
	<td style="text-align: right;"><%=memberNickname %>님 환영합니다.</td>
	<td style="width:130px; text-align_: right;"><button class="button-up" onclick="logOut()">로그아웃</button></td>
	</tr>
	</table>
	
	<div class="post-container">
		<div class="post-header">
			<h1><%= post.getTitle() %></h1>
		</div>
		<div class="post-meta">
			<span class="author"><%= post.getMemberNickname() %></span>
			<span class="timestamp"><%= post.getUploadDate() %></span>
		</div>
		<div class="post-content">
			<p>
				<%= post.getWriting() %>
			</p>
		</div><br/>
		
		<div style="text-align:center;">
		<button class="button-up" onclick="returnToBoards()">목록으로 가기</button>
		<button class="button-up"><a href="controller?cmd=updatePostUIAction&postCode=<%= post.getPostCode() %>">수정</a></button>
		<button class="button-up" onclick="confirmDelete(<%= post.getPostCode() %>)">삭제</button>
		</div>
	</div>
</body>
</html>