<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KLOG • 인증하기</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<style type="text/css">
.userVerify {
	background-color: #bd5d38;
	height: 300px;
	margin-top: 150px;
}

.verifyD {
	font-family: 'Jua', sans-serif;
	font-size: 50px;
	text-align: center;
	line-height: 300px;
}
</style>
</head>
<body>

	<div class="userVerify"></div>








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

		$(document)
				.ready(
						function() {

							var email = getParameterByName('email');
							console.log(email);

							// 회원 인증값 변경
							$
									.ajax({
										url : "/user/verifyes",
										data : {
											"email" : email
										},
										type : "POST",
										dataType : "json",
										async : false,
										success : function(result) {

											console.log(result);

											if (result == 1) {
												console.log("인증됨");
												$(".userVerify")
														.append(
																"<div class='verifyD'>"
																		+ email
																		+ "님 인증 완료되었습니다.</div>");

											} else {
												console.log("이미 인증됨");
												$(".userVerify")
														.append(
																"<div class='verifyD'>이미 인증 완료된 회원입니다.</div>");
											}

										},
										error : function(e) {
											// 전송 후 에러 발생 시 실행 코드
											console.log("ERROR : ", e);
										}
									}); // end ajax 

						});
	</script>
</body>
</html>