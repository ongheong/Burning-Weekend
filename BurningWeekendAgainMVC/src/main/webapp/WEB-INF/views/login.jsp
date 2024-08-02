<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginPage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
	body {
		display:flex;
		justify-content: center;
		align-items:center;
		margin:0;
		padding: 0;
		background-color: white;
		width: 100%;
		height:100vh;
		font-family: 'Pretendard', sans-serif;
	}
	.background-image{
		position: fixed;
		left:0;
		
		width: 50%;
		height: 100%;
		background-image: url('/images/fire.png');
		background-position: left top;
		background-repeat: no-repeat;
		background-size: cover;
		z-index: 2;
	}
	.login-wrapper{
		position: fixed;
		right:0;
		
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content:center;
		height: 100%;
		width: 50%;
		padding: 100px 0 100px 0;
		background-color: white;
		z-index: 1;
	}
	.title{
		color: black;
		font-size: 50px;
		font-weight: 700;
	}
	.input-container{
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		margin: 40px;
		width: auto;
	}
	.input-form{
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: center;
		width: fit-content;
		margin: 30px 0 30px 0;
		font-size: 20px;
		font-weight: 600;
	}
	.input{
		margin-left: 20px; 
		width: 250px; 
		height: 50px;
		border-radius: 8px;
		border-color: #DDE1EB;
	}
	.submit-btn{
		display: flex;
        justify-content: center;
        align-items: center;
		font-size:17px;
		font-weight: 600;
		width: 125px;
		height: 45px;
		background-color: #FFD600;
		border-radius: 50px;
		border-color: transparent;
		margin-top: 30px;
	}
	.register-a{
		font-size: 15px;
		font-weight: 400;
		text-align: center;
		text-decoration: underline;
	}
</style>
</head>
<body>
	<div class="background-image"></div>
	<div class="login-wrapper shadow-lg">
	<div class="title">로그인</div>
	<form method="post" style="width:100%">
	    <div class="input-container">
	    	<div style="display: flex; flex-direction: column; align-items: flex-end; ">
	    		<div class="input-form">아이디<input type="text" name="id" class="form-control input"></div>
	    		<div class="input-form">비밀번호<input type="password" name="password" class="form-control input"></div>
	    	</div>
		  	<% if (request.getAttribute("error") != null) { %>
				<p style="color: red;"><%= request.getAttribute("error") %></p>
			<% } %>
    	 	<button class="btn btn-warning shadow-sm submit-btn" type="submit">저장</button>
    	 </div>
	</form>
	<div class="register-a"><a href="/user/register">새로 회원가입하기</a></div>
	</div>
</body>
</html>