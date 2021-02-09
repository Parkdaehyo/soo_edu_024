<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>

<html>
<head>
 <style>
   .no-underline{
      text-decoration:none;
   }
 </style>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
<!-- 	<h1>사이드 메뉴</h1> -->

<form name="frmLogin" method="post"  action="${contextPath}/user/login.do">
   <table border="1" width="50">
    <!--   <tr align="center">
         <td>아이디</td>
         <td>비밀번호</td>
      </tr> --> <!--  navbar -->
      <tr align="center">
         <td>
	    <input type="text" name="soo_user_name" value="" size="20" placeholder="ID">
	 </td>
	 </tr>
	 <tr>
         <td>
	    <input type="password" name="soo_user_password" value="" size="20" placeholder="PW">
	 </td>
      </tr>
 
   </table>
   
   
   <br>
   <br>
   
    	 
  </table>
  
    <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
            <h3>환영합니다. ${member.soo_user_name}님!</h3>
            <a href="${contextPath}/user/logout.do"><h3>로그아웃</h3></a>
          </c:when>
          <c:otherwise>
	        <a href="${contextPath}/user/loginForm.do"><h3>로그인</h3></a>
	      </c:otherwise>
	   </c:choose>   
	     <a href="${contextPath}/user/Findinfo.do">ID찾기/PW찾기</a>  
			<br>
			<br>
			
			<c:if test="${accessTime != null}">
			 최근 접속시간:<br>
			 <fmt:formatDate value="${accessTime.accessTime}"
                        pattern="yyyy년 MM월 dd일 a hh:mm" />
			</c:if>
			
		<%-- 	최근접속시간: ${accessTime.accessTime} --%>
			
			
  
  
   
</form>










    <br>
    <br>
    <br>
    <br>
	
	
	
</body>
</html>