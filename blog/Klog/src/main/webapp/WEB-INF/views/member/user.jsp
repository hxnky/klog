<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			class="d-block d-lg-none">${pageInfo.m_name }</span> <span
			class="d-none d-lg-block"><c:set var="loginType"
					value="${pageInfo.loginType }"></c:set> <c:if
					test="${loginType eq 'email'}">
					<img class="img-fluid img-profile rounded-circle mx-auto mb-2"
						src="/UserImage/${pageInfo.m_pic}" alt="..." />
				</c:if> <c:if test="${loginType eq 'google'}">
					<img class="img-fluid img-profile rounded-circle mx-auto mb-2"
						src="${pageInfo.m_pic}" alt="..." />
				</c:if></span>
		</a>
		<div id="SearchDiv">
			<input type="text" id="Search" placeholder="내 글 검색"><img
				src="${pageContext.request.contextPath}/resources/assets/img/Search.png"
				onclick="SearchMy();">
		</div>
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
					id="nav_notice" onclick="NoticeModal(${userInfo.m_idx});">Notice</a></li>
				<!-- 내 페이지면 setting 아니면 내 페이지로 가는 링크 -->
				<fmt:formatNumber value="${userInfo.m_idx }" type="number"
					var="m_idx" />
				<fmt:formatNumber value="${pageInfo.m_idx }" type="number"
					var="pm_idx" />
				<c:if test="${m_idx == pm_idx }">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						id="nav_setting">Setting</a></li>
				</c:if>
				<c:if test="${m_idx != pm_idx }">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="/mainPage/${userInfo.email}" id="nav_setting">ToMyPage</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					id="nav_logout" href="/user/logout">Logout</a></li>
			</ul>
		</div>
	</nav>
	<!-- Page Content-->
	<div class="container-fluid p-0">
		<div class="container_none">
			<div id="SearchUser">
				<input type="text" id="UserSearch" placeholder="유저검색"><img
					src="${pageContext.request.contextPath}/resources/assets/img/Search.png"
					onclick="SearchUser();">
			</div>
			<!-- About-->
			<section class="resume-section" id="profile">
				<div class="resume-section-content">
					<h1 class="mb-0" id="custom_title">${pageInfo.title }</h1>
					<div class="subheading mb-5">
						${pageInfo.m_name} <a href="mailto:name@email.com">${pageInfo.email }</a>
					</div>
					<p class="lead mb-5">${pageInfo.bio }</p>
					<div class="social-icons">
						<a class="social-icon" id="social_in" href="${pageSocial.insta}"><i
							class="fab fa-linkedin-in"></i></a> <a class="social-icon"
							id="social_git" href="${pageSocial.git}"><i
							class="fab fa-github"></i></a> <a class="social-icon" id="social_twi"
							href="${pageSocial.twitter}"><i class="fab fa-twitter"></i></a> <a
							class="social-icon" id="social_fb" href="${pageSocial.facebook}"><i
							class="fab fa-facebook-f"></i></a>
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
							<c:if test="${ fn:length(post) == 0}">
								<div>작성된 글이 없습니다.</div>
							</c:if>
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
										<div
											class="d-flex flex-column flex-md-row justify-content-between"
											id="AttachImg"></div>
										</p>

									</div>
									<div class="flex-shrink-0">
										<span class="text-primary"><fmt:formatDate
												value="${list.post_updatetime}" pattern="yyyy-MM-dd" /></span>

										<fmt:formatNumber value="${userInfo.m_idx}" type="number"
											var="mIdx" />
										<fmt:formatNumber value="${pageInfo.m_idx}" type="number"
											var="pIdx" />
										<c:choose>
											<c:when test="${m_idx != pIdx}">
												<div id="postBtn">
													<button type="button" id="ScrapBtn"
														onclick="PostScrap(${list.p_idx });">스크랩</button>
												</div>
											</c:when>
										</c:choose>

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
			<!-- 안부글-->
			<section class="resume-section" id="letter">
				<div class="resume-section-content">
					<h2 class="mb-5">Letter</h2>
					<c:if test="${ fn:length(letterList) == 0}">
						<div>안부글이 없습니다.</div>
					</c:if>
					<c:forEach items="${letterList}" var="letter">
						<div
							class="d-flex flex-column flex-md-row justify-content-between">
							<c:set var="member" value="${letter.member}" />

							<div id="letter_img">
								<c:set var="mainEmail" value="${userInfo.email }" />
								<c:set var="letterEmail" value="${member.email }" />
								<c:choose>
									<c:when test="${ mainEmail eq letterEmail}">
										<a href="/mainPage/${member.email }"> <c:set
												var="loginType" value="${member.loginType }"></c:set> <c:if
												test="${loginType eq 'email'}">
												<img src="/UserImage/${member.m_pic }">
											</c:if> <c:if test="${loginType eq 'google'}">
												<img src="${member.m_pic }">
											</c:if>
										</a>
									</c:when>
									<c:when test="${ mainEmail ne letterEmail}">

										<a href="/userPage/${member.email }"> <c:set
												var="loginType" value="${member.loginType }"></c:set> <c:if
												test="${loginType eq 'email'}">
												<img src="/UserImage/${member.m_pic }">
											</c:if> <c:if test="${loginType eq 'google'}">
												<img src="${member.m_pic }">
											</c:if>
										</a>
									</c:when>
								</c:choose>

							</div>
							<div class="flex-grow-1">
								<h3 class="mb-0 letterContentBox"
									id="letterContent${letter.l_idx }">
									<input type="text" class="l_content${letter.l_idx }"
										id="LetterContent"
										value="<c:out value='${letter.l_content }' />"
										disabled="disabled"> <input type="hidden"
										class="w_idx${letter.l_idx }"
										value="<c:out value='${letter.w_idx }' />"> <input
										type="hidden" class="o_idx${letter.l_idx }"
										value="<c:out value='${letter.o_idx }' />">
								</h3>
								<p>
									<c:out value="${member.m_name }" />
								</p>
								<p>
									<button type="button" class="LetterReplyBtn"
										onclick="ReplyStart(${letter.l_idx },${letter.w_idx });">답글달기</button>
								</p>
							</div>
							<div class="flex-shrink-0" id="letterEditBtn">
								<span class="text-primary"><fmt:formatDate
										pattern="yyy-MM-dd" value="${letter.l_time}" /></span>
								<fmt:formatNumber value="${userInfo.m_idx}" type="number"
									var="mIdx" />
								<fmt:formatNumber value="${pageInfo.m_idx}" type="number"
									var="pIdx" />
								<fmt:formatNumber value="${letter.w_idx }" type="number"
									var="wIdx" />
								<fmt:formatNumber value="${letter.o_idx }" type="number"
									var="oIdx" />
								<c:if test="${mIdx == wIdx}">
									<button type="button" class="letterEdit${letter.l_idx }"
										id="letterEdit" onclick="LetterUpdate(${letter.l_idx });">수정</button>
									<button type="button" class="letterDel"
										onclick="LetterDelete(${letter.l_idx });">삭제</button>
								</c:if>
								<c:if test="${mIdx == oIdx and wIdx != oIdx }">
									<button type="button" class="letterDel"
										onclick="LetterDelete(${letter.l_idx });">삭제</button>
								</c:if>
							</div>

						</div>

						<c:forEach items="${letterReplyList}" var="letterReply">
							<div
								class="d-flex flex-md-row justify-content-between letterReplyBox">
								<div class="letterReply" id="letterReply${letter.l_idx }"></div>
							</div>

							<c:set var="memberInfo" value="${letterReply.memberInfo}" />
							<fmt:formatNumber value="${letter.l_idx }" type="number"
								var="lIdx" />
							<fmt:formatNumber value="${letterReply.l_idx }" type="number"
								var="lrIdx" />
							<c:if test="${lIdx == lrIdx}">
								<div
									class="d-flex flex-md-row justify-content-between letterReplyBox">
									<div id="letterReply_img">
										<c:set var="mainEmail" value="${userInfo.email }" />
										<c:set var="letterEmail" value="${memberInfo.email }" />
										<c:choose>
											<c:when test="${ mainEmail eq letterEmail}">
												<a href="/mainPage/${memberInfo.email }"> <c:set
													var="loginType" value="${memberInfo.loginType }"></c:set> <c:if
													test="${loginType eq 'email'}">
													<img src="/UserImage/${memberInfo.m_pic }">
												</c:if> <c:if test="${loginType eq 'google'}">
													<img src="${memberInfo.m_pic }">
												</c:if>
											</a>
											</c:when>
											<c:when test="${ mainEmail ne letterEmail}">
												<a href="/userPage/${memberInfo.email }"><c:set
												var="loginType" value="${memberInfo.loginType }"></c:set> <c:if
												test="${loginType eq 'email'}">
												<img src="/UserImage/${memberInfo.m_pic }">
											</c:if> <c:if test="${loginType eq 'google'}">
												<img src="${memberInfo.m_pic }">
											</c:if></a>
											</c:when>
										</c:choose>
									</div>
									<div class="flex-grow-1">
										<!-- 답글자리	 -->
										<h3 class="mb-0 letterReplyContentBox"
											id="letterReplyContent${letterReply.lr_idx }">
											<input type="text" class="lr_content${letterReply.lr_idx }"
												id="LetterContent"
												value="<c:out value='${letterReply.lr_content }' />"
												disabled="disabled"> <input type="hidden"
												class="rw_idx${letterReply.lr_idx }"
												value="<c:out value='${letterReply.rw_idx }' />"> <input
												type="hidden" class="ro_idx${letterReply.lr_idx }"
												value="<c:out value='${letterReply.ro_idx }' />">
										</h3>
										<p>
											<c:out value="${memberInfo.m_name }" />
										</p>

									</div>
									<div class="flex-shrink-0">
										<fmt:formatDate pattern="yyy-MM-dd"
											value="${letterReply.lr_time}" />
										<fmt:formatNumber value="${letterReply.rw_idx }" type="number"
											var="rwIdx" />
										<fmt:formatNumber value="${letterReply.ro_idx }" type="number"
											var="roIdx" />
										<c:if test="${mIdx == rwIdx}">
											<button type="button"
												class="letterReplyEdit${letterReply.lr_idx }"
												id="letterReplyEdit"
												onclick="LetterReplyUpdate(${letterReply.lr_idx });">수정</button>
											<button type="button" class="letterReplyDel"
												onclick="LetterReplyDelete(${letterReply.lr_idx });">삭제</button>
										</c:if>
										<c:if test="${mIdx == roIdx and rwIdx != roIdx }">
											<button type="button" class="letterReplyDel"
												onclick="LetterReplyDelete(${letterReply.lr_idx });">삭제</button>
										</c:if>
									</div>

									<div class="letterReply" id="letterReply${letter.l_idx }"></div>
								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
					<form class="letterForm">
						<div
							class="d-flex flex-column flex-md-row justify-content-between mb-5">

							<div class="flex-grow-1" id="letterBox">
								<input type="text" name="l_content" id="l_content"
									placeholder="안부글 작성하기">
							</div>
							<div class="flex-shrink-0">
								<button type="button" class="letterBtn"
									onclick="LetterInsert(${userInfo.m_idx},${pageInfo.m_idx});">확인</button>
							</div>

						</div>
					</form>
				</div>

			</section>
			<hr class="m-0" />
			<!-- 이웃-->
			<section class="resume-section" id="neighbor">
				<div class="resume-section-content">
					<h2 class="mb-5">NEIGHBOR</h2>
					<fmt:formatNumber value="${userInfo.m_idx }" type="number"
						var="m_idx" />
					<fmt:formatNumber value="${pageInfo.m_idx }" type="number"
						var="pm_idx" />
					<c:if test="${m_idx == pm_idx }">
						<div class="subheading mb-3">이웃 신청 목록</div>
						<div
							class="d-flex flex-column flex-md-row justify-content-between mb-5"
							id="followChkList">
							<c:forEach items="${followList}" var="follow">
								<c:set var="member" value="${follow.member}" />

								<div class="flex-grow-1">
									<h3 class="mb-0">
										<a href="/userPage/${member.email}">${member.title}</a>
									</h3>
									<div class="subheading mb-3">${member.m_name}</div>
									<input type="hidden" id="followList_${follow.u_idx }"
										value="${follow.u_idx }"> <input type="hidden"
										id="y_idx" value="${follow.y_idx}">
									<div>${follow.ment}</div>
								</div>
								<div class="flex-shrink-0">
									<span class="text-primary"><fmt:formatDate
											pattern="yyy-MM-dd" value="${follow.n_date }" /></span>
									<div>
										<button type="button" class="FollowOk"
											onclick="FollowOK(${follow.u_idx}, ${follow.y_idx});">확인</button>
										<button type="button" class="FollowNo"
											onclick="FollowNO(${follow.u_idx}, ${follow.y_idx});">삭제</button>
									</div>
								</div>

							</c:forEach>
						</div>
					</c:if>
					<div class="subheading mb-3" id="followListSort">
						이웃 목록<select name="SelectEach" id="SelectEach"
							onchange="selectBox(this)">
							<option value="none">----</option>
							<option value="Each">서로 이웃</option>
							<option value="noEach">이웃</option>
						</select>
					</div>

					<div class="d-flex flex-column justify-content-between mb-5"
						id="followList">

						<c:forEach items="${neighbor}" var="nei">
							<c:set var="mem" value="${nei.member}" />
							<div class="${nei.eachother}" id="neiList_${mem.m_idx }">
								<div class="flex-grow-1" id="neiInfo">
									<h3 class="mb-0">
										<c:set var="neiEmail" value="${mem.email}" />
										<c:set var="userEmail" value="${userInfo.email}" />
										<c:choose>
											<c:when test="${neiEmail eq userEmail }">
												<a href="/mainPage/${mem.email}">${mem.title}</a>
											</c:when>
											<c:when test="${neiEmail ne userEmail }">
												<a href="/userPage/${mem.email}">${mem.title}</a>
											</c:when>
										</c:choose>
									</h3>
									<div class="subheading mb-3">${mem.m_name}</div>
									<input type="hidden" class="n_chk${mem.m_idx }"
										value="${nei.n_check}">
								</div>
								<div class="flex-shrink-0" id="neiType">
									<c:if test="${nei.eachother eq 'N' }">
										<span class="text-primary" id="FollowType">이웃</span>
										<button type="button" class="FollowBtn"
											onclick="noEachfollow(${nei.u_idx}, ${nei.y_idx});">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/follow.png">
										</button>
									</c:if>
									<c:if test="${nei.eachother eq 'Y' }">
										<span class="text-primary" id="FollowType">서로이웃</span>
										<button type="button" class="FollowBtn"
											onclick="Eachfollow(${nei.u_idx}, ${nei.y_idx});">
											<img
												src="${pageContext.request.contextPath}/resources/assets/img/follow.png">
										</button>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
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

			<hr class="m-0" />
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
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="modalHide();">취소</button>
						<button type="button" class="btn btn-primary" id="postModalBtn"
							onclick="PostmodalCheck();">확인</button>
					</div>
				</div>
			</div>
		</div>


		<!-- 이웃 신청 모달 -->
		<div class="modal fade" id="myFollowModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close" onclick="modalHide();">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myPostModalLabel">이웃 신청</h4>
					</div>
					<div class="Followmodal-body"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							onclick="modalHide();">취소</button>
						<button type="button" class="btn btn-primary" id="FollowModalBtn"
							onclick="FollowmodalCheck();">확인</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 알림 모달 -->
		<div class="modal fade" id="myAlarmModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="AlarmModal-header">
						<div>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close" onclick="modalHide();">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<h4 class="modal-title" id="myAlarmModalLabel">Notice</h4>
					</div>
					<div class="Alarmmodal-body"></div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>


		<!-- 알림 토스트 -->
		<div id="msgStack"></div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
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
		// 기존 첨부파일 배열
		var attach_files = new Array();
		// 알림
		var socket = null;
		
		// 알람 가져오기
		function SocketConnect(){
			
			
			sock = new SockJS("<c:url value="/echo"/>");
			socket = sock;
			
			sock.onopen = function(){
				console.log("info : connection opend");
			}
			
			sock.onmessage = onMessage;
			
		}
		
		// 실시간 메세지 도착 시 토스트로 보여준다
		function onMessage(evt){
			var data = evt.data;
			console.log("ReceiveMessage ::: " + data + "\n");
			
			var toast = '<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">';
			toast += '<div class="toast" role="alert" aria-live="assertive" aria-atomic="true">';
			toast += '<div class="toast-header"><strong class="me-auto">Notice</strong>';
		    toast += '<small>just now</small><button type="button" class="btn-close" data-dismiss="toast" aria-label="Close"></button>';
		    toast += "</div> <div class='toast-body'>" + data + "</div></div></div>";
		    $("#msgStack").append(toast);
		    //$(".toast").toast({"animation":true, "autohide" : false});
		    $(".toast").toast("show");
			
			
		}

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
							'<form id="PostCreate"><input type="hidden" name="post_writer" id="post_writer" value="${pageInfo.m_name}"><input type="hidden" name="m_idx" id="m_idx" value="${pageInfo.m_idx}"><div class="PostHead">글 제목<input type="text" class="Postmodal_Head" name="post_title" id="post_title" placeholder ="글 제목"><input type="file" name="file" multiple id="input_file" onchange="fileCheck(this)" style="width:100%;"><span style="font-size:10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span><div class="data_file_txt" id="data_file_txt"><span>첨부 파일</span><div id="articlefileChange"></div></div></div><div class="PostContent"><textarea cols="50" rows="15" name="post_content" id="post_content" placeholder="글 내용을 입력하세요"></textarea></div>');

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
			$("#myFollowModal").modal("hide");
			$("#myAlarmModal").modal("hide");
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
							'<form class="PostEdit"><input type="hidden" name="p_idx" id="p_idx" value="'+p_idx+'"><input type="hidden" name="m_idx" id="m_idx" value="${pageInfo.m_idx}"><div class="PostHead">글 제목<input type="text" class="Postmodal_Head" name="post_title" id="post_title" value ="'+title+'"><input type="file" name="file" multiple id="input_file" onchange="fileCheck(this)" style="width:100%;"><span style="font-size:10px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>'
							+'<div class="data_file_txt" id="data_file_txt"><span>첨부 파일</span><div id="articlefileChange">'
							+'</div><div class="PostContent"><textarea cols="50" rows="15" name="post_content" id="post_content">'+content+'</textarea></div>');

			<!-- 첨부파일 목록 -->
			<c:forEach items="${attach}" var="Att_img">
				if(p_idx == ${Att_img.p_idx}){
					attach_files.push("${Att_img.a_Origin}");
					console.log(attach_files);
					$('#articlefileChange').append(
							'<div id="file' + ${Att_img.a_idx} + '" " onclick="fileEdit(\'file' + ${Att_img.a_idx} + '\')">'
							+ '<input type="hidden" id="Original_file'+${Att_img.a_idx}+'" value="${Att_img.a_Origin}">'
		       				+ '<font style="font-size:12px">' + "${Att_img.a_Origin}" + '</font>'  
		       				+ '<img src="${pageContext.request.contextPath}/resources/assets/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
		       				+ '<div/>');
				}
			</c:forEach>
			
			fileCount = $("#articlefileChange").children().length; 
			console.log("원래 첨부파일 개수"+fileCount); //3

		}
		
		function PostmodalEdit() {

			var form = $(".PostEdit")[0];        
		 	var formData = new FormData(form);
		 	
		 	
		 	
		 	formData.append("AttachOrigin", attach_files);
			
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
				$.ajax({
					url : '/user/postEdit',
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
			
			console.log(fileNum);
			
			var FileName = $("#Original_"+fileNum).val();
			console.log(FileName);
			
			var no = fileNum.replace(/[^0-9]/g, "");
			$('#' + fileNum).remove();
			fileCount --;

			
			for(var i=0; i<attach_files.length; i++){
				if(attach_files[i] == FileName){
					console.log("삭제된 파일 이름" + FileName);
					attach_files.splice(i, 1);
					i--;
				}
			}
			console.log(attach_files);
		}
		
		// 내 글 검색
		function SearchMy(){
			var m_idx = $("#post_m_idx").val();
			var word = $("#Search").val();
			if(word == ""){
				alert("검색어를 입력해주세요");
			} else{
				$.ajax({
					url : '/user/SearchMyPost',
					data : {word : word,
							m_idx : m_idx
							},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						
						
						
						$(".container_none").hide();
						$("#searchResult").remove();
						$("#backImg").remove();
						$(".container-fluid").append("<img id='backImg' src='/resources/assets/img/left.png' onclick='ResetPage();'><div id='SearchUser'><input type='text' id='UserSearch' placeholder='유저검색'><img src='/resources/assets/img/Search.png'onclick='SearchUser();''></div><section class='resume-section' id='searchResult'><div class='resume-section-content'><h2 class='mb-5'>검색결과</h2>"
								+"<div id='SearchList'></div></div></section>");
						
						if(result.length == 0){
							$("#SearchList").append("<div class='no_Search'>검색 결과가 없습니다.</div>");
							}

						for(var i=0; i<result.length; i++){
							var attach = result[i].attach;
							var updateTime = result[i].post_updatetime;
							var realTime = new Date(updateTime);
							var year = realTime.getFullYear();
							var month = realTime.getMonth() + 1;
							var day = realTime.getDate();
							
							$("#SearchList").append("<div class='d-flex flex-column flex-md-row justify-content-between mb-5'><div class='flex-grow-1'><button class='content-toggler' type='button' data-bs-toggle='collapse' data-bs-target='#Searchcollapse_"+result[i].p_idx+"' aria-controls='Searchcollapse_"+result[i].p_idx+"' aria-expanded='false'>"                  
			                        				+"<h3 class='mb-0' data-toggle='collapse'><input type='text' class='postText' id='title_"+result[i].p_idx+"' value='"+result[i].post_title+"'></h3></button><div class='subheading mb-3'>"+result[i].post_writer+"</div>"
													+"<p class='collapse' id='Searchcollapse_"+result[i].p_idx+"'><input type='text' class='postText' id='content_"+result[i].p_idx+"' value='"+result[i].post_content+"'></p>"
													+"<div class='AttachImg_"+result[i].p_idx+"' id='SearchImg'></div></div>"
													+"<div class='flex-shrink-0'><span class='text-primary'>"+year+"-"+month+"-"+day+"</span>"
													+"<div id='postBtn_"+result[i].p_idx+"'></div></div><input type='hidden' id='post_m_idx' value='"+result[i].m_idx+"'></div>"
													);


							if(${userInfo.m_idx} == result[i].m_idx){
								$("#postBtn_"+result[i].p_idx).append("<button type='button' id='PostEdit' onclick='PostEdit("+result[i].p_idx+");'>수정</button><button type='button' id='PostDel' onclick='PostDel("+result[i].p_idx+");'>삭제</button>");
								}
							
		
							for(var j=0; attach.length; j++){
								console.log(result[i].p_idx);
								console.log(attach[j].p_idx);
							
								if(result[i].p_idx == attach[j].p_idx){
									$(".AttachImg_"+result[i].p_idx).append("<img src='/PostImage/"+attach[j].a_name+"'>");
								}
							}
							
						}
					}
				});
			}
		}
		
		// 유저, 유저 글 검색
		function SearchUser(){
			var word = $("#UserSearch").val();
			if(word == ""){
				alert("검색어를 입력해주세요");
			} else{
				$.ajax({
					url : '/user/SearchUser',
					data : {word : word
							},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						
						var member = result.member;
						var post = result.post;
						
						$(".container_none").hide();
						$("#searchResult").remove();
						$("#backImg").remove();
						$("#SearchUser").remove();
						$(".container-fluid").append("<img id='backImg' src='/resources/assets/img/left.png' onclick='ResetPage();'><div id='SearchUser'><input type='text' id='UserSearch' placeholder='유저검색'><img src='/resources/assets/img/Search.png'onclick='SearchUser();''></div>"
								+"<section class='resume-section' id='searchResult'><div class='resume-section-content'><h4 class='mb-5'>유저 검색결과</h4>"
								+"<div id='UserList'></div><hr><h4 class='mb-5'>글 검색결과</h4><div id='SearchList'></div></div></section>");
						
						if(post.length == 0){
							$("#SearchList").append("<div class='no_Result'>검색 결과가 없습니다.</div>");
						}else {
							for(var i=0; i<post.length; i++){
								
								var m_idx = ${userInfo.m_idx};
								var attach = post[i].attach;
								var updateTime = post[i].post_updatetime;
								var realTime = new Date(updateTime);
								var year = realTime.getFullYear();
								var month = realTime.getMonth() + 1;
								var day = realTime.getDate();
								
								$("#SearchList").append("<div class='d-flex flex-column flex-md-row justify-content-between mb-5'><div class='flex-grow-1'><button class='content-toggler' type='button' data-bs-toggle='collapse' data-bs-target='#Searchcollapse_"+post[i].p_idx+"' aria-controls='Searchcollapse_"+post[i].p_idx+"' aria-expanded='false'>"                  
				                        				+"<h3 class='mb-0' data-toggle='collapse'><input type='text' class='postText' id='title_"+post[i].p_idx+"' value='"+post[i].post_title+"'></h3></button><div class='subheading mb-3'>"+post[i].post_writer+"</div>"
														+"<p class='collapse' id='Searchcollapse_"+post[i].p_idx+"'><input type='text' class='postText' id='content_"+post[i].p_idx+"' value='"+post[i].post_content+"'></p>"
														+"<div class='AttachImg_"+post[i].p_idx+"' id='SearchImg'></div></div>"
														+"<div class='flex-shrink-0'><span class='text-primary'>"+year+"-"+month+"-"+day+"</span>"
														+"<div id='postBtn_"+post[i].p_idx+"'></div></div><input type='hidden' id='post_m_idx' value='"+post[i].m_idx+"'></div>"
														);


								if(${userInfo.m_idx} == post[i].m_idx){
									$("#postBtn_"+post[i].p_idx).append("<button type='button' id='PostEdit' onclick='PostEdit("+post[i].p_idx+");'>수정</button><button type='button' id='PostDel' onclick='PostDel("+post[i].p_idx+");'>삭제</button>");
									}
							
			
								for(var j=0; attach.length; j++){
									console.log(post[i].p_idx);
									console.log(attach[j].p_idx);
								
									if(post[i].p_idx == attach[j].p_idx){
										$(".AttachImg_"+post[i].p_idx).append("<img src='/PostImage/"+attach[j].a_name+"'>");
									}
								}
								
							}
						}
	
						if(member.length == 0){
							$("#UserList").append("<div class='no_Result'>검색 결과가 없습니다.</div>");
						} else{
							for(var i=0; i<member.length; i++){
								$("#UserList").append("<div class='d-flex justify-content-between mb-5'><div><h3 class='mb-0' id='custom_title'><a href='/userPage/"+member[i].email+"'>"+member[i].title+"</a></h3>"
														+"<div class='subheading'>"+member[i].m_name+"<a class='a_search' href='mailto:"+member[i].email+"'>"+member[i].email+"</a></div>"
														+"<div class='SearchBio'></div></div><div class='flex-shrink-0' id='neiListIdx_"+member[i].m_idx+"'></div></div>"
								);
								
								if(member[i].bio != null){
									$(".SearchBio").append("<p class='Searchlead mb-5'>"+member[i].bio+"</p>");
								}
								
								var neiListIdx = $("#neiList_"+member[i].m_idx).val();
								
								if(neiListIdx == undefined){
									$("#neiListIdx_"+member[i].m_idx).append("<button type=button' class='FollowBtn' onclick='followStart("+${userInfo.m_idx}+", "+member[i].m_idx+");'>"
									+"<img src='${pageContext.request.contextPath}/resources/assets/img/follow.png'></button>");
								}
								
							}
						}
						
						
						
						

						
						
						
					}
				});
			}
		}
		
		function ResetPage(){
			$(".container_none").show();
			$("#searchResult").remove();
			$("#backImg").remove();
		}
		
		function FollowOK(u_idx, y_idx){
			
			var m_name = "${userInfo.m_name}";
			
			$.ajax({
				url : '/user/AlarmInsert',
				data : {"ac_idx" : u_idx,
						"ar_idx" : y_idx,
						type : "follow"
						},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
					if(socket){
						let socketMsg = "follow," + "이웃신청,"+ m_name;
						console.log("msgmsg : " + socketMsg);
						socket.send(socketMsg);
					}
				}
			});
			$.ajax({
				url : '/user/FollowOk',
				data : {u_idx : u_idx,
						y_idx : y_idx
						},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
					location.reload();
				}
			});
			
			
		}
		
		function FollowNO(u_idx, y_idx){
			$.ajax({
				url : '/user/FollowNo',
				data : {u_idx : u_idx,
						y_idx : y_idx
						},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
					location.reload();
				}
			});
		}
		
		function followStart(u_idx, y_idx){
			$('#FollowModalBtn').attr("onclick", "FollowmodalStart("+u_idx+", "+y_idx+");");
			
			$("#myFollowModal").modal("show");
			$(".FollowEdit").remove();
			$(".FollowCreate").remove();

			$(".Followmodal-body")
					.append("<div class='FollowCreate'><div class='selectFollow'><div class='FollowRadio'><input type='radio' name='Follow' value='FollowStart'>이웃 신청하기 </div><div class='FollowRadio'><input type='radio' name='Follow' value='EachFollowStart'>서로이웃 신청하기</div></div></div>");
		}
		
			function FollowmodalStart(u_idx, y_idx){
			
			var radioVal = $('input[name="Follow"]:checked').val();
			console.log(radioVal);
			console.log(u_idx);
			console.log(y_idx);
			
			if(radioVal == "FollowStart"){
				
				var m_name = "${userInfo.m_name}";
				
				$.ajax({
					url : '/user/AlarmInsert',
					data : {"ac_idx" : u_idx,
						"ar_idx" : y_idx,
							type : "follow"
							},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						if(socket){
							let socketMsg = "follow," + "이웃 신청,"+ m_name;
							console.log("msgmsg : " + socketMsg);
							socket.send(socketMsg);
						}
					}
				});
				
				$.ajax({
					url : '/user/FollowStart',
					data : {u_idx : u_idx,
						y_idx : y_idx
					},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						location.reload();	// 이게 아니라 다시 검색창으로
					}
				});
				
				
				
			} else if(radioVal == "EachFollowStart"){
				$('#FollowModalBtn').attr("onclick", "EachFollowStart("+u_idx+", "+y_idx+");");
				
				$(".FollowEdit").remove();
				$(".Followmodal-body").append("<div class='FollowEdit'><form class='FollowSubmit'><div><textarea cols='30' rows='5' name='ment' class='FollowMent' >우리 서로이웃해요 ~</textarea></div></form></div>");
				
			}
		}
		
		function noEachfollow(u_idx, y_idx){
			$('#FollowModalBtn').attr("onclick", "FollowmodalEdit("+u_idx+", "+y_idx+");");
			
			$("#myFollowModal").modal("show");
			$(".FollowEdit").remove();
			$("#FollowCreate").remove();

			$(".Followmodal-body")
					.append("<div class='FollowEdit'><div class='selectFollow'><div class='FollowRadio'><input type='radio' name='Follow' value='EachFollow'>서로이웃 신청하기 </div><div class='FollowRadio'><input type='radio' name='Follow' value='FollowDel'>이웃 취소하기</div></div></div>");
		}
		
		function Eachfollow(u_idx, y_idx){
			$('#FollowModalBtn').attr("onclick", "FollowmodalEdit("+u_idx+", "+y_idx+");");
			
			$("#myFollowModal").modal("show");
			$(".FollowEdit").remove();
			$("#FollowCreate").remove();

			$(".Followmodal-body")
					.append("<div class='FollowEdit'><div class='selectFollow'><div class='FollowRadio'><input type='radio' name='Follow' value='EachFollowChange'>서로이웃을 이웃으로 변경 </div><div class='FollowRadio'><input type='radio' name='Follow' value='EachFollowDel'>서로이웃과 이웃 모두 취소</div></div></div>");
		}
		
		function FollowmodalEdit(u_idx, y_idx){
			
			var radioVal = $('input[name="Follow"]:checked').val();
			console.log(radioVal);
			console.log(u_idx);
			console.log(y_idx);
			
			if(radioVal == "EachFollow"){
				
				$('#FollowModalBtn').attr("onclick", "EachFollowEdit("+u_idx+", "+y_idx+");");
				
				$(".FollowEdit").remove();
				$(".Followmodal-body").append("<div class='FollowEdit'><form class='FollowSubmit'><div><textarea cols='30' rows='5' name='ment' class='FollowMent' >우리 서로이웃해요 ~</textarea></div></form></div>");

				
			} else if(radioVal == "FollowDel"){
				$.ajax({
					url : '/user/FollowDel',
					data : {u_idx : u_idx,
						y_idx : y_idx
					},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						location.reload();
					}
				});
			} else if(radioVal == "EachFollowChange"){
				var m_name = "${userInfo.m_name}";
				$.ajax({
					url : '/user/AlarmInsert',
					data : {"ac_idx" : u_idx,
					"ar_idx" : y_idx,
							type : "Eachfollow"
							},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						if(socket){
							let socketMsg = "Eachfollow," + "서로이웃,"+ m_name;
							console.log("msgmsg : " + socketMsg);
							socket.send(socketMsg);
						}
					}
				});
				
				
				$.ajax({
					url : '/user/FollowChange',
					data : {u_idx : u_idx,
						y_idx : y_idx
					},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						location.reload();
					}
				});
				
				

			} else if(radioVal == "EachFollowDel"){
				$.ajax({
					url : '/user/EachFollowDel',
					data : {u_idx : u_idx,
						y_idx : y_idx
					},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						location.reload();
					}
				});
			}
		}
		
		function EachFollowEdit(u_idx, y_idx){		 	
			var ment = $(".FollowMent").val();
			
			var idxChk = $("#followList_" + y_idx).val();
			var nChk = $(".n_chk"+y_idx).val();
			console.log(idxChk);
			console.log(nChk);
			if(idxChk != undefined){
				alert("서로 이웃이 이미 신청되었습니다.목록을 확인해주세요");
				modalHide();
			} else if(nChk == "N"){
				alert("이미 신청을 보냈습니다.");
				modalHide();
			} else{
				var m_name = "${userInfo.m_name}";
				$.ajax({
					url : '/user/AlarmInsert',
					data : {"ac_idx" : u_idx,
						"ar_idx" : y_idx,
							type : "Eachfollow"
							},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						if(socket){
							let socketMsg = "Eachfollow," + "서로이웃,"+ m_name;
							console.log("msgmsg : " + socketMsg);
							socket.send(socketMsg);
						}
					}
				});
				
				$.ajax({
					url : '/user/FollowEach',
					data : {u_idx : u_idx,
						y_idx : y_idx,
						ment :ment
					},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						location.reload();
					}
				});
				
				
			}
			
		}
		
		function EachFollowStart(u_idx, y_idx){		 	
			var ment = $(".FollowMent").val();
			
			var idxChk = $("#followList_" + y_idx).val();
			var nChk = $(".n_chk"+y_idx).val();
			console.log(idxChk);
			console.log(nChk);
			if(idxChk != undefined){
				alert("서로 이웃이 이미 신청되었습니다.목록을 확인해주세요");
				modalHide();
			} else if(nChk == "N"){
				alert("이미 신청을 보냈습니다.");
				modalHide();
			} else{
				var m_name = "${userInfo.m_name}";
				$.ajax({
					url : '/user/AlarmInsert',
					data : {"ac_idx" :u_idx,
							"ar_idx" : y_idx,
							type : "Eachfollow"
							},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						if(socket){
							let socketMsg = "Eachfollow," + "서로이웃,"+ m_name;
							console.log("msgmsg : " + socketMsg);
							socket.send(socketMsg);
						}
					}
				});
				
				$.ajax({
					url : '/user/EachFollowStart',
					data : {u_idx : u_idx,
						y_idx : y_idx,
						ment :ment
					},
					type : "POST",
					dataType : "json",
					async : false,
					success : function(result) {
						location.reload();
					}
				});
				
				
			}
			
		}
		
		function selectBox(e){
			
			if(e.value == "Each"){
				$('.N').css("display", "none");
				$('.Y').css("display", "inline-block");
			} else if(e.value == "noEach"){
				$('.Y').css("display", "none");
				$('.N').css("display", "inline-block");
			} else if(e.value="none"){
				$('.Y').css("display", "inline-block");
				$('.N').css("display", "inline-block");
			}
		}
		
		function LetterInsert(w_idx, o_idx){
			
			var l_content = $("#l_content").val();	
			var m_name = "${userInfo.m_name}";
			$.ajax({
				url : '/user/AlarmInsert',
				data : {"ac_idx" : w_idx,
						"ar_idx" : o_idx,
						"type" : "letter",
						"content" : l_content
						},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
					console.log(result);
					if(socket){
						let socketMsg = "letter," + l_content +","+ m_name;
						console.log("msg : " + socketMsg);
						socket.send(socketMsg);
					}
				}
			});
			
			$.ajax({
				url : '/user/LetterInsert',
				data : {w_idx : w_idx,
						o_idx : o_idx,
						l_content : l_content
				},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
					location.reload();
				}
			});
			
			
			
			
			
		}
		
		function LetterUpdate(l_idx){
			
			var l_content = $(".l_content" + l_idx).val();
			
			$(".l_content" + l_idx).remove();
			$(".letterReplyContentBox").empty();
			
			$("#letterReplyContentBox"+l_idx).append("<input type='text' class='l_content"+l_idx+"' id='LetterContentUpdate' value='"+l_content+"'>");
			$('.letterEdit'+l_idx).attr("onclick", "LetterUpdateBtn("+l_idx+");");
																																	
		}
		
		function LetterUpdateBtn(l_idx){
			var l_content = $(".l_content" + l_idx).val();
			
			$.ajax({
				url : '/user/LetterUpdate',
				data : {l_idx : l_idx,
						l_content : l_content
				},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
					alert("수정되었습니다.");
					location.reload();
				}
			});
		}
		
		function LetterDelete(l_idx){
			if (confirm("정말 삭제하시겠습니까?") == true) {
				$.ajax({
					url : '/user/LetterDelete',
					data : {l_idx : l_idx,
					},
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
		
		function ReplyStart(l_idx, w_idx){
			
			$(".letterReply").empty();
			$("#letterReply" + l_idx).append("<div class='flex-grow-1' id='letterReplyBox'><input type='hidden' name='ro_idx' id='ro_idx"+l_idx+"' value='"+w_idx+"'><input type='text' name='lr_content' id='lr_content"+l_idx+"' placeholder='답글 작성하기'></div>"
												+"<div class='flex-shrink-0'><button type='button' class='letterReplyBtn' onclick='LetterReplyInsert("+l_idx+")'>확인</button></div>"		
			);
			
		}
		
		function LetterReplyInsert(l_idx){
			
			var rw_idx = ${userInfo.m_idx};
			var ro_idx = $("#ro_idx"+l_idx).val();
			var lr_content = $("#lr_content"+l_idx).val();
			var m_name = "${userInfo.m_name}";
			$.ajax({
				url : '/user/AlarmInsert',
				data : {"ac_idx" : rw_idx,
					"ar_idx" : ro_idx,
						"type" : "reply",
						"content" : lr_content
						},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
					if(socket){
						let socketMsg = "reply," + lr_content +","+ m_name;
						console.log("msgmsg : " + socketMsg);
						socket.send(socketMsg);
					}
				}
			});
			
			$.ajax({
				url : '/user/LetterReplyInsert',
				data : {l_idx : l_idx,
					rw_idx : rw_idx,
					ro_idx : ro_idx,
					lr_content : lr_content
				},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
					alert("등록되었습니다.");
					location.reload();
				}
			});
			
			
		}
		
	function LetterReplyUpdate(lr_idx){
			
			var lr_content = $(".lr_content" + lr_idx).val();
			
			$(".lr_content" + lr_idx).remove();
			$(".letterContentBox").empty();

			$("#letterReplyContent"+lr_idx).append("<input type='text' class='lr_content"+lr_idx+"' id='LetterReplyContentUpdate' value='"+lr_content+"'>");
			$('.letterReplyEdit'+lr_idx).attr("onclick", "LetterReplyUpdateBtn("+lr_idx+");");
																																	
		}
		
		function LetterReplyUpdateBtn(lr_idx){
			var lr_content = $(".lr_content" + lr_idx).val();
			
			$.ajax({
				url : '/user/LetterReplyUpdate',
				data : {lr_idx : lr_idx,
						lr_content : lr_content
				},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
					alert("수정되었습니다.");
					location.reload();
				}
			});
		}
		
		function LetterReplyDelete(lr_idx){
			if (confirm("정말 삭제하시겠습니까?") == true) {
				$.ajax({
					url : '/user/LetterReplyDelete',
					data : {lr_idx : lr_idx,
					},
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
		
		function NoticeModal(ar_idx){
			var email = "${userInfo.email}";
			// 알림 버튼 누를 시 알림 리스트를 계속 받아와야함
			$.ajax({
				url : '/user/AlarmList',
				data : {ar_idx : ar_idx,
				},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
					console.log(result);
					$("#myAlarmModal").modal("show");
					$("#myAlarmModalLabel").append("<div class='AlarmListBox'></div>");
					if(result.length == 0){
						$(".AlarmListBox").append("<div class='noAlarm'>알림이 없습니다.</div>");
					}
					for(var i=0; i<result.length; i++){
						console.log(result[i].a_date);
						var member = result[i].member;
						if(result[i].type == "letter"){
							$(".AlarmListBox").append("<a type='external' href='/mainPage/" + email + "#"+result[i].type+"'>"
									+ member.m_name + "님이 안부글을 남겼습니다." + "</a><br><p>"+result[i].content+"</p>"
									+"<span></span>");
						} else if(result[i].type == "reply"){
							$(".AlarmListBox").append("<a type='external' href='/mainPage/" + email + "#"+result[i].type+"'>"
									+ member.m_name + "님이 답글을 남겼습니다." + "</a><br><p>"+result[i].content+"</p>"
									+"<span></span>");
						} else if(result[i].type == "follow"){
							$(".AlarmListBox").append("<a type='external' href='/mainPage/" + email + "#neighbor'>"
									+ member.m_name + "님이 이웃 신청을 하셨습니다." + "</a>"
									+"<span></span>");
						} else if(result[i].type == "Eachfollow"){
							$(".AlarmListBox").append("<a type='external' href='/mainPage/" + email + "#neighbor'>"
									+ member.m_name + "님이 서로이웃 신청을 하셨습니다." + "</a>"
									+"<span></span>");
						}
						
					}
				}
			});
		}
		
		function PostScrap(p_idx){
			
			var email = "${userInfo.email}";
			var m_idx = ${userInfo.m_idx};
			
			$.ajax({
				url : '/user/PostScrap',
				data : {p_idx : p_idx,
						m_idx : m_idx
				},
				type : "POST",
				dataType : "json",
				async : false,
				success : function(result) {
					alert("스크랩되었습니다.");

					if(result == 0){
						if (confirm("블로그로 이동하시겠습니까?") == true) {
							location.href="${pageContext.request.contextPath}/mainPage/"+email+"#education";
						}else{
							return false;
						}
					}
					
				}
			});
		}
		
		
		$(document)
				.ready(
						function() {
							
							
							SocketConnect();
							
							//버튼 클릭 시 왼쪽으로 스크롤
							$(document).on("click", ".ScrollUp", function() {
								var _scrollY = $('#postList').scrollTop();
								$('#postList').scrollTop(_scrollY - 500);

							});

							//버튼 클릭 시 오른으로 스크롤
							$(document).on("click", ".ScrollDown", function() {
								var _scrollY = $('#postList').scrollTop();
								$('#postList').scrollTop(_scrollY + 500);

							});

							$('#sideNav').css("background-color",
									"${pageInfo.bgcolor}");

							// 사용자 소셜 선택
							if ("${pageSocial.insta}" != "N") {
								$('#social_in').css("display", "inline-flex");
							}
							if ("${pageSocial.git}" != "N") {
								$('#social_git').css("display", "inline-flex");
							}
							if ("${pageSocial.twitter}" != "N") {
								$('#social_twi').css("display", "inline-flex");
							}
							if ("${pageSocial.facebook}" != "N") {
								$('#social_fb').css("display", "inline-flex");
							}

							if(follow == ""){
								$("#followChkList").append("<div class='noFollowChk'>이웃 신청 목록이 없습니다.</div>");
							}
							
							if("${neighbor}"== ""){
								$("#followList").append("<div class='noFollowChk'>이웃 목록이 없습니다.</div>");
							}

						});
	</script>

</body>

</html>
