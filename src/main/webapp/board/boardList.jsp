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
<title>Insert title here</title>
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
	
	.div1 {
	width: 600px;
	text-align: center;
	font-size: 15pt;
	}
	
	.div2 {
	width: 600px;
	text-align: lept;
	font-size: 8pt;
	}

</style>

<body>

    <div class="div1">일반게시판 목록</div>
    <div class="div2">Total : ${total }</div>
    <div class="div2">
        <form name="searchFrm" method="post" action="boardList.do">
        <select name="searchGubun" id="searchGubun">
            <option value="title" ${param.searchGubun == 'title' ? 'selected' : ''}>제목</option>
            <option value="name" ${param.searchGubun == 'name' ? 'selected' : ''}>글쓴이</option>
            <option value="content" ${param.searchGubun == 'content' ? 'selected' : ''}>내용</option>
        </select>
        <input type="text" name="searchText" id="searchText" value="${param.searchText}"/>
        <button type="submit">검색</button>
        </form>
    </div>

<table>
	
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
	
	<c:set var="cnt" value="${rowNumber }" /> <!-- 번호에서 사용 할 변수 -->
		
	<c:forEach var="result" items="${resultList }">
		<tr align="center">
			
			<td width="15%"><c:out value="${cnt }" /></td>
			
			<td align="left" width="40%">
			<a href="boardDetail.do?unq=${result.unq }">
			<c:out value="${result.title }" />
			</a>
			</td>
			
			<td width="15%"><c:out value="${result.name }" /></td>
			<td width="15%"><c:out value="${result.rdate }" /></td>
			<td width="15%"><c:out value="${result.hits }" /></td>
		</tr>
		
	<c:set var="cnt" value="${cnt-1 }" /> <!-- 반복문으로 1씩 증가 -->	
	
	</c:forEach>
</table>
	
<!-- 페이지 번호 처리 -->
<div style="width:600px; margin-top:5px; text-align:center;">
    <c:forEach var="i" begin="1" end="${totalPage}">
        <c:choose>
            <c:when test="${not empty param.searchGubun and not empty param.searchText}">
                <!-- 검색 조건이 있는 경우 -->
                <a href="boardList.do?viewPage=${i}&searchGubun=${param.searchGubun}&searchText=${fn:escapeXml(param.searchText)}"> ${i }</a>
            </c:when>
            <c:otherwise>
                <!-- 검색 조건이 없는 경우 -->
                <a href="boardList.do?viewPage=${i}"> ${i }</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>



<div style="width:600px; margin-top:5px; text-align:right;">
	<button type="button" onclick="location =' boardWrite.do '">글쓰기</button>
</div>

</body>
</html>