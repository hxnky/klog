<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				도서관 책 목록
				<button id="regBtn" type="button" class="btn btn-xs pull-right">새로운
					책 정보 등록</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>

						</tr>
					</thead>

					<!--리스트 출력을 위한 반복문 -->
					<c:forEach items="${list }" var="board">
						<tr>
							<td><c:out value="${board.bno }" /></td>
							<!-- 조회 페이지를 새 창으로 보고 싶다면 targer='_blank'를 지정하면 된다. -->
							<td><a class="move" href='<c:out value="${board.bno}"/>'><c:out
										value="${board.title }" /></a></td>
							<td><c:out value="${board.writer }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>

						</tr>
					</c:forEach>

				</table>
				<!-- /.table-responsive -->

				<!-- 검색창 추가 -->
				<div class="row">
					<div class="col-lg-12">
						<form id="searchForm" action="/board/list" method="get">
							<select name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>-----</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목

								
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작가</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목
									또는 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목
									또는 작가</option>
								<option value="WC"
									<c:out value="${pageMaker.cri.type eq 'WC'?'selected':'' }"/>>작가
									또는 내용</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':'' }"/>>작가
									또는 내용 또는 제목</option>
							</select> <input type="text" name="keyword"
								value="<c:out value='${pageMaker.cri.keyword }'/>"> <input
								type="hidden" name="pageNum"
								value="<c:out value='${pageMaker.cri.pageNum }'/>"> <input
								type="hidden" name="amount"
								value="<c:out value='${pageMaker.cri.amount }'/>">
							<button class="btn btn-default">검색</button>
						</form>
					</div>
				</div>

				<!-- 페이징 추가 -->
				<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage - 1 }">이전</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""} " ><a
								href="${num }">${num }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">다음</a></li>
						</c:if>
					</ul>

				</div>
				<!-- 페이지 이동을 위한 정보 보내기 -->
				<form id="actionForm" action="/board/list" method="get">
					<!-- el사용하면 간단하지만 c:out 사용하는것이 더 좋은 방법임 -->
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }"> <input
						type="hidden" name="type"
						value="<c:out value="${pageMaker.cri.type }"/>"> <input
						type="hidden" name="keyword"
						value="<c:out value="${pageMaker.cri.keyword }"/>">
				</form>
				<!-- 페이징 끝 -->


				<!-- 모달창 추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="model-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">$times;</button>
								<h4 class="modal-title" id="myModalLabel">갱 도서관</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary">Save
									Changes</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 새로운 게시물이 등록된 직후에 책번호 저장
						// addFlashAttribute() 로 저장되었기 때문에 일회성으로만 데이터를 사용할 수 있다.
						var result = "<c:out value='${result}'/>";
						console.log(result);

						// 모달창 관련 스크립트
						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {

							// result 값이 없거나 모달창이 이미 띄워졌을 경우
							if (result === "" || history.state) {
								console.log("책번호 정보 없음");

								return;
							}

							if (parseInt(result) > 0) {
								console.log(parseInt(result));
								console.log("책번호 정보 있음");
								$(".modal-body").html(
										"책번호 " + parseInt(result)
												+ "번이 등록되었습니다.");

							}

							$("#myModal").modal("show");
						}

						// 등록 버튼 누르기 관련 스크립트
						$("#regBtn").on("click", function() {
							self.location = "/board/register";
						});

						// 페이징 관련 스크립트
						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {
									e.preventDefault();

									console.log("click");

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						// 게시물의 제목 클릭 시 이동 이벤트
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
										});

						// 검색 관련 이벤트
						var searchForm = $("#searchForm");
						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색 종류를 선택하세요");
										return false;
									}

									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();

								});

					});
</script>

<%@include file="../include/footer.jsp"%>