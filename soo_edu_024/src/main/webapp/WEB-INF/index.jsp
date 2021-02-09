<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html> 
<html>
 <script type="text/javascript" src="resources/js/jquery-3.3.1.min.js" ></script>
 <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<head>
<link href="resources/css/main.css" rel="stylesheet" media="screen">
	<title>Start</title>
	<script type="text/javascript">
	 $(document).ready(function () {
	      
	  });

	function start(){
		
		document.getElementById("ftpfrm").action = "/soo_project_main/soo_project_main.do";
		document.getElementById("ftpfrm").submit();
	}	
</script>
</head>
<body>
<form id ="ftpfrm" method="post">
	<div >
 		 <button onClick="javascript:start()" style="border : none;" ><img src="resources/image/main.jpg"  /></button>
 	</div>
</form>
</body>

</html>
