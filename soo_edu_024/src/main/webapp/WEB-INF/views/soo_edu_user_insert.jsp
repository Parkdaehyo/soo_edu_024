<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>

    <!--  이 구문을 넣으면 jQuery를 쓸 수 있다. -->
        <script
 		src="https://code.jquery.com/jquery-3.5.0.min.js" 
		integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
 		crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>회원 가입창</title>
<style>
   .text_center{
     text-align:center;
   }
   
   
   
   
   
   
</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('roadAddress').value = fullRoadAddr;
            document.getElementById('jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}
</script>
</head>
<body>

	<form id="formObj" method="post"   action="${contextPath}/user/addMember.do">
	<h1  class="text_center">회원 가입창</h1>
	<table  align="center">
	   <tr>
	      <td width="200"><p align="right">아이디</td>
	      <td width="400"><input type="text" name="soo_user_name" id="user_id"></td>
	   </tr>
	   <tr>
	   	      <td width="200"><p align="right">생년월일</td>
	      <td width="400"><input type="text" name="soo_user_birth"></td>
	   </tr>
	   <tr>
	   	  <td width="200"><p align="right">핸드폰번호 <span id="phoneChk"></span></td>
	      <td width="400"><input type="text" name="soo_user_phone" id="js_soo_user_phone"></td>
	   </tr>
	   <tr>
	   	  <td width="200"><p align="right">이메일주소 <span id="result-check"></span></td>
	      <td width="400"><input class="input-check-email" type="email" name="soo_user_mail" id="js_soo_user_mail"></td>
	   		<!-- <div id="result-check">

			</div> -->
	   </tr>
	   
<!-- 	   <tr>
	   	  <td width="200"><p align="right">주소</td>
	      <td width="400"><input type="text" name="soo_user_addr1"></td>
	   </tr> -->
	  <tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
					   <input type="text" id="zipcode" name="soo_user_zipcode" size=5> <a href="javascript:execDaumPostcode()">우편번호검색</a>
					  <br>
					  <p> 
					   지번 주소:<br><input type="text" id="roadAddress"  name="roadAddress" size="50"><br><br>
					  도로명 주소: <input type="text" id="jibunAddress" name="jibunAddress" size="50"><br><br>
					  나머지 주소: <input type="text" id="NamujiAddress" name="soo_user_addr2" size="50" />
					   <span id="guide" style="color:#999"></span>
					   </p>
					</td>
				<%-- 	<td>
					  <input type="button" value="수정하기" onClick="fn_modify_member_info('${member_info.member_id }','address')" />
					</td> --%>
				</tr>
	   <tr>
	   	  <td width="200"><p align="right">닉네임</td>
	      <td width="400"><input type="text" name="soo_user_nick"></td>
	   </tr>
	   <tr>
	      <td width="200"><p align="right">비밀번호</td>
	      <td width="400"><input id="password" type="password" name="soo_user_password"></td>
	    </tr>
	   <tr>
	      <td width="200"><p align="right">비밀번호 확인<span id="phoneChk2"></td>
	      <td width="400"><input id="password_check" type="password" name="soo_user_password2"></td>
	    </tr>
	  <!--   <tr>
	       <td width="200"><p align="right">비밀번호 확인</td>
	       <td width="400"><p><input type="text"></td>
	    </tr>
	     -->
	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400"><input id="signIn-btn" type="button" value="(저장)가입하기"><input type="reset" value="다시입력"></td>
	    </tr>
	</table>
	
	</form>
	       <td><a href="<c:url value='/user/memberForm.do"'/>">목록으로</a> </td>
</body>

<script>


$(function() {
	
		var regex= /[^0-9]/g
		const getIdCheck= RegExp(/^[a-zA-Z0-9]{5,10}$/);
		const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
		const getName=  RegExp(/^[가-힣]+$/);
		const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		let chk1 = false, chk2 = false, chk3 = false, chk4 = false; chk5 = false;
		
		
		
	/* 	if(!getIdCheck.test($("#user_id").val()) || $("#user_id").val() == ""){ //user_id를 test하고, getIdcheck에 있는 문자 내용들과 다르다면,
			//$('#user_id').css("background-color", "#A5D8FA"); //핑크색으로 변경
			//$('#idChk').html('<b style="font-size:14px;color:red;">[영문자,숫자 포함 5~10자만 가능합니다.]</b>'); //idCheck 부분에 이 문자열 삽입
			chk1 = false; // false로 설정.
		} else {
			
			chk1 = true;
		}
		 */
		
		/* if($("#roadAddress").val() || $("#jibunAddress").val() || $("#NamujiAddress").val() === "") {
			
			
			chk2 = false;
		}
		  */
	
		 
		/*  if(("#roadAddress").val() === "") {
			 
			 
		 } else if("#jibunAddress").val() === "") {
	
			} else if("##NamujiAddress").val() === "") {
				
			}
		 */
		
		//휴대폰 중복확인 키업이벤트
		$('#js_soo_user_phone').on('keyup', function() {
			
			var regexp = /^[0-9]*$/
			var phoneNum = $('#js_soo_user_phone').val();
			
			if($("#js_soo_user_phone").val().length < 11){
				//$('#user_id').css("background-color", "#A5D8FA"); //입력창을 분홍색으로 변경하겠다.
				$('#phoneChk').html('<b style="font-size:14px;color:red;">[11자리 필수 입력]</b>'); 
				//#idchk <span> </span> 사이에 html이하의 내용을 삽입하라.
				chk5 = false;
				
			} 	else if(!regexp.test(phoneNum)){
			    $('#js_soo_user_phone').css("background-color", "#A5D8FA");
				$('#phoneChk').html('<b style="font-size:14px;color:red;">[숫자만 입력 ]</b>');
				chk5 = false;
				
			}  else { 
				$("#js_soo_user_phone").css("background-color", "#A5D8FA");
				$('#phoneChk').html('<b style="font-size:14px;color:green;">[사용 가능합니다.]</b>');
				chk5 = true;
			}
			
			//이메일 유효성 검사
			function email_check( email ) {    
			    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			    return (email != '' && email != 'undefined' && regex.test(email)); 
		
			}
			
			// check when email input lost foucus
			$(".input-check-email").blur(function(){ //blur: focus를 잃었을때 처리한다.
			  var email = $(this).val();

			  // if value is empty then exit
			  if( email == '' || email == 'undefined') return;

			  // valid check
			  if(! email_check(email) ) {
			  	$("#result-check").text('@이후 2자리이상입력');
			    $(this).focus();
			    return false;
			  }
			  else {
			  	$("#result-check").text('사용가능');
			  }
			});	// check when email input lost foucus
			
			 
		}); //휴대폰 중복확인 키업 이벤트
		
		
		//패스워드 확인란 입력값 검증
		$('#password_check').blur(function() {
			
			if($("#password_check").val() === "") {
				
				chk3 = false;	
			} 
			else if($("#password").val() != $("#password_check").val()){
				
				$('#pwChk2').html('<b style="font-size:14px;color:red;">[비밀번호를 확인해주세요.]</b>');
				
				chk3 = false;
				
			} else {
				
				chk3 = true;
				
			}
			
			
			
			
			
			
		});
			
		//밖으로 빼니까 else if문 정상적으로 실행되었다.
		//저장하기 눌렀을때 실행되는 클릭이벤트
		$("#signIn-btn").click(function(e) {
			
			const formElement =$("#formObj");
			
			if(!getIdCheck.test($("#user_id").val()) || $("#user_id").val() === ""){ //user_id를 test하고, getIdcheck에 있는 문자 내용들과 다르다면,
				//$('#user_id').css("background-color", "#A5D8FA"); //핑크색으로 변경
				//$('#idChk').html('<b style="font-size:14px;color:red;">[영문자,숫자 포함 5~10자만 가능합니다.]</b>'); //idCheck 부분에 이 문자열 삽입
				chk1 = false; // false로 설정.
				//alert("아이디를 확인해주세요");
				
			} else {
				
				chk1 = true;
			}
			
			 if($("#roadAddress").val() === "" || $("#jibunAddress").val() === "" || $("#NamujiAddress").val() === "") {
					
					chk2 = false;
					
				} else {
					
					chk2 = true;
				}
			
			
			if($("#password_check").val() === "") {
				
				chk3 = false;	
			} 
			else if($("#password").val() != $("#password_check").val()){
				
				$('#pwChk2').html('<b style="font-size:14px;color:red;">[비밀번호를 확인해주세요.]</b>');
				
				chk3 = false;
				
			} else {
				
				chk3 = true;
				
			}
			
			
			//let chk1 = false, chk2 = false, chk3 = false, chk4 = false; chk5 = false;
			
			/* switch(let) {
			
			case  "chk3":
			alert("비밀번호를 확인해주세요");
			break;
			
			case  "chk5":
			alert("휴대폰번호를 확인해주세요");
			break;
			
			case  "chk1":
			alert("아이디를 확인해주세요");
			break;
			
			default:
				var result = confirm("정말로 회원가입 하시겠습니까?")
				formElement.attr("action" , "/user/addMember.do");
				formElement.submit();
							
			}  */
			
		if(chk1 && chk2 && chk3 && chk5) {
				
			var result = confirm("정말로 회원가입 하시겠습니까?")
			console.log("회원가입 버튼이 클릭됨!");
			formElement.attr("action" , "/user/addMember.do");
			//formElement.attr("method" , "get");
			formElement.submit();
			
		}else if(chk1 == false) {
			alert("아이디를 확인해주세요.");
		} else if(chk2 == false) {
			alert("우편번호를 확인해주세요.");
		} else if(chk5 == false) {
			alert("휴대폰번호를 확인해주세요.");
		} else if(chk3 == false) {
			alert("비밀번호를 확인해주세요.");
		} else {
			alert("입력정보를 확인해주세요");
		}
			
			
			
			
		/* 		
			} /* else if(chk1 == false) {
				alert("아이디를 확인해주세요.");
			} else if(chk2 == false) {
				alert("우편번호를 확인해주세요.");
			} else if(chk5 == false) {
				alert("휴대폰번호를 확인해주세요.");
			} else if(chk3 == false) {
				alert("비밀번호를 확인해주세요.");
			}
			 */
			 
			
	/* 		
			else {
				alert("입력정보를 확인해주세요");
			} */
			
		});
		
			
			
			
		
		
		
		
		
}); //최초 제이쿼리 시작 function

		
		
		
		
		
		
		
		
		
		</script>



</html>

