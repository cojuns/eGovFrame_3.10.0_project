<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% pageContext.setAttribute("newline", "\n"); %>
<c:set var="content" value="${fn:replace(boardVO.content, newline, '<br>') }"  />
<!-- 개행 문자(\n)를 HTML에서 사용 가능한 줄바꿈(<br>)으로 변경 --> 
 
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

$(function(){

	$("#title").val("제목입력");
	
})


//jquery 방식
function fn_submit() {
	
	// 앞뒤 공백 제거 $.trim ( 자바스크립트는 없고 jquery만 지원 )

	if( $.trim($("#title").val()) == ""){

		
		alert("제목을 입력해주세요!");
		$("#title").focus();//input 입력칸으로 이동
		return false;
		
	}
	
	$("#title").val($.trim($("#title").val()) );
	
	if( $.trim($("#pass").val()) == ""){
		
		alert("암호를 입력해주세요!");
		$("#pass").focus();
		return false;
		
	}
	
	$("#pass").val($.trim($("#pass").val()) );
	
	
// ajax(비동기전송방식의 기능을 가지고 있는 jquery의 함수)
	var formData = $("#frm").serialize();
	
	$.ajax({ 
		
		type:"POST",
		data:formData,
		url:"boardWriteSave.do",
		dataType:"text", // 리턴 타입 
		
		success:function(data){ // controller에서 => "ok"값을 던져줬으면 성공
			
			if(data == "ok"){
				alert("저장완료");
				location="boardList.do"
			}else{
				alert("저장실패");
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
<table>
	<caption>게시판 상세</caption>
	
	<tr>
		<th width="20%">제목</th>
		<td width="80%">${boardVO.title }</td>
	</tr>

	<tr>
		<th>글쓴이</th>
		<td>${boardVO.name }</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td height="50">
		<!-- 개행 자바 코드 사용  -->
		${boardVO.content }
		<!-- 개행 JSTL  -->
		<%-- ${content } --%>
		</td>
	</tr>
	
	<tr>
		<th>등록일</th>
		<td>${boardVO.rdate }</td>
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