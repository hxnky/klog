<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read</div>
			<!-- /.panel-heading -->
			<div class="panel-body">


				<div class="form-group">
					<label>책 번호</label> <input class="form-control" name="bno"
						value="<c:out value='${board.bno }'/>" readonly="readonly">
				</div>
				<div class="form-group">
					<label>책 제목</label> <input class="form-control" name="title"
						value="<c:out value='${board.title }'/>" readonly="readonly">
				</div>
				<div class="form-group">
					<label>책 내용</label>
					<textarea class="form-control" rows="3" name="content"
						readonly="readonly"><c:out value="${board.content }" /></textarea>
				</div>
				<div class="form-group">
					<label>작가명</label> <input class="form-control" name="writer"
						value="<c:out value='${board.writer }'/>" readonly="readonly">
				</div>
				<button data-oper="modify" class="btn btn-default"
					onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'">수정</button>
				<button data-oper="list" class="btn btn-info"
					onclick="location.href='/board/list'">돌아가기</button>

				<!-- 조회 페이지에서 수정/삭제 페이지로 링크 처리를 위한 정보 -->
				<form id="operForm" action="/board/modify" method="get">
					<input type="hidden" id="bno" name="bno" value="<c:out value='${board.bno }'/>">
					<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
					<input type="hidden" name="amount" value="<c:out value='${cri.amount }'/>">	
					<input type="hidden" name="keyword" value="<c:out value='${cri.keyword }'/>">
					<input type="hidden" name="type" value="<c:out value='${cri.type }'/>">
				</form>

			</div>
			<!-- end panel-body -->
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		// 수정 버튼 클릭 시 bno 값을 같이 전달한다
		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/board/modify").submit();

		});

		// 돌아가기 버튼 클릭 시 bno 정보를 지우고 이동한다.
		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list");
			operForm.submit();

		});

	});
</script>

<%@include file="../include/footer.jsp"%>