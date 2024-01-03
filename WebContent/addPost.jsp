<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String memberNickname = (String)session.getAttribute("memberNickname");	
    if(memberNickname == null || memberNickname.isEmpty()) {
        response.sendRedirect("login.html");
        return;
    }
    String userID=null;
	if(session.getAttribute("loginOK")!=null)
		userID=(String)session.getAttribute("loginOK");
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
	background-color: #fff; border-radius : 8px;
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

.button-up {
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
.button-up:hover {
	background-color: #4e7dff; 
    color: #fff; 
}

.select-field {
    width: 15vw;
    margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 10px;
    font-size: 20px;
}
.input-field {
    width: 25vw;
    margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 10px;
    font-size: 16px;
}
.textarea-field {
    width: 60vw;
    height: 40vh;
    margin-bottom: 20px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 10px;
    font-size: 16px;
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
	<td style="width:130px; text-align_: right;"><button class="button-up" onclick="logOut()">로그아웃</button></td>
	</tr>
	</table>
	<div class="div-container"><br/>
	
	<form action="controller?cmd=addPostAction" method="post">
    <select class="select-field" name="postTitle">
        <option value="자유게시판" style="font-size: 16px">자유게시판</option>
    </select> <br/>
    <input type="text" placeholder="제목 입력" class="input-field" name="title"><br/><br/>
    <textarea placeholder="내용 입력"  class="textarea-field" name="writing"></textarea>
    <br/>
    <button type="submit" class="button-up">등록</button>
</form>

</div>
</body>
</html>