<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>KLOG • ${userInfo.title }</title>
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath}/resources/css/styles.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/main.css"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
</head>

<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top"
		id="sideNav">
		<a class="navbar-brand js-scroll-trigger" href="#page-top"> <span
			class="d-block d-lg-none">${userInfo.m_name }</span> <span
			class="d-none d-lg-block"><img
				class="img-fluid img-profile rounded-circle mx-auto mb-2"
				src="/UserImage/${userInfo.m_pic}"
				alt="..." /></span>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav">
				<div class="con_on">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#profile">Profile</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#education">Education</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#letter">letter</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#neighbor">neighbor</a></li>
				</div>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					id="nav_notice">Notice</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					id="nav_setting">Setting</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					id="nav_logout">Logout</a></li>
			</ul>
		</div>
	</nav>
	<!-- Page Content-->
	<div class="container-fluid p-0">
		<div class="container_none">
			<!-- About-->
			<section class="resume-section" id="profile">
				<div class="resume-section-content">
					<h1 class="mb-0" id="custom_title">${userInfo.title }</h1>
					<div class="subheading mb-5">
						${userInfo.m_name} <a href="mailto:name@email.com">${userInfo.email }</a>
					</div>
					<p class="lead mb-5">${userInfo.bio }</p>
					<div class="social-icons">
						<a class="social-icon" id="social_in" href="${social.insta}"><i
							class="fab fa-linkedin-in"></i></a> <a class="social-icon"
							id="social_git" href="${social.git}"><i class="fab fa-github"></i></a>
						<a class="social-icon" id="social_twi" href="${social.twitter}"><i
							class="fab fa-twitter"></i></a> <a class="social-icon" id="social_fb"
							href="${social.facebook}"><i class="fab fa-facebook-f"></i></a>
					</div>
				</div>
			</section>
			<hr class="m-0" />
			<!-- Experience-->
			<section class="resume-section" id="education">
				<div class="resume-section-content">
					<h2 class="mb-5">Experience</h2>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">Senior Web Developer</h3>
							<div class="subheading mb-3">Intelitec Solutions</div>
							<p>Bring to the table win-win survival strategies to ensure
								proactive domination. At the end of the day, going forward, a
								new normal that has evolved from generation X is on the runway
								heading towards a streamlined cloud solution. User generated
								content in real-time will have multiple touchpoints for
								offshoring.</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">March 2013 - Present</span>
						</div>
					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">Web Developer</h3>
							<div class="subheading mb-3">Intelitec Solutions</div>
							<p>Capitalize on low hanging fruit to identify a ballpark
								value added activity to beta test. Override the digital divide
								with additional clickthroughs from DevOps. Nanotechnology
								immersion along the information highway will close the loop on
								focusing solely on the bottom line.</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">December 2011 - March 2013</span>
						</div>
					</div>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">Junior Web Designer</h3>
							<div class="subheading mb-3">Shout! Media Productions</div>
							<p>Podcasting operational change management inside of
								workflows to establish a framework. Taking seamless key
								performance indicators offline to maximise the long tail.
								Keeping your eye on the ball while performing a deep dive on the
								start-up mentality to derive convergence on cross-platform
								integration.</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">July 2010 - December 2011</span>
						</div>
					</div>
					<div class="d-flex flex-column flex-md-row justify-content-between">
						<div class="flex-grow-1">
							<h3 class="mb-0">Web Design Intern</h3>
							<div class="subheading mb-3">Shout! Media Productions</div>
							<p>Collaboratively administrate empowered markets via
								plug-and-play networks. Dynamically procrastinate B2C users
								after installed base benefits. Dramatically visualize customer
								directed convergence without revolutionary ROI.</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">September 2008 - June 2010</span>
						</div>
					</div>
				</div>
			</section>
			<hr class="m-0" />
			<!-- Education-->
			<section class="resume-section" id="letter">
				<div class="resume-section-content">
					<h2 class="mb-5">Education</h2>
					<div
						class="d-flex flex-column flex-md-row justify-content-between mb-5">
						<div class="flex-grow-1">
							<h3 class="mb-0">University of Colorado Boulder</h3>
							<div class="subheading mb-3">Bachelor of Science</div>
							<div>Computer Science - Web Development Track</div>
							<p>GPA: 3.23</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">August 2006 - May 2010</span>
						</div>
					</div>
					<div class="d-flex flex-column flex-md-row justify-content-between">
						<div class="flex-grow-1">
							<h3 class="mb-0">James Buchanan High School</h3>
							<div class="subheading mb-3">Technology Magnet Program</div>
							<p>GPA: 3.56</p>
						</div>
						<div class="flex-shrink-0">
							<span class="text-primary">August 2002 - May 2006</span>
						</div>
					</div>
				</div>
			</section>
			<hr class="m-0" />
			<!-- Skills-->
			<section class="resume-section" id="neighbor">
				<div class="resume-section-content">
					<h2 class="mb-5">Skills</h2>
					<div class="subheading mb-3">Programming Languages & Tools</div>
					<ul class="list-inline dev-icons">
						<li class="list-inline-item"><i class="fab fa-html5"></i></li>
						<li class="list-inline-item"><i class="fab fa-css3-alt"></i></li>
						<li class="list-inline-item"><i class="fab fa-js-square"></i></li>
						<li class="list-inline-item"><i class="fab fa-angular"></i></li>
						<li class="list-inline-item"><i class="fab fa-react"></i></li>
						<li class="list-inline-item"><i class="fab fa-node-js"></i></li>
						<li class="list-inline-item"><i class="fab fa-sass"></i></li>
						<li class="list-inline-item"><i class="fab fa-less"></i></li>
						<li class="list-inline-item"><i class="fab fa-wordpress"></i></li>
						<li class="list-inline-item"><i class="fab fa-gulp"></i></li>
						<li class="list-inline-item"><i class="fab fa-grunt"></i></li>
						<li class="list-inline-item"><i class="fab fa-npm"></i></li>
					</ul>
					<div class="subheading mb-3">Workflow</div>
					<ul class="fa-ul mb-0">
						<li><span class="fa-li"><i class="fas fa-check"></i></span>
							Mobile-First, Responsive Design</li>
						<li><span class="fa-li"><i class="fas fa-check"></i></span>
							Cross Browser Testing & Debugging</li>
						<li><span class="fa-li"><i class="fas fa-check"></i></span>
							Cross Functional Teams</li>
						<li><span class="fa-li"><i class="fas fa-check"></i></span>
							Agile Development & Scrum</li>
					</ul>
				</div>
			</section>


			<hr class="m-0" />
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<script type="text/javascript">
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; // 5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");

				return false;
			}

			if (regex.test(fileName)) {

				alert("해당 종류의 파일은 업로드 불가");

				return false;
			}

			return true;
		}
		
		function picUpdate(input) {
			var formData = new FormData();

			var file = input.files[0];


			//add filedate to formdata

			if (!checkExtension(file.name, file.size)) {
				return false;
			}

			formData.append("uploadFile", file);
			
			// 사진 바꾸기
			var reader = new FileReader();
			reader.onload = function(e){
				$(".propic").attr("src", e.target.result);
			}
			
			reader.readAsDataURL(file);

		}


		var beforeColor; //이전에 선택된 컬러 저장 할 변수

		function init() {
			//2차원 배열 파레트 데이터
			var pallet = [
					[ "#FF0000", "#FF5E00", "#FFBB00", "#FFE400", "#ABF200",
							"#1DDB16", "#00D8FF", "#0054FF", "#0100FF",
							"#5F00FF", "#FF00DD", "#FF007F", "#000000",
							"#FFFFFF" ],
					[ "#FFD8D8", "#FAE0D4", "#FAECC5", "#FAF4C0", "#E4F7BA",
							"#CEFBC9", "#D4F4FA", "#D9E5FF", "#DAD9FF",
							"#E8D9FF", "#FFD9FA", "#FFD9EC", "#F6F6F6",
							"#EAEAEA" ],
					[ "#FFA7A7", "#FFC19E", "#FFE08C", "#FAED7D", "#CEF279",
							"#B7F0B1", "#B2EBF4", "#B2CCFF", "#B5B2FF",
							"#D1B2FF", "#FFB2F5", "#FFB2D9", "#D5D5D5",
							"#BDBDBD" ],
					[ "#F15F5F", "#F29661", "#F2CB61", "#E5D85C", "#BCE55C",
							"#86E57F", "#5CD1E5", "#6799FF", "#6B66FF",
							"#A566FF", "#F361DC", "#F361A6", "#A6A6A6",
							"#8C8C8C" ],
					[ "#CC3D3D", "#CC723D", "#CCA63D", "#C4B73B", "#9FC93C",
							"#47C83E", "#3DB7CC", "#4374D9", "#4641D9",
							"#8041D9", "#D941C5", "#D9418C", "#747474",
							"#5D5D5D" ],
					[ "#980000", "#993800", "#997000", "#998A00", "#6B9900",
							"#2F9D27", "#008299", "#003399", "#050099",
							"#3F0099", "#990085", "#99004C", "#4C4C4C",
							"#353535" ],
					[ "#670000", "#662500", "#664B00", "#665C00", "#476600",
							"#22741C", "#005766", "#002266", "#030066",
							"#2A0066", "#660058", "#660033", "#212121",
							"#191919" ] ];
			var tag = "";
			for (i = 0; i < pallet.length; i++) {
				for (j = 0; j < pallet[i].length; j++) {
					tag += "<div id="
							+ pallet[i][j]
							+ " class='colorBox' onclick='colorSet(this)'></div>";
				}
			}

			//파레트 파싱
			document.getElementById("palletBox").innerHTML = tag;

			//색상 입히기
			var colorBox = document.getElementsByClassName("colorBox");
			for (i = 0; i < colorBox.length; i++) {
				colorBox[i].style.background = colorBox[i].id;
			}
		}

		// onclick event
		function colorSet(target) {
			document.querySelector("nav").style.background = target.id;

			if (beforeColor != undefined && beforeColor != null) {
				document.getElementById(beforeColor).className = document
						.getElementById(beforeColor).className.replace(
						" active", "");
			}
			document.getElementById(target.id).className += " active";
			beforeColor = target.id;

			//$("#bgcolor").remove();
			//$("#User_setting").prepend("<input type='hidden' name='bgcolor' id='bgcolor' value='${userInfo.bgcolor}'>");
			$("#bgcolor").val(beforeColor);

		}
		
		// 중간에 나갈 경우
		function EndUpdate(){
			
			var formData = $("#m_pic").val();
			var picOrigin = $("#m_picOrigin").val();
			var bgcolor = $("#bgcolor").val();
			var bgcolorOrigin = "${userInfo.bgcolor}";
			var m_name = $("#m_name").val();
			var m_nameOrigin = "${userInfo.m_name}";
			var bio = $("#bio").val();
			var bioOrigin = "${userInfo.bio}";
			var title = $("#title").val();
			var titleOrigin = "${userInfo.title}";
			
			if(bgcolor != bgcolorOrigin || m_name != m_nameOrigin || bio != bioOrigin || title != titleOrigin){
				if(confirm("나가시면 변경 사항을 잃게됩니다. 정말 나가시겠습니까?") == true){
					$(".container-setting").remove();
					$(".container_none").show();
				} else{
					return false;
				}
			}
		}
		
		// 프로필 수정
		function profileUpdate(){
			
			var m_pic = $('input[name="chooseFile"]').get(0).files[0];
			var params = $('#User_setting').serialize();
			
			var formData = new FormData($("#User_setting")[0]);
			
			if(m_pic != undefined){
				console.log("사진 변경");
				formData.append("uploadFile", $("#chooseFile")[0].files[0]);
			} else{
				console.log("사진 노 변경");
				formData.append("m_pic", $("#m_picOrigin").val());
			}
			
			
			//console.log(m_pic);
			console.log(params);
			$.ajax({
				url : '/user/InfoChange',
				processData : false, // 이 둘은 무조건 false로 해야 전송이 된다.
				contentType : false,
				data : formData,
				type : "POST",
				dataType : "json",
				success : function(result) {
					console.log(result);
					location.reload();
				}
			});
		}

		$(document)
				.ready(
						function() {
							
							$('#sideNav').css("background-color", "${userInfo.bgcolor}");

							// 사용자 소셜 선택
							if ("${social.insta}" != "N") {
								$('#social_in').css("display", "inline-flex");
							}
							if ("${social.git}" != "N") {
								$('#social_git').css("display", "inline-flex");
							}
							if ("${social.twitter}" != "N") {
								$('#social_twi').css("display", "inline-flex");
							}
							if ("${social.facebook}" != "N") {
								$('#social_fb').css("display", "inline-flex");
							}

							// 설정 버튼 클릭
							$("#nav_setting").on(
											"click",
											function(e) {
												// 원래 있던 버튼 숨기기
												$(".container_none").hide();

												// 비밀번호 일치해야 설정창으로 들어갈 수 있도록 하기

												$(".container-setting")
														.remove();
												// 프로필 설정 관련 창 보여주기
												// 사진, 닉네임, 바이오, 타이틀, 비밀번호 변경, sns 연결, nav 혹은 블로그 색 --> 이건 나중에
												// userInfo와 비교해서 수정된 내용 있는데 con_on 누를 경우 경고창
												$(".container-fluid")
														.append(
																"<div class='container-setting'><section class='resume-section'><div class='resume-section-content'><form id='User_setting' accept-charset='utf-8'><input type='hidden' name='m_idx' id='m_idx' value='${userInfo.m_idx}'><input type='hidden' name='bgcolor' id='bgcolor' value='${userInfo.bgcolor}'><div class='container_pic'><label for='chooseFile' id='picInfo'><img class='propic' src='/UserImage/${userInfo.m_pic}'></label><input type='file' class='filebox' id='chooseFile' name='chooseFile' accept='image/*' onchange='picUpdate(this)'><input type='hidden' name='m_picOrigin' id='m_picOrigin' value='${userInfo.m_pic}'><span class='UserVerify'>미인증 회원입니다. 인증 후 설정 가능합니다.</span></div><div class='container-user'><div>닉네임 <input type='text' class='user_pro' name='m_name' id='m_name' value='${userInfo.m_name}'></div><div> 바이오 <input type='text' class='user_pro' name='bio' id='bio' value='${userInfo.bio}'></div><div>타이틀<input type='text' class='user_pro' name='title' id='title' value='${userInfo.title}'></div><div>SNS 연결<div class='user_sns'><i class='fab fa-linkedin-in' id='icon_in'></i><i class='fab fa-github' id='icon_in'></i><i class='fab fa-twitter' id='icon_in'></i><i class='fab fa-facebook-f' id='icon_in'></i></div></div></div>"
																		+ "<div class='container-color'>색상 변경<div id='palletBox' class='pallet'></div><button type='button' class='profile_update' onclick='profileUpdate();'>수정하기</button><button type='button' class='profile_delete'>탈퇴하기</button></form></div></section></div>");

												if ("${userInfo.verify}" == "N") {
													$('.UserVerify').css(
															"display",
															"inline-block");

													var input = document
															.getElementsByClassName("user_pro");
													input.setAttribute(
															"readonly",
															"readonly");

												}

												// 팔레트 추가
												init();

											});

							$(".con_on").on("click", function(e) {
								$(".container-setting").remove();
								$(".container_none").show();

							});
							
						});
	</script>

</body>
</html>