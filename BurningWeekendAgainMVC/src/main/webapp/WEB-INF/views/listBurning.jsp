<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 할 일 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"> 
  <style type="text/css">
  	body {
		display:flex;
		flex-direction: column;
		justify-content: center;
		align-items:center;
		margin:0;
		padding: 0;
		background-color: white;
		font-family: 'Pretendard', sans-serif;
	}
    .date-display{
    	color: red;
    	font-size: 45px;
    	font-weight: 700;
    	margin-top: 7vh;
    }
    .list-wrapper{
      background-color:white;
      width: 75vw;
      height: 78vh;
      position: fixed;
      bottom:0;
      margin-top: 2vh;
      border-radius: 20px 20px 0 0;
      padding: 20px;
      
      display: flex;
      flex-direction: column;
      align-items: center;
      overflow: scroll;
    }
	.list-title{
		    color: black;
    font-size: 27px;
    font-weight: 600;
    margin-top: 3vh;
    margin-bottom: 5vh;
	}
	.list-container{
	display: flex;
    flex-direction: column;
    width: -webkit-fill-available;
    align-items: flex-start;
    margin-left: 30px;
    margin-right: 30px;
    gap: 30px;
	}
	.list-row{
	display: flex;
    flex-direction: row;
    gap: 30px;
    align-items: center;
	}
	.checkbox-btn {
	    background-color: white;
	    color: black;
	    border: 2px solid #dde1eb;
	    border-radius: 20px;
	    padding: 10px;
	    text-align: center;
	    display: inline-block;
	    width: 40px;
	    height: 40px;
	}
	.checkbox-button.checked {
	    background-color: #4CAF50; /* 체크되었을 때의 배경색 */
	    color: white; /* 체크되었을 때의 텍스트 색상 */
	}
	.list-row-title{
	    background-color: white;
    color: black;
    border: 2px solid #dde1eb;
    border-radius: 8px;
    padding-left: 20px;
    text-align: center;
    width: 750px;
    /* display: inline-block; */
    height: 56px;
    padding-right: 20px;
    font-size: 20px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
	}
	.content-btn{
	    background-color: white;
    color: black;
    border: 2px solid #dde1eb;
    border-radius: 8px;
    /* padding-left: 20px; */
    text-align: center;
    width: 50px;
    /* display: inline-block; */
    height: 50px;
    /* padding-right: 20px; */
    font-size: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 30px;
	}
	.delete-btn{
	    background-color: white;
    color: black;
    border: 2px solid #dde1eb;
    border-radius: 8px;
    /* padding-left: 20px; */
    text-align: center;
    width: 50px;
    /* display: inline-block; */
    height: 50px;
    /* padding-right: 20px; */
    font-size: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 30px;
	}
	.enter-btn{
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 30px;
    font-weight: 400;
    width: 70px;
    height: 70px;
    background-color: transparent;
    border-color: transparent;
    
    z-index: 2;
    position: fixed;
/*     top: 22px;
    right: 450px; */
    top: 0px;
    right: 50px;
    border-style: none;
	}
	.done-btn{display: flex;
    justify-content: center;
    align-items: center;
    font-size: 30px;
    font-weight: 400;
    width: 70px;
    height: 70px;
    background-color: transparent;
    border-color: transparent;
    
    z-index: 2;
    position: fixed;
    top: 0px;
    right: 0px;
    border-style: none;
    }
	.btn-container{
	    display: flex;
    flex-direction: row;
    gap: 10px;
    align-items: center;
	}
	.finish-btn{
	    background-color: white;
    color: black;
    border: 2px solid #dde1eb;
    border-radius: 8px;
    /* padding-left: 20px; */
    text-align: center;
    width: 50px;
    /* display: inline-block; */
    height: 50px;
    /* padding-right: 20px; */
    font-size: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 30px;
	}
	.background-image1{
		position: fixed;
		left:0;
		bottom:0;
		
		width: 50%;
		height: 100%;
		background-image: url('/images/fire.png');
		background-position: left top;
		background-repeat: no-repeat;
		background-size: cover;
		z-index: -1;
	}
	.background-image2{
		position: fixed;
		right:0;
		bottom:0;
		width: 50%;
		height: 100%;
		background-image: url('/images/fire.png');
		background-position: left top;
		background-repeat: no-repeat;
		background-size: cover;
		z-index: -1;
	}
	.title-text{}
	.date-text{margin-left: auto;
    font-size: small;
    color: gray;}
    .create-btn{
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 55px;
    font-weight: 400;
    width: 70px;
    height: 70px;
    background-color: #FFD600;
    border-radius: 10px;
    border-color: transparent;
    margin-top: 30px;
    z-index: 2;
    position: fixed;
    bottom: 30px;
    right: 60px;
	}
  </style>
   <script>
       function formatDate() {
           const date = new Date();
           const month = date.getMonth() + 1; // 월은 0부터 시작하므로 1을 더합니다.
           const day = date.getDate();
           const days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
           const dayName = days[date.getDay()]; 
           return month+ "/" + day + " " + dayName;
       }
		
       window.onload = function() {
           const dateDisplayElement = document.getElementById('dateDisplay');
           if (dateDisplayElement) {
        	   const formattedDate = formatDate();
               dateDisplayElement.innerText += " " + formattedDate;
            // 요일에 따라 색상 변경
               const dayName = formattedDate.split(' ')[1]; // 포맷팅된 문자열에서 요일 이름을 추출합니다.
               console.log(dayName);
/*                if (dayName === "SUN" || dayName === "SAT") {
                   dateDisplayElement.style.color = 'red'; // 요일에 따라 텍스트 색상을 변경합니다.
                   document.querySelector('.background-image1').style.display = 'block';
                   document.querySelector('.background-image2').style.display = 'block';
               } */
           }
       }
       
       function btnDisabled(tid){
    	   const target = document.getElementById(tid);
    	   const targetCnt = document.getElementById(tid+'-content');
    	   target.disabled = true;
    	   targetCnt.style.backgroundColor = "#00D916";
    	   location.href='/task/updateToCompleted?tid=' + tid;
       } 
   </script>
</head>
<body>
	<div class="background-image1"></div>
	<div class="background-image2"></div>
    <div class="date-display" id="dateDisplay">오늘은? </div>
    <div class="list-wrapper shadow-lg">
    	<div class="list-title">할 일은? ${taskList.size()}개</div>
    	<div class="list-container">
	    	<c:forEach items="${taskList }" var="task">
	    		<div class="list-row">
        			<div class="list-row-title">
        				<div class="title-text">${task.title}</div>
        				<div class="date-text">${task.createdAt}</div>
        			</div>
        			<div class="btn-container">
	        			<button type="button" class="content-btn" onclick="location.href='/task/updateForm?tid=${task.tid}'">🗒️️</button>
	        			<button type="button" class="delete-btn" onclick="location.href='/task/delete?tid=${task.tid}'">🗑️</button>
	        			<button type="button" class="finish-btn" onclick="location.href='/task/updateToCompleted?tid=${task.tid}'">✅</button>
        			</div>
	    		</div>
	    	</c:forEach>
    	</div>
    </div>
    <button type="button" class="btn btn-warning shadow-sm create-btn" onclick="location.href='/task/createForm'">+</button>
    <button type="button" class="enter-btn" onclick="location.href='/'">🏠</button>
    <button type="button" class="done-btn" onclick="location.href='/task/listDone'">☑️</button>
</body>
</html>
