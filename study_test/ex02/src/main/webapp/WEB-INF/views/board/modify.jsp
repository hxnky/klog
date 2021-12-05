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
					<div class="card-body">책 정보 수정 페이지입니다.</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 책 등록
					</div>
					<div class="card-body">
						<div class="dataTable-container">
							<form role="form" action="/board/modify" method="post">
								<div class="form-group">
									<label>책 번호</label> <input class="form-control" name="bno"
										value="<c:out value="${board.bno }" />" readonly="readonly">
								</div>
								<div class="form-group">
									<label>책 이름</label> <input class="form-control" name="title"
										value="<c:out value="${board.title }" />">
								</div>
								<div class="form-group">
									<label>책 내용</label><br>
									<textarea class="form-group" rows="3" name="content"><c:out
											value="${board.content }" /></textarea>
								</div>
								<div class="form-group">
									<label>책 작가</label> <input class="form-control" name="writer"
										value="<c:out value="${board.writer }" />" readonly="readonly">
								</div>
								<button type="submit" data-oper="modify" class="btn btn-default">Modify</button>
								<button type="submit" data-oper="remove" class="btn btn-danger">Delete</button>
								<button type="submit" data-oper="list" class="btn btn-info">List</button>

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
			var formObj = $("form");

			$("button").on("click", function(e) {
				e.preventDefault();

				var operation = $(this).data("oper");

				console.log(operation);

				if (operation === "remove") {
					formObj.attr("action", "/board/remove");
				} else if (operation === "list") {
					// 리스트.jsp 로 이동
					formObj.attr("action", "/board/list").attr("method", "get");
					formObj.empty();
				}

				formObj.submit();
			});
		});
	</script>
</body>
</html>