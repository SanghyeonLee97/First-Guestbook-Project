<%@page import="com.oopsw.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.signup-container {
	background-color: #fff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	max-width: 350px;
	width: 100%;
}

.signup-container h2 {
	text-align: left;
	color: #333;
	margin-bottom: 20px;
}

.input-field {
	width: calc(100% - 20px);
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 10px;
	font-size: 16px;
}

.checkbox-label {
	display: block;
	text-align: left;
	margin-bottom: 15px;
}

.signup-button {
	width: calc(100% - 20px);
	padding: 12px;
	border: none;
	border-radius: 10px;
	background-color: #6A24FE;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.signup-button:hover {
	background-color: #4d1a9b;
}

input::placeholder {
	font-size: 15px;
	opacity: 0.6;
}
.modal-button {
	padding: 8px 16px;
    border: 2px solid #4e7dff; 
    border-radius: 16px;
    background-color: #fff; 
    color: #4e7dff; 
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;
}

.modal-button:hover {
	background-color: #4e7dff; 
    color: #fff; 
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 10% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 60%;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}





</style>
    <!-- 자바스크립트 -->
    <script>

        //비밀번호 재확인 체크
        function checkPassword(){
        	var password = document.querySelector("input[name='pw']").value;
            var confirmPw = document.querySelector("input[name='confirmPw']").value;
            var message = document.getElementById("pwMessage");
        	
        	if(password === confirmPw && password !== '' && confirmPw !== ''){
        		message.innerHTML = "<span style='color: green;'>비밀번호가 일치합니다.</span>";
        	}else{
        		message.innerHTML = "<span style='color: red;'>비밀번호가 일치하지 않습니다.</span>";
        	}
        }

        // 모달 보이기
        function showModal() {
            var modal = document.querySelector("#myModal");
            modal.style.display = "block";
        }

        // 모달 닫기
        function closeModal() {
            var modal = document.querySelector("#myModal");
            modal.style.display = "none";
        }

        // 모달 외 다른 곳 클릭 시 모달 닫기
        window.onclick = function(event) {
            var modal = document.querySelector("#myModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        
    </script>
</head>
<body>
    <div class="signup-container">
        <h2>회원가입</h2>
		<form action="controller?cmd=signupAction" method="post">
			<input type="text" class="input-field" placeholder="아이디(필수)" name="memberID" id="memberID">
			<div id="idCheck"></div>
			<input type="password" class="input-field" placeholder="비밀번호(필수)" name="pw" oninput="checkPassword()">
			<input type="password" class="input-field" placeholder="비밀번호 재확인(필수)" name="confirmPw" oninput="checkPassword()">
			<span id="pwMessage" style="font-size: 14px;"></span>
			<input type="text" class="input-field" placeholder="닉네임(필수)" name="memberNickname" id="memberNickname">
			<div id="nicknameCheck"></div>
			<input type="text" class="input-field" placeholder="이름" name="name"> 
			<input type="text" class="input-field" placeholder="생년월일" name="birthdate">
			<input type="text" class="input-field" placeholder="핸드폰 번호" name="mobileNumber">
			<input type="text" class="input-field" placeholder="이메일" name="email">
			<input type="checkbox" value="1" name="agreement">약관에 동의합니다 <input type="button" class="modal-button" onclick="showModal()" value="약관보기">
			<br><br>
			<button type="submit" class="signup-button" >가입하기</button>
		</form>
	</div>
	<%
    String errorMessage = (String)request.getAttribute("errorMessage");
    if(errorMessage != null && !errorMessage.isEmpty()) {
%>
<script>
alert("<%= errorMessage %>");
</script>
    <% } %>
    <!-- 모달 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h3>약관</h3>
            <p>
           		제 1 장 총칙<br><br> 
				제 1조 (목적)<br>
                본 약관은 서비스(이하 "회사"라 한다)는 홈페이지에서 제공하는 서비스(이하 "서비스"라 한다)를 
                제공함에 있어 회사와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.
            </p>
        </div>
    </div>
    <script type="text/javascript">
	$("#memberID").on("change", function(){
		$.ajax({
			url: "controller?cmd=idCheckAction",
			data: {
				id: $(this).val()
			},
			success: function(response){
				$("#idCheck").html(response);
			}
		});
	});
	$("#memberNickname").on("change", function(){
		$.ajax({
			url: "controller?cmd=nicknameCheckAction",
			data: {
				memberNickname: $(this).val()
			},
			success: function(response){
				$("#nicknameCheck").html(response)
			}
		})
	});
	</script>
</body>
</html>