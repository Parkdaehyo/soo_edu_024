<%@ page session="false"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../../resources/js/jquery-3.3.1.min.js" ></script>
<script>

</script>
<title>boardView</title>
</head>
<body>
	<form id="viewFrm" name="viewFrm" method="post" action="/soo_project1_board/soo_project1_Board_delete.do">
	 	<%-- <input type="hidden" name="board_seq" value="${viewList.board_seq}"/> --%>
		 <ul>
	       <li><input type="text" name='writer' value="${article.board_writer_name}" readonly</li>
	       <li>
	       </li>
	       <li>notice</li>
	       <li>
	       <input type="text" name='writer' value="${article.board_title}" readonly
	       </li>
	       
	       <li>title</li>
	       <li>
	       </li>
	       <li>regDate</li>
	       <li>
	       </li>
	       <li>content</li>
	       <li>
	       </li>
	   </ul>
	   <div>
		   <a href="/board/soo_project1_Board_list.do">목록</a>
		   <a href=''>수정</a>
		   <button id="delBtn">삭제</button>
	   </div>
   </form>
    
</body>
</html>