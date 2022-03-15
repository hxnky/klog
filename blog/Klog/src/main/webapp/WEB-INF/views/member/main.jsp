<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>KLOG ${userInfo.title }</title>
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
<link
	href="${pageContext.request.contextPath}/resources/css/animate.css"
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
				src="/UserImage/${userInfo.m_pic}" alt="..." /></span>
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
					id="nav_logout" href="/user/logout">Logout</a></li>
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
					<h2 class="mb-5" id="PostHead">Education</h2>
					<div class="mb-5" id="CreatePost" onclick="PostModalShow();">글
						작성</div>

					<!-- 글 목록 -->
					<div>
						<button type="button" id="postListImg" class="ScrollUp">
							<img src="/resources/assets/img/triangle_up.png">
						</button>
						<div id="postList" class="animate slideOutUp">
							<c:forEach items="${post}" var="list">
								<div
									class="d-flex flex-column flex-md-row justify-content-between mb-5">
									<div class="flex-grow-1">
										<button class="content-toggler" type="button"
											data-bs-toggle="collapse"
											data-bs-target="#collapse_${list.p_idx }"
											aria-controls="collapse_${list.p_idx }" aria-expanded="false">
											<h3 class="mb-0" data-toggle="collapse">
												<input type='text' class='postText'
													id='title_${list.p_idx }'
													value='<c:out value="${list.post_title}" />'>
											</h3>
										</button>

										<div class="subheading mb-3">
											<c:out value="${list.post_writer}" />
										</div>
										<p class="collapse" id="collapse_${list.p_idx }">
											<input type='text' class='postText'
												id='content_${list.p_idx }'
												value='<c:out value="${list.post_content}" />'>
										<div class="AttachImg">
											<c:forEach items="${attach}" var="Att_img">
												<c:set var="listPidx" value="${list.p_idx }" />
												<c:set var="AttachPidx" value="${Att_img.p_idx }" />
												<c:if test="${ listPidx eq AttachPidx }">

													<img src="/PostImage/${Att_img.a_name }">


												</c:if>

											</c:forEach>
										</div>
										</p>


									</div>
									<div class="flex-shrink-0">
										<span class="text-primary"><fmt:formatDate
												value="${list.post_updatetime}" pattern="yyyy-MM-dd" /></span>
										<c:if test="${'${usreInfo.m_idx }' != '${list.m_idx }'}">
											<div id="postBtn">
												<button type="button" id="PostEdit"
													onclick="PostEdit(${list.p_idx });">수정</button>
												<button type="button" id="PostDel"
													onclick="PostDel(${list.p_idx});">삭제</button>
											</div>
										</c:if>

									</div>
									<input type="hidden" id="post_m_idx" value="${list.m_idx }">
								</div>
							</c:forEach>
						</div>
						<button type="button" id="postListImg" class="ScrollDown">
							<img src="/resources/assets/img/triangle.png">
						</button>


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

			<!-- 유저 정보 모달 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">타이틀</h4>
						</div>
						<div class="modal-body"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" onclick="modalHide();">취소</button>
							<button type="button" class="btn btn-primary"
								onclick="modalCheck();">확인</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 글 작성 모달 -->
			<div class="modal fade" id="myPostModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close" onclick="modalHide();">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="myPostModalLabel">타이틀</h4>
						</div>
						<div class="Postmodal-body"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" onclick="modalHide();">취소</button>
							<button type="button" class="btn btn-primary" id="postModalBtn"
								onclick="PostmodalCheck();">확인</button>
						</div>
					</div>
				</div>
			</div>



			<hr class="m-0" />
		</div>


	</div>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Core theme JS-->
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/wow.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<script type="text/javascript">
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; // 5MB
		// 파일 현재 필드 숫자 totalCount랑 비교값
		var fileCount = 0;
		// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
		var totalCount = 10;
		// 파일 고유넘버
		var fileNum = 0;
		// 첨부파일 배열
		var content_files = new Array();

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
			reader.onload = function(e) {
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
		function EndUpdate() {

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

			if (bgcolor != bgcolorOrigin || m_name != m_nameOrigin
					|| bio != bioOrigin || title != titleOrigin) {
				if (confirm("나가시면 변경 사항을 잃게됩니다. 정말 나가시겠습니까?") == true) {
					$(".container-setting").remove();
					$(".container_none").show();
				} else {
					return false;
				}
			}
		}

		// 프로필 수정
		function profileUpdate() {

			if ($("#m_name").val() == "") {
				alert("닉네임을 입력해주세요");
			} else if ($("#bio").val() == "") {
				alert("바이오를 입력해주세요");
			} else if ($("#title").val() == "") {
				alert("타이틀을 입력해주세요");
			} else {
				var m_pic = $('input[name="chooseFile"]').get(0).files[0];
				var params = $('#User_setting').serialize();

				var formData = new FormData($("#User_setting")[0]);

				if (m_pic != undefined) {
					console.log("사진 변경");
					formData.append("uploadFile", $("#chooseFile")[0].files[0]);
				} else {
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

		}

		// 모달 관련 함수
		function modalShow(target) {
			$('#myModal').modal('show');

			var id = target.id;
			console.log(id);

			// 인스타 클릭
			if (id == "icon_in") {
				$(".modal-title").text("INSTA");
				$(".modal_text").remove();
				if ("${social.insta}" == "N") {
					$(".modal-body")
							.append(
									'<input type="text" class="modal_text" name="insta" id="modal_insta" placeholder ="주소를 입력해주세요">');
				} else {
					$(".modal-body")
							.append(
									'<input type="text" class="modal_text" name="insta" id="modal_insta" value="${social.insta }" placeholder ="주소를 입력해주세요">');
				}
			} else if (id == "icon_git") {
				$(".modal-title").text("GITHUB");
				$(".modal_text").remove();
				if ("${social.git}" == "N") {
					$(".modal-body")
							.append(
									'<input type="text" class="modal_text" name="git" id="modal_github" placeholder ="주소를 입력해주세요">');
				} else {
					$(".modal-body")
							.append(
									'<input type="text" class="modal_text" name="git" id="modal_github" value="${social.git }" placeholder ="주소를 입력해주세요">');
				}
			} else if (id == "icon_twi") {
				$(".modal-title").text("TWITTER");
				$(".modal_text").remove();
				if ("${social.twitter}" == "N") {
					$(".modal-body")
							.append(
									'<input type="text" class="modal_text" name="twitter" id="modal_twitter" placeholder ="주소를 입력해주세요">');
				} else {
					$(".modal-body")
							.append(
									'<input type="text" class="modal_text" name="twitter" id="modal_insta" value="${social.twitter }" placeholder ="주소를 입력해주세요">');
				}
			} else if (id == "icon_fb") {
				$(".modal-title").text("FACEBOOK");
				$(".modal_text").remove();
				if ("${social.facebook}" == "N") {
					$(".modal-body")
							.append(
									'<input type="text" class="modal_text" name="facebook" id="modal_facebook" placeholder ="주소를 입력해주세요">');
				} else {
					$(".modal-body")
							.append(
									'<input type="text" class="modal_text" name="facebook" id="modal_facebook" value="${social.facebook }" placeholder ="주소를 입력해주세요">');
				}
			}

		}

		function PostModalShow() {
			$('#myPostModal').modal('show');
			$("#PostCreate").remove();
			$("#myPostModalLabel").text("글 작성");

			$(".Postmodal-body")
					.append(
							'<form id="PostCreate"><input type="hidden" name="post_writer" id="post_writer" value="${userInfo.m_name}"><input type="hidden" name="m_idx" id="m_idx" value="${userInfo.m_idx}"><div class="PostHead">글 제목<input type="text" class="Postmodal_Head" name="post_title" id="post_title" placeholder ="글 제목"><input type="file" name="file" multiple id="input_file" onchange="fileCheck(this)" style="width:100%;"><span style="font-size:10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span><div class="data_file_txt" id="data_file_txt"><span>첨부 파일</span><div id="articlefileChange"></div></div></div><div class="PostContent"><textarea cols="50" rows="15" name="post_content" id="post_content" placeholder="글 내용을 입력하세요"></textarea></div>');

		}

		function PostmodalCheck() {

			//var params = $('').serialize();
			var form = $("#PostCreate")[0];        
		 	var formData = new FormData(form);
			
			for (var x = 0; x < content_files.length; x++) {
				// 삭제 안한것만 담아 준다. 
				if(!content_files[x].is_delete){
					formData.append("article_file", content_files[x]);
				}
			}

			
			
			if ($(".Postmodal_Head").val() == "") {
				alert("제목을 입력하세요");
			} else if ($("#post_content").val() == "") {
				alert("내용을 입력하세요");
			} else {
				console.log("글 전송");
				$.ajax({
					url : '/user/postCreate',
					processData : false, // 이 둘은 무조건 false로 해야 전송이 된다.
					contentType : false,
					data : formData,
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						console.log(result);
						location.reload();
					}
				});
			}
		}

		function modalHide() {
			$('#myModal').modal('hide');
			$("#myPostModal").modal("hide");
		}

		function modalCheck() {

			var insta = $("#modal_insta").val();
			var git = $("#modal_github").val();
			var twitter = $("#modal_twitter").val();
			var facebook = $("#modal_facebook").val();

			console.log(insta);
			console.log(git);
			console.log(twitter);
			console.log(facebook);

			// 변경된거 hidden에 넣기
			if (insta == "") {
				$("#insta").val("N");
			} else if (insta != undefined) {
				$("#insta").val(insta);
			}

			if (git == "") {
				$("#git").val("N");
			} else if (git != undefined) {
				$("#git").val(git);
			}

			if (twitter == "") {
				$("#twitter").val("N");
			} else if (twitter != undefined) {
				$("#twitter").val(twitter);
			}

			if (facebook == "") {
				$("#facebook").val("N");
			} else if (facebook != undefined) {
				$("#facebook").val(facebook);
			}

			$('#myModal').modal('hide');
		}
		
		function PostEdit(p_idx){
			
			var title = $("#title_"+p_idx).val();
			var content = $("#content_"+p_idx).val();
			var p_idx = p_idx;
			
			console.log(title);
			
			$('#postModalBtn').attr("onclick", "PostmodalEdit();");
			
			$("#myPostModal").modal("show");
			$(".PostEdit").remove();
			$("#PostCreate").remove();
			$("#myPostModalLabel").text("글 수정");

			$(".Postmodal-body")
					.append(
							'<form class="PostEdit"><input type="hidden" name="p_idx" id="p_idx" value="'+p_idx+'"><input type="hidden" name="m_idx" id="m_idx" value="${userInfo.m_idx}"><div class="PostHead">글 제목<input type="text" class="Postmodal_Head" name="post_title" id="post_title" placeholder ="'+title+'"><input type="file" name="file" multiple id="input_file" onchange="fileCheck(this)" style="width:100%;"><span style="font-size:10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>'
							+'<div class="data_file_txt" id="data_file_txt"><span>첨부 파일</span><div id="articlefileChange">'
							+'</div><div class="PostContent"><textarea cols="50" rows="15" name="post_content" id="post_content" placeholder="'+content+'"></textarea></div>');

			
			<c:forEach items="${attach}" var="Att_img">
				if(p_idx == ${Att_img.p_idx}){
					$('#articlefileChange').append(
							'<div id="file' + ${Att_img.a_idx} + '" onclick="fileEdit(\'file' + ${Att_img.a_idx} + '\')">'
		       				+ '<font style="font-size:12px">' + "${Att_img.a_Origin}" + '</font>'  
		       				+ '<img src="${pageContext.request.contextPath}/resources/assets/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
		       				+ '<div/>');
				}
			</c:forEach>
			
			
			
			$('#articlefileChange').append(
       				'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
       				+ '<font style="font-size:12px">' + f.name + '</font>'  
       				+ '<img src="${pageContext.request.contextPath}/resources/assets/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
       				+ '<div/>'
				);
			
		}
		
		function PostmodalEdit() {

			var form = $("#PostEdit")[0];        
		 	var formData = new FormData(form);
			
			for (var x = 0; x < content_files.length; x++) {
				// 삭제 안한것만 담아 준다. 
				if(!content_files[x].is_delete){
					formData.append("article_file", content_files[x]);
				}
			}
			
			console.log(formData);


			if ($(".Postmodal_Head").val() == "") {
				alert("제목을 입력하세요");
			} else if ($("#post_content").val() == "") {
				alert("내용을 입력하세요");
			} else {
				console.log("글 전송");
// 				$.ajax({
// 					url : '/user/postEdit',
// 					processData : false, // 이 둘은 무조건 false로 해야 전송이 된다.
// 					contentType : false,
// 					data : formData,
// 					type : "POST",
// 					dataType : "json",
// 					async : false,
// 					success : function(result) {
// 						console.log(result);
// 						location.reload();
// 					}
// 				});
			}
		}
		
		function PostDel(p_idx){
			
			if (confirm("글을 삭제하시겠습니까?") == true) {
				$.ajax({
					url : '/user/postDel',
					data : {p_idx : p_idx},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						alert("삭제되었습니다.");
						location.reload();
					}
				});
			} else {
				return false;
			}
			
		}
		
		
		
		
		// 글 다중 첨부파일
		function fileCheck(input) {
			
    		var files = input.files;
    
    		// 파일 배열 담기
    		var filesArr = Array.prototype.slice.call(files);
    		console.log("파일체크함수");
    		console.log(files);
    
   		 	// 파일 개수 확인 및 제한
    		if (fileCount + filesArr.length > totalCount) {
      			$.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
      			return;
    		} else {
    	 		fileCount = fileCount + filesArr.length;
    		}
    
    		// 각각의 파일 배열담기 및 기타
    		filesArr.forEach(function (f) {
     		var reader = new FileReader();
      		reader.onload = function (e) {
        		content_files.push(f);
        		$('#articlefileChange').append(
       				'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
       				+ '<font style="font-size:12px">' + f.name + '</font>'  
       				+ '<img src="${pageContext.request.contextPath}/resources/assets/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
       				+ '<div/>'
				);
        		fileNum ++;
      		};
      		reader.readAsDataURL(f);
    		});
   		 console.log(content_files);
    		//초기화 한다.
    		$("#input_file").val("");
  		}
		
		// 파일 부분 삭제 함수
		function fileDelete(fileNum){
		    var no = fileNum.replace(/[^0-9]/g, "");
		    content_files[no].is_delete = true;
			$('#' + fileNum).remove();
			fileCount --;
		    console.log(content_files);
		    console.log(fileCount);
		}
		
		function fileEdit(fileNum){
			var no = fileNum.replace(/[^0-9]/g, "");
			$('#' + fileNum).remove();
			fileCount --;
		    console.log(content_files);
		    console.log(fileCount);
		}
		
		$(document)
				.ready(
						function() {
							
							var Post_Midx = $("#post_m_idx").val();
							
							console.log(Post_Midx);

// 							if(${userInfo.m_idx} == Post_Midx){
// 								$("#postBtn").css("display", "inline-block");
// 							}

							//버튼 클릭 시 왼쪽으로 스크롤
							$(document).on("click", ".ScrollUp", function() {
								console.log("위쪽으로 이동");
								var _scrollY = $('#postList').scrollTop();
								console.log(_scrollY);
								$('#postList').scrollTop(_scrollY - 500);

							});

							//버튼 클릭 시 오른으로 스크롤
							$(document).on("click", ".ScrollDown", function() {

								console.log("아래쪽으로 이동");
								var _scrollY = $('#postList').scrollTop();
								console.log(_scrollY);
								$('#postList').scrollTop(_scrollY + 500);

							});

							$('#sideNav').css("background-color",
									"${userInfo.bgcolor}");

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
							$("#nav_setting")
									.on(
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
																"<div class='container-setting'><section class='resume-section'><div class='resume-section-content'><form id='User_setting' accept-charset='utf-8'><input type='hidden' name='m_idx' id='m_idx' value='${userInfo.m_idx}'><input type='hidden' name='bgcolor' id='bgcolor' value='${userInfo.bgcolor}'><div class='container_pic'><label for='chooseFile' id='picInfo'><img class='propic' src='/UserImage/${userInfo.m_pic}'></label><input type='file' class='filebox' id='chooseFile' name='chooseFile' accept='image/*' onchange='picUpdate(this)'><input type='hidden' name='m_picOrigin' id='m_picOrigin' value='${userInfo.m_pic}'><span class='UserVerify'>미인증 회원입니다. 인증 후 설정 가능합니다.</span></div><div class='container-user'><div>닉네임 <input type='text' class='user_pro' name='m_name' id='m_name' value='${userInfo.m_name}'></div><div> 바이오 <input type='text' class='user_pro' name='bio' id='bio' value='${userInfo.bio}'></div><div>타이틀<input type='text' class='user_pro' name='title' id='title' value='${userInfo.title}'></div><div>SNS 연결<div class='user_sns'><input type='hidden' name='insta' id='insta' value='${social.insta}'><input type='hidden' name='git' id='git' value='${social.git}'><input type='hidden' name='twitter' id='twitter' value='${social.twitter}'><input type='hidden' name='facebook' id='facebook' value='${social.facebook}'><i class='fab fa-linkedin-in' id='icon_in' onclick='modalShow(this);'></i><i class='fab fa-github' id='icon_git' onclick='modalShow(this);'></i><i class='fab fa-twitter' id='icon_twi' onclick='modalShow(this);'></i><i class='fab fa-facebook-f' id='icon_fb' onclick='modalShow(this);'></i></div></div></div>"
																		+ "<div class='container-color'>색상 변경<div id='palletBox' class='pallet'></div><button type='button' class='profile_update' onclick='profileUpdate();'>수정하기</button><button type='button' class='profile_delete'>탈퇴하기</button></form></div></section></div>");

												if ("${userInfo.verify}" == "N") {
													$('.UserVerify').css(
															"display",
															"inline-block");

													var input = document
															.getElementsByClassName("user_pro");
													$('.user_pro').attr(
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
