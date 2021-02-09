<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%-- 
<c:set var="article"  value="${articleMap.article}"  />
<c:set var="imageFileList"  value="${articleMap.imageFileList}"  />

 --%>
<%
  request.setCharacterEncoding("UTF-8");
%> 

<head>
   <meta charset="UTF-8">
   <title>글보기</title>
   <style>
     #tr_file_upload{
       display:none;
     }
     #tr_btn_modify{
       display:none;
     }
   
   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
   
      function backToList(obj){
    	  
    	  if (window.confirm('수정을 취소하시겠습니까?'))
    	  {
	  	 	 obj.action="${contextPath}/board//soo_project1_Board_list.do";
	   	 	 obj.submit();
    	  }
	    
	    
     }
  
	 function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_file_upload").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 
	 function fn_modify_article(obj){
		 console.log("수정버튼 클릭됨!");
		 obj.action="${contextPath}/board/modArticle.do";
		 obj.submit();
	 }
	 
	   function fn_remove_article(url,board_seq){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","board_seq");
	     articleNOInput.setAttribute("value", board_seq);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
/* 	 function fn_reply_form(url, parentNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","parentNO");
	     parentNOInput.setAttribute("value", parentNO);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form);
		 form.submit();
	 } 
	  */
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     } 
	 }  
 </script>
</head>
<body>
  <form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  <table  border=0  align="center">
  <tr>
   <td width=150 align="center" bgcolor=#FF9933>
      글번호
   </td>
   <td >
    <input type="text"  value="${article.board_seq}"  disabled />
    <input type="hidden" name="board_seq" value="${article.board_seq}"  />
   </td>
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      작성자
   </td>
   <td >
    <input type=text value="${article.board_writer_name}" name="board_writer_name"  disabled />
   </td>
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      제목 
   </td>
   <td>
    <input type=text value="${article.board_title}"  name="board_title"  id="i_title" disabled />
   </td>   
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      내용
   </td>
   <td>
    <textarea rows="20" cols="60"  name="board_content_text"  id="i_content"  disabled />${article.board_content_text }</textarea>
   </td>  
  </tr>
 <%-- 
 <c:if test="${not empty imageFileList && imageFileList!='null' }">
	  <c:forEach var="item" items="${imageFileList}" varStatus="status" >
		    <tr>
			    <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
			      이미지${status.count }
			   </td>
			   <td>
			     <input  type= "hidden"   name="originalFileName" value="${item.imageFileName }" />
			    <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${item.imageFileName}" id="preview"  /><br>
			   </td>   
			  </tr>  
			  <tr>
			    <td>
			       <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
			    </td>
			 </tr>
		</c:forEach>
 </c:if>
 	 --%>    
 	 
   <c:choose> 
     <c:when test="${not empty article.imageFileName && article.imageFileName!='null' }">
         <tr>
          <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
            이미지
         </td>
         <td>
           <input type= "hidden"  name="originalFileName" value="${article.imageFileName}" />
          <img src="${contextPath}/download.do?board_seq=${article.board_seq}&imageFileName=${article.imageFileName}" id="preview"  /><br>
          <a href="${contextPath}/download.do?board_seq=${article.board_seq}&imageFileName=${article.imageFileName}">다운로드</a>
         </td>   
        </tr>  
        <tr>
          <td ></td>
          <td>
             <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
          </td>
        </tr> 
       </c:when>
       <c:otherwise>
          <tr  id="tr_file_upload" >
                <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
                  이미지
                </td>
                <td>
                  <input  type= "hidden"   name="originalFileName" value="${article.imageFileName}" />
                </td>
             </tr>
             <tr>
                <td ></td>
                <td>
                   <img id="preview"  /><br>
                   <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
                </td>
           </tr>
       </c:otherwise>
    </c:choose> 
    
  <tr>
	   <td width="150" align="center" bgcolor="#FF9933">
	      등록일자
	   </td>
	   <td>
	    <input type=text value="<fmt:formatDate value="${article.board_reg_date}" />" disabled />
	   </td>   
  </tr>
  <tr   id="tr_btn_modify"  align="center"  >
	   <td colspan="2"   >
	       <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
           <input type=button value="취소"  onClick="backToList(frmArticle)">
	   </td>   
  </tr>


      <div>
         <a href="/soo_project1_board/soo_project1_Board_list.do">목록</a>
      
         <c:if test="${member.soo_user_name == article.board_writer_name || member.soo_user_name == 'admin'}">
         <input type=button value="수정하기" onClick="fn_enable(this.form)">
         <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.board_seq})">
      	 </c:if>
       
      </div>
 </form>
</body>
</html>