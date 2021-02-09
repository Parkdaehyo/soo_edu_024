<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html> 
<html>
 <script type="text/javascript" src="../resources/js/jquery-3.3.1.min.js" ></script>
<head>
<link href="../resources/css/main/main.css" rel="stylesheet" media="screen">
	<title>Start</title>
	<script type="text/javascript">
	 $(document).ready(function () {
	      
	  });


	function test(){
		alert("알림 변경 :)");
	}
	
	function mission1(){
		var url = 'http://www.naver.com';
		var name = 'popup test for kim';
		var option = 'width : 200px, height : 200px';
		window.open(url,name,option);	
		location.href="http://www.naver.com";
	}
	
	function mission2(){
		location.href="http://127.0.0.1:8080/pop.jsp";
	}
	
	function mission3(){
		location.href='/test/mvcPattern.do';
		
	}
	
	
	function soo_project1_board_list(){
		
		document.getElementById("soofrm").action = "/soo_project1_board/soo_project1_Board_list.do";
	    document.getElementById("soofrm").submit();
	}
	
	function soo_project1_board_list2(){
		
		document.getElementById("soofrm").action = "/soo_project1_board/soo_project1_Board_list2.do";
	    document.getElementById("soofrm").submit();
	}
	
	
	
	function soo_project1_user_list(){
		
		document.getElementById("soofrm").action = "/soo_project1_user/soo_project1_user_list.do";
	    document.getElementById("soofrm").submit();
	}
	
	function soo_project1_main_page(){
		
		document.getElementById("soofrm").action = "/soo_project_main/soo_project_mainpage.do";
	    document.getElementById("soofrm").submit();
	}
	

	
</script>
</head>

<body>

<form id ="soofrm">
	
	<a href="javascript:test()">클릭시 보여지는 알림창 내용을 변경하세요</a> <br/><br/>
	<input type ="button"  onclick="javascript:mission1()" value="과제01  팝업창만들기 naver.com이랑 연결하세요" > <br/><br/>	
	<input type ="button"  onclick="javascript:mission2()" value="과제02  index 아래 존재하는 pop.jsp 파일을 불러오세요" > <br/><br/>
	<input type ="button"  onclick="javascript:mission3()" value="과제03  MVC 패턴을 이용해서 페이지 이동을 만드세요."  > <br/><br/>
	<input type ="button"  onclick="javascript:soo_project1_board_list()" value="게시판페이지"  > <br/><br/>
	<input type ="button"  onclick="javascript:soo_project1_main_page()" value="메인페이지"><br/><br/>
	<input type ="button"  onclick="javascript:soo_project1_user_list()" value="회원리스트페이지"  > <br/><br/>
<!-- 	<input type ="button"  onclick="javascript:soo_project1_board_list2()" value="이해도 확인용 버튼입니다."  > <br/><br/> -->
	

</form>


</body>

</html>
