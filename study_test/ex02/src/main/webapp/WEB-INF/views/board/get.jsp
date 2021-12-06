<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>책 등록 페이지</title>
<%@include file="../include/header.jsp"%>

<body class="sb-nav-fixed">

	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">갱 도서관</h1>

				<div class="card mb-4">
					<div class="card-body">책 정보 조회 페이지입니다.</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 책 등록
					</div>
					<div class="card-body">
						<div class="dataTable-container">

							<form id="operForm" action="/board/modify" method="get">
								<input type="hidden" id="bno" name="bno" value="<c:out value='${board.bno }'/>"> 
								<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
								<input type="hidden" name="amount" value="<c:out value='${cri.amount }'/>">
							</form>

							<div class="form-group">
								<label>책 번호</label> <input class="form-control" name="bno"
									value="<c:out value="${board.bno }" />" readonly="readonly">
							</div>
							<div class="form-group">
								<label>책 이름</label> <input class="form-control" name="title"
									value="<c:out value="${board.title }" />" readonly="readonly">
							</div>
							<div class="form-group">
								<label>책 내용</label><br>
								<textarea class="form-group" rows="3" name="content"
									readonly="readonly"><c:out value="${board.content }" /></textarea>
							</div>
							<div class="form-group">
								<label>책 작가</label> <input class="form-control" name="writer"
									value="<c:out value="${board.writer }" />" readonly="readonly">
							</div>
							<button data-oper="modify" class="btn btn-default">Modify
							</button>
							<button data-oper="list" class="btn btn-default">List</button>

							<form id="operForm" action="/board/modify" method="get">
								<input type="hidden" id=" bno" name="bno"
									value="<c:out value="${board.bno }"/>">
							</form>
						</div>
					</div>
				</div>
			</div>
		</main>
		<%@include file="../include/footer.jsp"%>
	</div>


	<script src="/resources/js/scripts.js"></script>

	<script src="/resources/js/datatables-simple-demo.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			var operForm = $("#operForm");

			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "/board/modify").submit();
			});

			$("button[data-oper='list']").on("click", function(e) {
				operForm.find("#bno").remove();
				operForm.attr("action", "/board/list");
				operForm.submit();
			});
		});
	</script>
</body>
</html>