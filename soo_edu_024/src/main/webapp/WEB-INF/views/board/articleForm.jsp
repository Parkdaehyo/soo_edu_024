<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%>

<head>

<script src="https://code.jquery.com/jquery-3.5.0.min.js"
	integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>글쓰기창</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="${contextPath}/board/listArticles.do";
    obj.submit();
  }
  
  var cnt=1;
  function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
	  cnt++;
	  

  }

</script>


<title>글쓰기창</title>
</head>
<body>

		<%-- 	<tr>
				<c:choose>
					<c:when test="${member.soo_user_name == 'admin'}">
						<select id="board_type" class="form-control" name="control">
							<option value="notice" ${param.board_type == 0 ? 'selected' : ''}>공지사항</option>
							<option value="Q&A" ${param.board_type == 1 ? 'selected' : ''}>묻고답하기</option>
						</select>
					</c:when>
					<c:otherwise>
							<select id="board_type2" class="form-control" name="control">
							<option value="Q&A" ${param.board_type == 1 ? 'selected' : ''}>묻고답하기</option>
							</select>
					</c:otherwise>
				</c:choose>

			</tr>
	 --%>

	
	<%-- 			<tr>
				<c:choose>
					<c:when test="${member.soo_user_name == 'admin'}">
						<select id="board_type" class="form-control" name="board_type">
							<option value="0" ${param.board_type == 0 ? 'selected' : ''}>공지사항</option>
							<option value="1" ${param.board_type == 1 ? 'selected' : ''}>묻고답하기</option>
						</select>
					</c:when>
					<c:otherwise>
							<select id="board_type2" class="form-control" name="board_type">
							<option value="Q&A" ${param.board_type == 1 ? 'selected' : ''}>묻고답하기</option>
							</select>
					</c:otherwise>
				</c:choose>

			</tr> --%>


	<h1 style="text-align: center">글쓰기</h1>
	  <form name="articleForm" method="post" action="${contextPath}/board/addNewArticle.do"  enctype="multipart/form-data">


		<table border="0" align="center">
	
			
				<tr>
				<c:choose>
					<c:when test="${member.soo_user_name == 'admin'}">
						<select id="board_type" class="form-control" name="board_type">
							<option value="0" ${param.board_type == 0 ? 'selected' : ''}>공지사항</option>
							<option value="1" ${param.board_type == 1 ? 'selected' : ''}>묻고답하기</option>
						</select>
					</c:when>
					<c:otherwise>
							<select id="board_type2" class="form-control" name="board_type">
							<option value="Q&A" ${param.board_type == 1 ? 'selected' : ''}>묻고답하기</option>
							</select>
					</c:otherwise>
				</c:choose>

			</tr> 
			


			<tr>
				<td align="right">작성자</td>
				<td colspan=2 align="left"><input type="text" size="20"
					maxlength="100" name="board_writer_name"
					value="${member.soo_user_name}" readonly /></td>
			</tr>
			<tr>
				<td align="right">글제목:</td>
				<td colspan="2"><input type="text" size="67" maxlength="500"
					name="board_title" /></td>
			</tr>
			<tr>
				<td align="right" valign="top"><br>글내용:</td>
				<td colspan=2><textarea name="board_content_text" rows="10"
						cols="65" maxlength="4000">
				</textarea> <span id="board_content_text"></span></td>
			</tr>
			<tr>
				<td align="right">이미지파일 첨부:</td>
				<td><input type="file" name="imageFileName"
					onchange="readURL(this);" /></td>
				<td><img id="preview" src="#" width=200 height=200 /></td>


				<td align="right">이미지파일 첨부</td>
				<td align="left"><input type="button" value="파일 추가"
					onClick="fn_addFile()" /></td>


			</tr>
			<tr>
				<td colspan="4"><div id="d_file"></div></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td colspan="2"><input id="write" type="submit" value="글쓰기"
					 /> <input
					type=button value="목록보기" onClick="backToList(this.form)" /></td>
					<!--   -->
			</tr>
		</table>
	</form>


<script>

/* $("#write").click(function(e) {

	
	 const formElement =$("#writeform")
	 
	$('#board_type').val('notice').prop("selected",true) {}
	 
	 
	
	
});
 */


</script>

</body>
</html>
