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
<title>코드목록</title>
</head>

<style>
table {
	width: 400px;
	border-collapse: collapse; /* cell 간격없앰 */
}

th,td {
	border: 1px solid #cccccc;
	padding: 5px;
}

</style>

<body>
	
	<table>
		<caption>
		<div>코드목록</div><br>
		<div style="width:100%; text-align:left;" >Total : ${resultTotal } 개</div>
		</caption>
		<colgroup>
			<col width="20%"/>
			<col width="40%"/>
			<col width="40%"/>
		</colgroup>
		<tr>
			<th>번호</th>
			<th>그룹</th>
			<th>코드명</th>
		</tr>
	<c:set var="count" value="1" />
	<c:forEach var="result" items="${resultList }" varStatus="status">	
		<tr align="center">
			<td><c:out value="${count }" /></td>
			<td><c:out value="${result.gid }" /></td>
			<td>${result.name }</td>
		</tr>
		<c:set var="count" value="${count + 1 }" />
	</c:forEach>	
	</table>
	
</body>
</html>