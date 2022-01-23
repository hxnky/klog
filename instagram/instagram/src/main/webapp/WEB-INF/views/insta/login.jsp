<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>로그인•Instagram</title>
<style type="text/css">
#find_login {
	font-size: 15px;
	display: block;
	text-align: center;
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
<link rel="icon" type="image/x-icon"
	href="/resources/assets/insta_logo.png" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />
<link href="/resources/css/reg.css" rel="stylesheet" />
</head>
<body>

	<!-- Main Content-->
	<div class="container px-4 px-lg-5">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-md-10 col-lg-8 col-xl-7">
				<div class="content_box">
					<img id="text_logo" src="/resources/assets/insta_text.jpg">
					<div>
						<form id="regForm">
							<div id="form_div">
								<input type="text" id="id" name="id" placeholder="아이디 또는 이메일">
							</div>
							<div id="form_div">
								<input type="password" id="pw" name="pw" placeholder="비밀번호">
							</div>
							<button type="button" id="regBtn">로그인</button>
						</form>
					</div>

					<div id="text_or">또는</div>
					<div id="social_login">소셜 로그인 버튼 들어갈 자리</div>
					<a href="/findPw" id="find_login">비밀번호를 잊으셨나요?</a>
				</div>
				<div class="login_box">
					<div id="login_account">계정이 없으신가요?</div>
					<div id="login_link">
						<a href="/reg">가입하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#regBtn").on("click", function(e) {
				console.log("버튼 클릭");

				var params = $('#regForm').serialize();
				console.log(params);

				var id = $("#id").val();
				
				$.ajax({
					url : '/user/login',
					data : params,
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {

						console.log(result);
						if (result == 1) {
							alert("로그인 성공");
							// 타임라인으로 이동
							self.location = "/TimeLine?id="+id;
						} else if (result == 2) {
							alert("비밀번호를 확인해주세요");
						} else {
							alert("아이디 또는 이메일이 존재하지 않습니다.");
						}
					},
					error : function(e) {
						// 전송 후 에러 발생 시 실행 코드
						console.log("ERROR : ", e);
					}
				}); // end ajax 
			});
		});
	</script>
</body>
</html>
