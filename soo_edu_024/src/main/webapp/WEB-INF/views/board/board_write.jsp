<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../../resources/js/jquery-3.3.1.min.js" ></script>
<meta charset="UTF-8">
<title>글 입력</title>
<script>
	$(function(){
		
		
	})
	
	
</script>
</head>
<body>
 <form action="soo_project1_Board_insert.do" method="post" encType="multiplart/form-data" name="writeFrm" >
	<table>
    <thead>
        <caption> 글쓰기 </caption>
    </thead>
    <tbody>
            <tr>
                <th>제목</th>
                <td>
                	<input type="text" placeholder="제목을 입력하세요." name="board_title"/>
                </td>
            </tr>
            <tr>
            	<th>notice</th>
            	<td>
            		<input type="text" placeholder="notice" name="board_notice"/>
            	</td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                	<input type="text" placeholder="닉네임을 입력하세요." name="board_writer_name"/>
                </td>
            </tr>
            <tr>
                <th>내용: </th>
                <td>
                	<textarea cols="10" placeholder="내용을 입력하세요. " name="board_content_text"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="등록" id="btnSave"/>
                    <a href="/soo_project1_board/soo_project1_Board_list.do" id="listBtn">LIST</a>
                </td>
            </tr>
    </tbody>
</table>
</form>
</body>
</html>