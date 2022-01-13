<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Register</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
			
				<form role="form" action="/board/register" method="post">
					<div class="form-group">
						<label>책 제목</label> <input class="form-control" name="title">
					</div>
					<div class="form-group">
						<label>책 내용</label>
						<textarea class="form-control" rows="3" name="content"></textarea>
					</div>
					<div class="form-group">
						<label>작가명</label> <input class="form-control" name="writer">
					</div>
					<button type="submit" class="btn btn-default">등록</button>
					<button type="reset" id="resetBtn" class="btn btn-default">돌아가기</button>
				</form>
			
			</div>
			<!-- end panel-body -->
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(
		function() {
			// 돌아가기 버튼을 클릭하여도 아무 이벤트도 일어나지 않아 스크립트 별도 추가
			$("#resetBtn").on("click", function() {
				self.location = "/board/list";
			});
		});
</script>
<%@include file="../include/footer.jsp"%>