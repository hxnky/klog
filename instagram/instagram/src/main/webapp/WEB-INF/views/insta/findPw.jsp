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
<title>비밀번호 재설정 •Instagram</title>
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
<link href="/resources/css/reg.css?after" rel="stylesheet" />
</head>
<body>

	<!-- Main Content-->
	<div class="container px-4 px-lg-5">
		<div class="row gx-4 gx-lg-5 justify-content-center">
			<div class="col-md-10 col-lg-8 col-xl-7">
				<div class="content_box">
					<div id="findForm">
						<img id="lock_logo" src="/resources/assets/lock.png">



						<div id="findPw_qe">로그인에 문제가 있나요?</div>
						<div id="findPw_box">
							<div id="findPw_notice">이메일 주소 또는 사용자 이름을 입력하시면 계정에 다시 액세스할
								수 있는 링크를 보내드립니다.</div>
							<div id="find_div">
								<input type="text" id="id" name="id" placeholder="아이디 또는 이메일">
							</div>
							<button type="button" id="findBtn">로그인 링크 보내기</button>
							<div id="text_or">또는</div>
							<a href="/reg" id="find_login">새 계정 만들기</a>
						</div>
					</div>



				</div>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#findBtn").on("click", function(e) {
				console.log("버튼 클릭");

				var id = $('#id').val();
				console.log(id);

				$.ajax({
					url : '/user/find',
					data : {
						"id":id
					},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {

						console.log(result);
						if(result == 1){
							alert("이메일을 확인해주세요");
							self.location="/";
						} else if(result == 0){
							alert("존재하지 않는 사용자입니다.");
						} else{
							alert("메일 전송 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요");
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
