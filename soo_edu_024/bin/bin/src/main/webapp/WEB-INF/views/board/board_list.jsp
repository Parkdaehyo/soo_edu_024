<%@ page session="false"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html> 
<html>
 <script type="text/javascript" src="../../resources/js/jquery-3.3.1.min.js" ></script>
<head>
<title>board_list</title>
<script type="text/javascript">
	 $(document).ready(function () {
		 
	  });
	 
	
</script>
</head>
<body>
<form action="/" id ="soofrm" method="get">
<!-- 검색기능 시작 -->
	<select id="searchKey" name="searchKey"> 
		<option value=""
		>제목</option>
		<option value=""
		>작성자이름</option>
	</select>
	<input type="text" name="searchValue" id="searchValue">
	<input type="submit" value="검색" name="searchBtn" id="searchBtn">
<!-- 검색 끝 -->
</form>

<div id="board">
	<table>
	<c:forEach var="b" items="${articles}">
		<thead>
		 <tr>
		 	<th>삭제여부<th>
		 	<th>공지</th>
	        <th>번호</th>
	        <th>제목</th>
	        <th>글쓴이</th>
	        <th>작성일</th>
	        <th>파일</th>
	      </tr>
	    </thead>
	    <tbody>
	    	<tr>
	    		<td>${b.board_del_yn}</td>
	    		<td>${b.board_notice}</td>
		    	<td>${b.board_seq}</td>
			    <td>${b.board_title}</td>
			    <td>${b.board_write_name}</td>
			    <td>${b.board_reg_date}</td>
			    <td>${b.board_img_path}</td>
			</tr>
	    </tbody>
	    </c:forEach>
	</table>
	
</div>
	<a href="<c:url value='/board/write'/>"
				class="btn btn-izone float-right">글쓰기</a>
</body>


</body>
</html>
