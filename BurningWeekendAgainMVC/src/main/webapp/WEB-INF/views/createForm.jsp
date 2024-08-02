<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할 일 상세보기</title>
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
	.formPage-title{
	 color: black;
    font-size: 45px;
    font-weight: 700;
    margin-top: 7vh;
	}
	
	.form-wrapper{
	    background-color: white;
	    width: 70vw;
	    height: 75vh;
	    margin-top: 4vh;
	    border-radius: 20px;
	    padding: 40px;
	    display: flex;
	    flex-direction: column;
	    /* align-items: center; */
	    /* overflow: scroll; */
    }
    .form-container{
    display: flex;
    flex-direction: column;
    gap: 90px;
    }
    .form-text-container{
        display: flex;
    flex-direction: column;
    gap: 50px;
    }
    .form-title{
    font-size: 25px;
    font-weight: 700;
    display: flex;
    flex-direction: column;
    gap: 10px;
    }
    .form-content{
    font-size: 25px;
    font-weight: 700;
    display: flex;
    flex-direction: column;
    gap: 10px;
    }
    .real-title{
    font-size: 17px;
    font-weight: 400;
    padding-left: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    border: 2px solid #dde1eb;
    border-radius: 8px;
    width: 750px;
    height: 45px;
    }
    .real-content{
        font-size: 17px;
    font-weight: 400;
    padding-left: 10px;
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    border: 2px solid #dde1eb;
    border-radius: 8px;
    width: 900px;
    height: 150px;
    }
    .btn-container{
        display: flex;
    flex-direction: row;
    gap: 50px;
    justify-content: center;
    }
    .submit-btn{
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 17px;
    font-weight: 600;
    width: 100px;
    height: 45px;
    background-color: #FFD600;
    border-radius: 50px;
    border-color: transparent;
    /* margin-top: 30px;*/
    }
    .backToList-btn{
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 17px;
    font-weight: 600;
    width: 180px;
    height: 47px;
    background-color: #FFD600;
    border-radius: 50px;
    border-color: transparent;
    }
  </style>
</head>
<body>
  <div class="formPage-title">할 일 추가하기</div>
  <div class="form-wrapper shadow-lg">
	  <form method="post" class="form-container">
	  <input type="hidden" name="userId" value="${id}" >
	  <div class="form-text-container">
	    <div class="form-title">제목<input type="text" name="title" class="real-title"></div>
	    <div class="form-content">내용<input type="text" name="content" class="real-content"></div>
	   </div>
	   <div class="btn-container">
	   <button type="submit" class="btn btn-warning shadow-sm submit-btn">생성</button>
	   <button type="button" onclick="location.href='list'" class="btn btn-warning shadow-sm backToList-btn">목록으로 돌아가기</button>
		</div>	  
	  </form>
  </div>
</body>
</html>
