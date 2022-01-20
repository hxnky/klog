<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<form id="regForm">
		<div>
			아이디 <input type="text" id="id" name="id" placeholder="ID">
		</div>
		<div>
			비밀번호 <input type="password" id="pw" name="pw" placeholder="Password">
		</div>
		<div>
			닉네임 <input type="text" id="name" name="name" placeholder="Username">
		</div>
		<div>
			이메일 <input type="email" id="email" name="email" placeholder="email">
		</div>
		<button type="button" id="regBtn">회원가입</button>
	</form>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#regBtn").on("click", function(e) {
			console.log("버튼 클릭");

			var params = $('#regForm').serialize();
			console.log(params);
			alert(params);
// 			alert(params);
			
// 			var email = $('#email').val();
// 			var name = $('#name').val();
// 			var id = $('#id').val();
// 			var pw = $('#pw').val();
			
// 			var param = {"id":id, "pw":pw, "email":email, "pw":pw}
			

			$.ajax({
				url : '/user/reg',
				data : params,
				type : "POST",
				success : function(result) {
					alert(result);

				},
				error : function(e) {
					// 전송 후 에러 발생 시 실행 코드
					console.log("ERROR : ", e);
				}
			}); // end ajax 
		});
	});
</script>
</html>