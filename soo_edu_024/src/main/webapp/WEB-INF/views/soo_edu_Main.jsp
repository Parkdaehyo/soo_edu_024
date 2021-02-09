<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <jsp:include page="header.jsp" /> --%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<br>
<br>
<br>
<br>
<br>
<br>

메인페이지다

<a href="<c:url value='/user/memberForm.do"'/>">회원가입</a>
<a href="<c:url value='/user/loginForm.do'/>">로그인</a>
<a href="${contextPath}/board/soo_project1_Board_list.do">게시판</a>


 <c:if test="${member != null}" >
   <!-- -session.setAttribute("login", dbData);에 의해서 login에는 UserVO에 데이터가 담겨져있으므로 login.name해서 DB계정을 출력.  EL에서는 getter생략. -->
    	 <a href="#">${member.soo_user_name}님 <br> 안녕하세요</a>
    </c:if>

</body>
</html>