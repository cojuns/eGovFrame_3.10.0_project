<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호입력화면</title>

<script src="/eGovFrame_Web_project/script/jquery-1.12.4.js"></script>
<script src="/eGovFrame_Web_project/script/jquery-ui.js"></script>

</head>

<script>

	$(function(){
	
		$("#delBtn").click(function(){
			
			var pass = $("#pass").val();
			pass = $.trim(pass);
			if(pass == ""){
				
				alert("암호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}
			
			var sendData = "unq=${unq}&pass="+pass; // json 설정
			
			$.ajax({ 
				
				type:"POST",
				data:sendData, 
				url:"boardDelete.do",
				dataType:"text", // 리턴 타입 
				
				success:function(result){ // controller에서 => "ok"값을 던져줬으면 성공
					
					if(result == "1"){
						alert("삭제완료");
						location="boardList.do"
					}else if(result == "-1") {
						
						alert("암호가 일치하지 않습니다.")

					}
										
					else{
						alert("삭제실패\n관리자에게 문의");
					}
					
				},
				error:function() { // 장애발생
					
					alert("오류발생")
					
				}
				
			});
			
			
		});
		
	});
	

</script>

<body>

<table>

	<tr>
		<th>암호입력</th>
		<td><input type="password" id="pass" /></td>
		<td><button type="button" id="delBtn">삭제하기</button></td>
	</tr>

</table>

</body>
</html>