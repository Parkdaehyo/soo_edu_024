<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
<title>board_list</title>

 <script
 		src="https://code.jquery.com/jquery-3.5.0.min.js" 
		integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
 		crossorigin="anonymous"></script>


<script type="text/javascript">
	 $(document).ready(function () {
		 
	  });
	 
	 </script>
	 
	 <script>
	 
	 function fn_articleForm(isLogOn,articleForm,loginForm){
		 
		 console.log("여기 들어가냐?");
		 console.log(isLogOn);
		 
		 //isLogOn이 null이 아니거나 false가 아니면(true)일경우
		  if(isLogOn != '' && isLogOn != 'false'){
		    location.href=articleForm;
		    
		    
		  }else{
			console.log("이게 작동되냐?");
		    alert("로그인 후 글쓰기가 가능합니다.")
		    location.href=loginForm+'?action=/board/articleForm.do'; //액션 파라미터 갑만 들고 loginForm으로 이동.
		  }
		}
	 
	 
	 
	 
	
</script>

<style>

.layer {display: none;}
.layer_cal {display: none;}
</style>


</head>
<body>
<!-- 	<form action="/" id="soofrm" method="get"> -->
		<!-- 검색기능 시작 -->
<!-- 		<select id="searchKey" name="searchKey">
			<option value="">제목</option>
			<option value="">작성자이름</option>
		</select> <input type="text" name="searchValue" id="searchValue"> <input
			type="submit" value="검색" name="searchBtn" id="searchBtn"> -->
		<!-- 검색 끝 -->
		
		<select id="condition" class="form-control" name="control">
		<option value="title" ${param.condition == 'title' ? 'selected' : ''}>제목</option>
		<option value="content" ${param.condition == 'content' ? 'selected' : ''}>내용</option>
		<option value="writer" ${param.condition == 'writer' ? 'selected' : ''}>작성자</option>
		<option value="titleContent" ${param.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
		<option value="board_reg_date" ${param.condition == 'board_reg_date' ? 'selected' : ''}>작성일</option>
		
		</select>
		<div class="layer2">
		<input type="text" name="keyword" value="${param.keyword}" id="keywordInput" placeholder="검색어">
		</div>
		<div class="layer"> <!--  작성일 -->
		<input type="date" name="keyword" value="${param.keyword}" id="keywordInput2"> <!-- style="display:none"  --> 
		</div>
		<div class="layer3"> <!--  제목,내용,작성자 -->
		<input type="button" value="검색" id="searchBtn">
		</div>
		<div class="layer_cal"> <!--  작성일 -->
		<input type="button" value="검색" id="searchBtn2">
		</div>
	<!-- </form> -->
	<div id="board">
	
	
		<table>
		
				
					<tr>
					<!-- 	<td>삭제여부<td> -->
						<td>공지</td>
						<td>번호</td>
						<td>제목</td>
						<td>글쓴이</td>
						<td>작성일</td>
						<td>파일</td>
					</tr>
					
				<c:if test="${articles.size() <= 0}">
				<tr>
				<td colspan="6" align="center">
					<strong>검색 결과가 없습니다!</strong>
				</td>
				
				</tr>
				</c:if>	
			
			
			<c:if test="${articles.size()>0}">	
						
			<c:forEach var="b" items="${articles}">
					<tr>
				<%-- 	    <td>${b.board_type}</td> --%>
					<%-- 	<c:if test=${member.soo_user_name != 'admin'}> --%>
						<td>${b.board_type}</td>
			<%-- 			</c:if> --%>
						<td>${b.board_seq}</td>
						<td><a
							href="<c:url value='/board/content/?board_seq=${b.board_seq}'/>">
								${b.board_title}</a></td>
						<td>${b.board_writer_name}</td>
						<%-- 	<fmt:formatDate value="${b.regDate}" pattern="yyyy년 MM월 dd일 a hh:mm" />	  --%>
						<td><fmt:formatDate value="${b.board_reg_date}" pattern="yy년  MM월 dd일"/></td>
						
						<td> 
						
						   <input type= "hidden"  name="originalFileName" value="${b.imageFileName}">
						<a href="${contextPath}/download.do?board_seq=${b.board_seq}&imageFileName=${b.imageFileName}">다운로드</a>
						</td>
					</tr>
				
			</c:forEach>
			</c:if>
		</table>

	</div>
<%-- 	<!-- 처음으로 -->
			<c:if test="${pc.prev}">
			<a href="<c:url value='/board/soo_project1_Board_list.do?page=1"'/>" class="page-link ${pc.paging.page == pageNum ? 'page-active' : ''}">처음</a>
			</c:if> --%>

<%-- 
	<c:if test="${pc.prev}">
		<li class="page-item"><a class="page-link"
			href="<c:url value='/board/soo_project1_Board_list.do?page=${pc.beginPage-1}&countPerPage=${pc.paging.countPerPage}'/>">이전</a>
		</li>
	</c:if> --%>
	<!-- 페이지 버튼 -->
	<c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
		<a
			href="<c:url value='/board/soo_project1_Board_list.do${pc.makeURI(pageNum)}'/>">${pageNum}</a>

	</c:forEach>
	
<%-- 	<c:if test="${pc.next}">
		<li class="page-item"><a class="page-link"
			href="<c:url value='/board/soo_project1_Board_list.do?page=${pc.endPage+1}&countPerPage=${pc.paging.countPerPage}'/>">다음</a>
		</li>
	</c:if> --%>
<!--  /soo_project_main/soo_project_mainpage.do -->
<%-- 	<a href="<c:url value='/board/articleForm.do'/>"
		class="btn btn-izone float-right">글쓰기</a> --%>
	
<%-- 	<a  class="cls1"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
                                                    '${contextPath}/user/loginForm.do')"><p class="cls2">글쓰기</p></a> --%>
	<!-- 111 -->
	<a href="javascript:fn_articleForm('${sessionScope.isLogOn}','${contextPath}/board/articleForm.do', 
                                                    '${contextPath}/user/loginForm.do')"><p class="cls2">글쓰기</p></a>
	<label>${sessionScope }</label>
	<a href="<c:url value='/soo_project_main/soo_project_mainpage.do'/>"
		class="btn btn-izone float-right">메인페이지로</a>
		
<script>

$(function() { //start jquery
	
	//검색 버튼 이벤트 처리
	$("#searchBtn").click(function() { //검색버튼을 누르면,
	console.log("검색 버튼이 클릭됨!"); //콘솔이 출력되고,
	const keyword = $("#keywordInput").val(); //input text의 value값을 읽어와서
	console.log("검색어: " + keyword); 
	
	const condition = $("#condition option:selected").val(); 
	//condition은 select의 id 그리고 그 id의 자식태그  옵션 :은 상태를 의미함(option 상태)의 .selected(선택된값)의 value를 읽어라. //checkbox는 option:checked(radio 옵션)
	console.log("검색조건: " + condition);
	
	location.href="/board/soo_project1_Board_list.do?keyword=" + keyword
			+"&condition=" + condition; // /board/list에 keyword와 condition을 전송
		
		
	});
	
 $("#searchBtn2").click(function() { //검색버튼을 누르면,
		console.log("검색 버튼이 클릭됨!"); //콘솔이 출력되고,
		const keyword = $("#keywordInput2").val(); //input text의 value값을 읽어와서
		console.log("검색어: " + keyword); 
		
		const condition = $("#condition option:selected").val(); 
		//condition은 select의 id 그리고 그 id의 자식태그  옵션 :은 상태를 의미함(option 상태)의 .selected(선택된값)의 value를 읽어라. //checkbox는 option:checked(radio 옵션)
		console.log("검색조건: " + condition);
		
		location.href="/board/soo_project1_Board_list.do?keyword=" + keyword
				+"&condition=" + condition; // /board/list에 keyword와 condition을 전송
			
			
		});
	
	
	//엔터키 입력 이벤트
	//키 코드가 13이면 클릭버튼을 활성화 시켜라.
	$("#keywordInput").keydown(function (key) {
		if(key.keyCode == 13) { //키가 13이면 실행(엔터는 13)
			$("#searchBtn").click();
		}
		
	});
	
	

	jQuery('#condition').change(function() {
		var state = jQuery('#condition option:selected').val();
		console.log(state);
		if ( state == 'board_reg_date' ) {
			jQuery('.layer').show(); //작성일
			jQuery('.layer_cal').show(); //작성일
			jQuery('.layer2').hide();
			jQuery('.layer3').hide();
		} else {
			jQuery('.layer').hide();
			jQuery('.layer_cal').hide(); //작성일
			jQuery('.layer2').show();
			jQuery('.layer3').show();
		}
		
	});
	
	
/* 	var a = '';
	
	$("#condition" option:selected).val() {
		if($(this).val() == 'board_reg_date') {
			
			a += '<input type='date'/>';
			
			$("#keywordInput").html(a);
		}
		
		
	});
	 */
	
});//end of jquery




</script>


</body>
</html>
