<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EnterPage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
	body {
		display:flex;
		justify-content: center;
		align-items:center;
		margin:0;
		padding: 0;
		background-color: white;
		width: 1440px;
		height: 754px;
		font-family: 'Pretendard', sans-serif;
		
		/*불 이미지 삽입*/
/* 		background-image: url('/images/fire.png');
		background-position: left top;
		background-repeat: no-repeat;
		background-size: 45%; */
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
		z-index: -1;
	}
	.enter-container{
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		height: 100%;
	}
	.sub-title{
		color:black;
		font-size: 20px;
		font-weight: 400;
		margin-top: 120px;
	}
	.title{
		color:red;
		font-size: 70px;
		font-weight: 800;
	}
	.button-start{
		font-size:22px;
		font-weight: 700;
		width: 220px;
		height: 70px;
		background-color: #FFD600;
		border-radius: 50px;
		margin-top: 150px;
		border-color: transparent;
	}
</style>
</head>
<body>
<div class="background-image"></div>
<div class="enter-container">
	<div class="sub-title">MBTI P들을 위한 일정관리 서비스</div>
	<div class="title">🔥불타는 주말🔥</div>
	<button type="button" onclick="location.href='/task/list'" class="btn btn-warning shadow-sm button-start">시작하기</button>
</div>
</body>
</html>