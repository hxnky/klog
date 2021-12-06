<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL 출력과 포맷을 적용할 수 있는 태그 라이브러리 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>제출 페이지 테스트</title>
<%@include file="../include/header.jsp"%>
<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">갱 도서관</h1>

				<div class="card mb-4">
					<div class="card-body">책 정보가 표시됩니다.</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 책 목록
						<!-- 						<a href="/board/register">등록</a> -->
						<button id="regBtn" type="button" class="btn btn-xs pull-right">책
							등록</button>
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</thead>

							<c:forEach items="${list }" var="board">
								<tr>

									<td><c:out value="${board.bno }" /></td>
									<td><a class="move" href="<c:out value='${board.bno }'/>">
											<c:out value="${board.title }" />
									</a>
									<td><c:out value="${board.writer }" /></td>

									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.regdate }" /></td>

									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.updateDate }" /></td>

								</tr>
							</c:forEach>

						</table>
						<!-- 페이지 처리 -->
						<nav class="dataTable-pagination">
							<ul class="dataTable-pagination-list">
								<c:if test="${pageMaker.prev }">
									<li class="pager"><a
										href="${pageMaker.startPage-1 }">Previous</a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
									<li class="active ${pageMaker.cri.pageNum == num ? "active" : "" }">
										<a href="${num} ">${num }</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next }">
									<li class="pager"><a
										href="${pageMaker.endPage + 1 }">Next</a></li>
								</c:if>
							</ul>
						</nav>

					<form id="actionForm" action="/board/list" method="get">
						<input type="hidden" name="pageNum"
							value="${pageMaker.cri.pageNum }"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount }">
					</form>

				</div>
			</div>
	</div>
	</main>
	<%@include file="../include/footer.jsp"%>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">등록 완료</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">처리되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<script src="/resources/js/scripts.js"></script>

	<script src="/resources/js/datatables-simple-demo.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<!-- 페이지에 메시지 표시하기 -->
	<script type="text/javascript">
		$(document).ready(function() {
			var result = '<c:out value="${result}"/>';

			var result1 = parseInt(result);
			console.log(result1);
		});

		/* 		$(document).ready(function() {

		 }); */
	</script>

	<!-- Modal 창 띄우기 -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var result = '<c:out value="${result}"/>'

							checkModal(result);

							/* 이미 한번 모달창이 나온경우 모달이 뜨지 않게 한다. */
							history.replaceState({}, null, null);

							function checkModal(result) {
								if (result == '' || history.state) {
									return;
								}

								if (parseInt(result) > 0) {

									console.log("함수 진입");

									$(".modal-body").html(
											"게시글 " + parseInt(result)
													+ "번이 등록되었습니다.");
								}
								$("#myModal").modal("show");
							}

							// 페이징 처리 
							var actionForm = $("#actionForm");

							$(".active a").on(
									"click",
									function(e) {
										e.preventDefault();

										console.log("click");

										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});
							
							$(".pager a").on(
									"click",
									function(e) {
										e.preventDefault();

										console.log("click");

										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});

							// pageNum과 amount 파라미터를 추가로 전달
							$(".move")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												actionForm
														.append("<input type='hidden' name='bno' value='"
																+ $(this).attr(
																		"href")
																+ "'>");
												actionForm.attr("action",
														"/board/get");
												actionForm.submit();
											})

						});
	</script>

	<!-- 등록 버튼 클릭 시 등록 페이지로 이동 -->
	<script type="text/javascript">
		$("#regBtn").on("click", function() {
			self.location = "/board/register";
		});
	</script>




	</script>





</body>
</html>
