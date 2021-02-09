<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


 <script
 		src="https://code.jquery.com/jquery-3.5.0.min.js" 
		integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
 		crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	   
	   
	   <table  align="center">
	    <tr>
	   	  <td width="200"><p align="right">생년월일 <span id="phoneChk"></span></td>
	      <td width="400"><input type="text" name="soo_user_birth" id="inputbirth"></td>
	   </tr>
	   <tr>
	   	  <td width="200"><p align="right">핸드폰번호 <span id="phoneChk"></span></td>
	      <td width="400"><input type="text" name="soo_user_phone" id="inputpn"></td>
	   </tr>
	   
	   	  <td>
	   	  <input type="button" value="아이디 찾기" id="iDup-btn">
	   	  </td>
	   </table>
	   
	   
	   
<script>

//아이디 찾기 클릭 이벤트
$('#iDup-btn').click(function(e) { //여기
	
	// var name2 = '${user.account}';
	
	const inputbirth = $("#inputbirth").val();
	const inputpn = $("#inputpn").val();
	
	//console.log("이름 : " + inputname);
	console.log("생년월일 : " + inputbirth);
	console.log("휴대폰번호 : " + inputpn);
	
	const user = {
		
		//name : inputname, // key값은 VO필드명하고 똑같이.
		soo_user_phone : inputpn,
		soo_user_birth : inputbirth
		
	
	};
	
	//클라이언트에서 서버와 통신하는 ajax함수(비동기 통신) 
	$.ajax({
		type: "POST", //서버에 전송하는 HTTP요청 방식 회원가입이니까 POST방식.
		url: "/user/Findid.do",
		headers: {
			"Content-Type": "application/json"
		}, //요청 헤더 정보
		
		//Debug
		dataType: "JSON", //응답받을 데이터의 형태 JSON으로 바꾸니까 됬네??
		//data: JSON.stringify(name), // <-- JSON.stringify를 사용하면 ""가 붙어서 나오므로, 생략
		
		data: JSON.stringify(user), //서버로 전송할 데이터 
		
		success: function(result) { //함수의 매개변수는 통신성공시의 데이터가 저장될 곳.
			console.log("통신 성공!: " + result); // 그럼 하나하나 디버깅 해봐요. 일단 Client
			
			// Debug 
			//////////////////////////////////////////////////////////////////////////////////////////
			//if(result === "id") {
			//////////////////////////////////////////////////////////////////////////////////////////
			
			//올바르게 정보를 입력했을 경우에는, UserVO 자체가 null값일리 없으므로, 
			if(result.soo_user_phone!= null) { // 그러니까 여기에는 정상값이 잇어야 되는군요. 그러니까 이상한 값 null이 아닌값 그니까
				alert("귀하의 아이디는 " + result.soo_user_name + "입니다.");
			} else { //이건 당연히 UserVO 값이 null값이니까 당연히 이렇게 나오는거군요?ㅇ
				alert("입력하신 정보를 확인해주세요."); //어떻게 이게 나오는거죠?? 그러니까 이상한값 넣었을때 이게 나온다고요? 네
			}

		}, //통신 성공시 처리할 내용들을 함수 내부에 작성.
		error: function() {
			console.log("통신 실패!");
		} //통신 실패 시 처리할 내용들을 함수 내부에 작성.
	});

});



</script>	   
	   
	   
	   

</body>
</html>