<%@ page session="false"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../../resources/js/jquery-3.3.1.min.js" ></script>
<meta charset="UTF-8">
<title>boardModify</title>
<script>
	$(function(){
		
	})
	
</script>
</head>
<body>
   <form encType="multiplart/form-data" name="modifyFrm" id="modifyFrm">
	<table>
   	<thead>
        <caption>글수정</caption>
	</thead>
    <tbody>
    	<tr>
                <th>제목</th>
                <td>
                	<input type="text" name="board_title" value=""/>
                </td>
            </tr>
            <tr>
            	<th>notice</th>
            	<td>
            		<input type="text" name="board_notice" value=""/>
            	</td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                	<c:out value=""></c:out>
                </td>
            </tr>
            <tr>
                <th>내용: </th>
                <td>
                	<textarea cols="10" name="board_content_text"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="등록" id="btnSave" name="btnSave"/>
                    <a href="/soo_project1_board/soo_project1_Board_list.do" id="listBtn">LIST</a>
                </td>
            </tr>
    </tbody>
</table>
  </form>
</body>
</html>