<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입화면</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

	// 캘린더
  $( function() {
    $( "#birth" ).datepicker({
    		
    	
   	    dateFormat: "yy-mm-dd", // 날짜 형식 변경
      
    	changeMonth: true,
        changeYear: true
    });
    
    // 우편번호찾기(구)
    $("#btn_zipcode").click(function(){
    	
    	var w = 500;
    	var h = 100;
    	var url = "post1.do"
    	
    	window.open(url, 'zipcode', 'width='+ w +',height=' + h)
    	
    });
    
    
    var isIdChecked = false; // 아이디 중복 체크 상태를 저장하는 변수
    
    // 아이디 체크
    $("#btn_idcheck").click(function(){
    
    	var userid = $.trim($("#userid").val()); // 현재 창에 입력된 값
    	
    	if(userid == ""){
    		alert("아이디를 입력해주세요.");
    		$("#userid").focus();
    		return false;
    	}
    	// idCheck.do로 데이터 전송 - 비동기 전송 방식
    	$.ajax({
    	
    		type:"POST",
    		data:"userid="+userid, // 값 하나 전송 JSON 전송 타입
    		url:"idCheck.do",
    		dataType:"text", // 리턴 타입 
    		
    		success:function(result){ // controller에서 => "ok"값을 던져줬으면 성공
    			if(result == "ok"){
    				alert("사용가능한 아이디 입니다.");
    				isIdChecked = true;
    				$("#idcheck_status").text("중복체크 완료").addClass("idcheck_red"); // 중복체크 상태 표시
    			}else{
    				alert("이미 사용중인 아이디 입니다.");
    				isIdChecked = false;
    				$("#idcheck_status").text("").removeClass("idcheck_red"); // 메시지 제거
    			}
    			
    		},
    		error:function() { // 장애발생
    			
    			alert("오류발생")
    			
    		}	
    		
    	});
    	
    	
    	
    });
    
    // 회원가입 SAVE
    $("#btn_submit").click(function(){
    	
    	var userid = $("#userid").val();
    	var pass = $("#pass").val();
    	var name = $("#name").val();
    	
    	userid = $.trim(userid);
    	pass = $.trim(pass);
    	name = $.trim(name);
    	
    	if(userid == ""){
    		alert("아이디를 입력해주세요.");
    		$("#userid").focus();
    		return false;
    	}
    	
        if(!isIdChecked){ // 아이디가 입력되지 않았거나 중복 체크가 되지 않은 경우
            alert("아이디 중복체크를 해주세요.");
            $("#userid").focus();
            return false;
        }
    	
    	
    	if(pass == ""){
    		alert("비밀번호를 입력해주세요.");
    		$("#pass").focus();
    		return false;
    	}
    	
    	if(name == ""){
    		alert("이름을 입력해주세요.");
    		$("#name").focus();
    		return false;
    	}
    	
    	
    	
    	// var(userid = $.trim(userid);)
    	$("#userid").val(userid);
    	$("#pass").val(pass);
    	$("#name").val(name);
    	
    	
    	var formData = $("#frm").serialize();
    	
    	$.ajax({ 
    		
    		type:"POST",
    		data:formData,
    		url:"memberWriteSave.do",
    		dataType:"text", // 리턴 타입 
    		
    		success:function(result){ // controller에서 => "ok"값을 던져줬으면 성공
    			
    			if(result == "ok"){
    				alert("회원가입 완료");
    				location="loginWrite.do"
    			}else{
    				alert("회원가입 실패");
    			}
    			
    		},
    		error:function() { // 장애발생
    			
    			alert("오류발생")
    			
    		}
    		
    	});
    	
    });
    
    
    
  });
</script>

</head>

<style>

body {
	font-size: 9pt;
	font-color: #333333;
	font-family: 맑은 고딕;
}
a{
	text-decoration: none;
}
table {
	width: 600px;
	border-collapse: collapse;

}
th,td {
	border: 1px solid #cccccc;
	padding:3px;
	line-height:2.0;

}
th {
	width: 50px;
}
.div_button{
	width:600px;
	text-align:center;
	margin-top:5px;
	
}
caption{
	font-size:15pt;
	font-weight:bold;
	margin-top:10px;
	padding-bottom: 3px;
}

.idcheck_red {
	color: red;
}

</style>

<body>

<table>

	<tr>
		<th width="25%"><a href="">홈</a></th>
		<th width="25%"><a href="/eGovFrame_Web_project/boardList.do">게시판</a></th>
		<th width="25%"><a href="/eGovFrame_Web_project/memberWrite.do">회원가입</a></th>
		<th width="25%"><a href="/eGovFrame_Web_project/loginWrite.do">로그인</a></th>
	</tr>

</table>
<form id="frm" name="frm">
<table>

	<caption>회원가입 폼</caption>
	
	<tr>
		<th><label for="userid">아이디</label></th>
		<td><input type="text" name="userid" id="userid" placeholder="아이디입력"/>
		<button type="button" id="btn_idcheck">중복체크</button>
		<span id="idcheck_status"></span>
		</td>
	</tr>
	
	<tr>
		<th><label for="pass">비밀번호</label></th>
		<td><input type="password" name="pass" id="pass" />
		</td>
	</tr>
	
	<tr>
		<th><label for="name">이름</label></th>
		<td><input type="text" name="name" id="name" />
		</td>
	</tr>
	
	<tr>
		<th><label for="gender">성별</label></th>
		<td>
		<input type="radio" name="gender" id="gender" value="M" />남
		<input type="radio" name="gender" id="gender" value="F" />여
		</td>
	</tr>
	
	<tr>
		<th><label for="birth">생년월일</label></th>
		<td>
		<input type="text" name="birth" id="birth" />
		</td>
	</tr>
	
	<tr>
		<th><label for="phone">연락처</label></th>
		<td>
		<input type="text" name="phone" id="phone" />(예:010-1234-1234)
		</td>
	</tr>
	
	<tr>
		<th><label for="address">주소</label></th>
		<td>
		<input type="text" name="zipcode" id="zipcode" />
		<button type="button" id="btn_zipcode">우편번호찾기</button>
		<br>
		<input type="text" name="address" id="address" style="width: 400px"/>
		<input type="text" name="address2" id="address2" style="width: 400px"/>
		</td>
	</tr>
	
</table>

<div class="div_button">
	<button type="button" id="btn_submit">저장</button>
	<button type="reset">취소</button>
</div>

</form>
</body>
</html>