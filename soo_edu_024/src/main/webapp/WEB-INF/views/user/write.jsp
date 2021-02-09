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
 <form action="soo_project1_user_insert.do" method="post" encType="multiplart/form-data" name="writeFrm" >
	<table>
    <thead>
        <caption> user추가 </caption>
    </thead>
    <tbody>
            <tr>
                <th>이름</th>
                <td>
                	<input type="text" placeholder="이름 입력하세요." name="ftp_user_name"/>
                </td>
            </tr>
            <tr>
            	<th>생년월일</th>
            	<td>
            		<input type="text" placeholder="생년월일을 입력하세요 ex)20200417" name="ftp_user_birth"/>
            	</td>
            </tr>
            <tr>
                <th>핸드폰 번호</th>
                <td>
                	<input type="text" placeholder="닉네임을 입력하세요." name="ftp_user_phone"/>
                </td>
            </tr>
            <tr>
                <th>우편번호</th>
                <td>
                	<input type="text" placeholder="우편번호를 입력하세요" name="ftp_user_zipcode"/>
                </td>
            </tr>
             <tr>
                <th>도로명 주소</th>
                <td>
                	<input type="text" placeholder="주소를 입력하세요" name="ftp_user_addr1"/>
                </td>
            </tr>
             <tr>
                <th>상세주소</th>
                <td>
                	<input type="text" placeholder="상세주소를 입력하세요" name="ftp_user_addr2"/>
                </td>
            </tr>
            <tr>
                <th>email</th>
                <td>
                	<input type="text" placeholder="email을 입력하세요" name="ftp_user_mail"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" value="등록" id="btnSave"/>
                    <a href="/soo_project1_user/soo_project1_user_list.do" id="listBtn">LIST</a>
                </td>
            </tr>
            
    </tbody>
</table>
</form>
</body>
</html>