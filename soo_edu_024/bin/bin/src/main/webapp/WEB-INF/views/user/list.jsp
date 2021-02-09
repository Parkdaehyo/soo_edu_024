<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 
<html xmlns = "http://www.w3.org/1999/xhtml"   
   xmlns:ui = "http://java.sun.com/jsf/facelets">

 <script type="text/javascript" src="../../resources/js/jquery-3.3.1.min.js" ></script>
<head>
	<title>Start</title>
	<script type="text/javascript">
	 $(document).ready(function (e) {
			
		})
	 
		
	</script>
</head>

<body>
	<form id ="soofrm" >
		<div >
	 		<p>유저 리스트 입니다.</p>
		</div>
		<div>
			<button type="button" id="insertBtn">유저 추가</button>
		</div>
	</form>
	<table>
	<thead>
	 <tr>
        <th>번호</th>
        <th>이름</th>
        <th>생일</th>
        <th>핸드폰번호</th>
        <th>우편번호</th>
        <th>주소</th>
        <th>이메일</th>
      </tr>
    </thead>
    <tbody>
    	<tr>
    		
    	    <td></td>
	    	<td></td>
		    <td></td>
		    <td></td>
		    <td></td>
		    <td></td>
		    <td></td>
		</tr>
    </tbody>
</table>


</html>
