<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/eGovFrame_Web_project/script/jquery-1.12.4.js"></script>
<script src="/eGovFrame_Web_project/script/jquery-ui.js"></script>
</head>

<style>

body {
	font-size: 9pt;

}

button {
	font-size: 9pt;

}

table {
	width: 600px;
	border-collapse: collapse;
	
}

th,td {
	border: 1px solid #cccccc;
	padding: 3px;

}

.input1 {
	width: 98%;
}

.textarea {
		width: 98%;
		height: 100px;
}

</style>

<script>




//jquery 방식
function fn_submit() {
	
	$("#title").val($.trim($("#title").val()) );
	
	// 앞뒤 공백 제거 $.trim ( 자바스크립트는 없고 jquery만 지원 )
	if( $.trim($("#title").val()) == ""){

		
		alert("제목을 입력해주세요!");
		$("#title").focus();//input 입력칸으로 이동
		return false;
		
	}
	
	
	if( $.trim($("#pass").val()) == ""){
		
		alert("암호를 입력해주세요!");
		$("#pass").focus();
		return false;
		
	}
	
	$("#pass").val($.trim($("#pass").val()) );
	
	
// ajax(비동기전송방식의 기능을 가지고 있는 jquery의 함수)
	var formData = $("#frm").serialize();
	
	$.ajax({ 
		// 전송 전 세팅
		type:"POST",
		data:formData,
		url:"boardModifySave.do",
		dataType:"text", // 리턴 타입 
		
		// 전송 후 세팅
		success:function(result){ // controller에서 => "ok"값을 던져줬으면 성공
			if(result == "1"){
				alert("수정완료");
				location="boardList.do"
			}else if(result == "-1"){
				alert("암호가 일치하지 않습니다.")
			}
			else{
				alert("수정실패\n관리자에게 문의");
			}
			
		},
		error:function() { // 장애발생
			
			alert("오류발생")
			
		}
		
	});
	
	
// 자바스크립트
/* 	if(document.frm.title.value == ""){
		alert("제목을 입력해주세요!");
		document.frm.title.focus();
		return false;
	}
	
	if(document.frm.pass.value == ""){
		alert("암호를 입력해주세요!");
		document.frm.pass.focus();
		return false;
	} */
	
	//document.frm.submit(); // 동기전송방식
	
	
	
}

</script>

<body>

<form id="frm">  <!-- method="post" action="boardWriteSave.do" 비동기 방식에는 필요없음 -->

<!-- 사용자한태는 안보이게 히든 처리 -->
<input type="hidden" name="unq" value="${boardVO.unq }" />

<table>
	<caption>게시판 수정</caption>
	
	<tr>
		<th width="20%"><label for="title">제목</label></th>
		<td width="80%"><input type="text" name="title" id="title" class="input1" value="${boardVO.title }"/></td>
	</tr>
		<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="password" name="pass" id="pass" /></td>
	</tr>
		<tr>
		<th><label for="name">글쓴이</label></th>
		<td><input type="text" name="name" id="name" value="${boardVO.name }" /></td>
	</tr>
		<tr>
		<th><label for="content">내용</label></th>
		<td><textarea name="content" id="content" class="textarea">${boardVO.content }</textarea></td>
	</tr>
		<tr>
		<th colspan="2">
		<button type="submit" onclick="fn_submit() ;return false;">저장</button>
		<button type="reset">취소</button>
		</th>
		
	</tr>
</table>	
</form>

</body>
</html>