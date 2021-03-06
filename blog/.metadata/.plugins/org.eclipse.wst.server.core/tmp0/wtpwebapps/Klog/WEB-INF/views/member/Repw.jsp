<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KLOG • 비밀번호 변경</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<style>
.pw_main {
	background-color: #bd5d38;
	height: 300px;
	margin-top: 150px;
}

.pw_inner {
	padding-top: 40px;
	text-align: center;
}

.pw_st {
	font-family: 'Jua', sans-serif;
	font-size: 20px;
	text-align: center;
	height: 50px;
	margin-top: 10px;
}

.pw_chk {
	font-family: 'Jua', sans-serif;
	font-size: 20px;
	color: white;
	display: none;
	margin-left: 90px;
}

.pwchange {
	height: 30px;
	width: 300px;
	margin-left: 40px;
}

.pw_btn {
	width: 300px;
	height: 50px;
	border: none;
	border-radius: 5px;
	background-color: floralwhite;
	font-family: 'Jua', sans-serif;
	font-size: 20px;
	margin-top: 30px;
}

.pw_btn:hover{
	cursor: pointer;
	text-decoration: underline;
}
</style>
</head>
<body>


	<div class="pw_main">
		<div class="pw_inner">
			<div class="pw_st">
				새 비밀번호 <input type="password" id="password" name="password"
					class="pwchange" required oninput='checkPw()'>
			</div>
			<div class="pw_st">
				비밀번호 확인 <input type="password" id="password_chk" name="password"
					class="pwchange" required oninput='checkPw()'> <span
					class="pw_chk">비밀번호가 일치하지 않습니다.</span>
			</div>
			<button class="pw_btn" id="pw_submit">비밀번호 변경</button>
		</div>


	</div>






	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		//url의 이메일 가져오기
		function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
					.exec(location.search);
			return results == null ? "" : decodeURIComponent(results[1]
					.replace(/\+/g, " "));
		}

		// 비밀번호 일치하는지 확인
		function checkPw() {

			var password = $("#password").val();
			var pw_chk = $("#password_chk").val();
			
			 if (password != pw_chk) {
				$('.pw_chk').css("display", "block");
			} else if(password == pw_chk || pw_chk.length == 0) {
				$('.pw_chk').css("display", "none");
			}
		};

		$(document).ready(function() {

			var email = getParameterByName('email');

			$("#pw_submit").on("click", function(e) {

				var password = $("#password").val();
				var pw_chk = $("#password_chk").val();

				if(password.length==0 || pw_chk.length==0){
					alert("비밀번호를 입력하세요");
				} else if (password != pw_chk) {
					alert("비밀번호가 일치하지 않습니다.");
				} else {
					// 비밀번호 변경
					$.ajax({
						url : "/user/ChangePw",
						data : {
							"password" : password,
							"email" : email
						},
						type : "POST",
						dataType : "json",
						async : false,
						success : function(result) {

							console.log(result);

							if (result == 0) {
								alert("비밀번호가 변경되었습니다.");
								// 로그인화면으로 이동?
							}

						},
						error : function(e) {
							// 전송 후 에러 발생 시 실행 코드
							console.log("ERROR : ", e);
						}
					}); // end ajax 
				}

			});

		});
	</script>
</body>
</html>