<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html> 

<html>
<script type="text/javascript" src="../../resources/js/jquery-3.3.1.min.js" ></script>
<head>

	<title>Start2</title>
	
	<script type="text/javascript">
	$(document).ready(function () {

	      
	  });
	
	function tab01_button01(){
		alert("progectboard 패키지 안에 신설하세요 controller, service, serviceImpl, vo, DAO, xml 생성하여 만드세요");
		
	}
	</script>
</head>

<body>
<font size="5">
	 스토리보드보고 만드세요
</font>

<form id ="ftpfrm">
	
	<input type ="button"  onclick="javascript:tab01_button01()" value="게시판리스트를 페이지 생성하세요."  > <br/><br/>
</form>


</body>
</html>
