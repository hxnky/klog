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
<title>Instagram</title>
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
				<div class="content_box_pw">
					<div id="findForm">
						<img id="profile_pic" src="/resources/assets/profile.png">
						<div id="findPw_qe"></div>
						<div id="findPw_box">
							<div id="find_div">
								<input type="password" id="pw_new" name="pw" placeholder="새 비밀번호">
							</div>
							<div id="find_div">
								<input type="password" id="pw_same" name="pw"
									placeholder="새 비밀번호 확인">
							</div>
							<button type="button" id="findBtn">비밀번호 변경</button>

							<a id="find_login">건너뛰기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../footer.jsp"%>
	<script type="text/javascript">
		//url의 아이디 가져오기
		function getParameterByName(name) {
			name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
					.exec(location.search);
			return results == null ? "" : decodeURIComponent(results[1]
					.replace(/\+/g, " "));
		}

		$(document).ready(function() {
			
			var userid = getParameterByName('id');
			console.log(userid);
			
			$( "#findPw_qe" ).append(userid);
			
			$("#find_login").on("click", function(e) {
				self.location="/TimeLine?id="+userid;
			});

				
			
			$("#findBtn").on("click", function(e) {
				console.log("버튼 클릭");

				var pw = $('#pw_new').val();
				var pwSame = $("#pw_same").val();

				if (pw != pwSame) {
					alert("비밀번호가 일치하지 않습니다.");
				}

				// 비밀번호 변경
				$.ajax({
					url : '/user/RePw',
					data : {
						"id" : userid,
						"pw" : pw
					},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {

						console.log(result);
						
						if (result == 1) {
							alert("비밀번호 변경 완료");
							self.location = "/TimeLine";
						} else {
							alert("오류가 발생하였습니다. 잠시 후에 다시 시도해주세요");
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
