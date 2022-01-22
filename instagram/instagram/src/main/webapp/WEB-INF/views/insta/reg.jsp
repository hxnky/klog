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
					<div id="reg_text">친구들의 사진과 동영상을 보려면 가입하세요.</div>
					<div id="social_login">소셜 로그인 버튼 들어갈 자리</div>
					<div id="text_or">또는</div>
					<div>
						<form id="regForm">
							<div id="form_div">
								<input type="email" id="email" name="email" placeholder="이메일 주소">
							</div>
							<div id="form_div">
								<input type="text" id="id" name="id" placeholder="성명">
							</div>

							<div id="form_div">
								<input type="text" id="name" name="name" placeholder="사용자 이름">
							</div>
							<div id="form_div">
								<input type="password" id="pw" name="pw" placeholder="비밀번호">
							</div>
							<button type="button" id="regBtn">가입</button>
						</form>
					</div>
				</div>
				<div class="login_box">
					<div id="login_account">계정이 있으신가요?</div>
					<div id="login_link">
						<a href="/">로그인</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer-->
	<footer>
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-md-10 col-lg-8 col-xl-7">
					<ul class="list-inline text-center">
						<li class="list-inline-item"><a href="#!"> <span
								class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-twitter fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item"><a href="#!"> <!--내 노션 링크로 이동-->
								<!--노션 아이콘으로 변경 --> <span class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li class="list-inline-item">
							<!--내 깃허브 링크로 이동--> <a href="https://github.com/hxnky/personal">
								<span class="fa-stack fa-lg"> <i
									class="fas fa-circle fa-stack-2x"></i> <i
									class="fab fa-github fa-stack-1x fa-inverse"></i>
							</span>
						</a>
						</li>
					</ul>
					<div class="small text-center text-muted fst-italic">Instagram
						&copy; Kyung 2022</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="/resources/js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#regBtn").on("click", function(e) {
				console.log("버튼 클릭");

				var params = $('#regForm').serialize();
				console.log(params);

				$.ajax({
					url : '/user/reg',
					data : params,
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {

						console.log(result);
						alert(result);
						console.log(JSON.stringify(result));
						var data = JSON.stringify(result);
						// 가입 실패시 현재 페이지 아니면 로그인화면?
						if (result == 1) {
							console.log("이미 가입된 이메일입니다.");
							alert("이미 가입된 이메일입니다.");
							// 로그인화면으로 이동
							self.location = "/";
						} else if (result == 2) {
							console.log("아이디가 중복됩니다.");
							alert("아이디가 중복됩니다.");
							// 화면 그대로
						} else {
							console.log("회원가입 성공");
							alert("회원가입 성공");
							// 타임라인으로 이동하기
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
