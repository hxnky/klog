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
			<div class="panel-heading">도서관 책 목록</div>
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
							<td><c:out value="${board.title }" /></td>
							<td><c:out value="${board.writer }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate}" /></td>

						</tr>
					</c:forEach>

				</table>
				<!-- /.table-responsive -->
				<!-- 모달창 추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="model-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">$times;</button>
									<h4 class="modal-title" id="myModalLabel">책 등록 완료</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary">결과 저장</button>
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
	$(document).ready(function() {
		// 		새로운 게시물이 등록된 직후에 책번호 저장
		// 		addFlashAttribute() 로 저장되었기 때문에 일회성으로만 데이터를 사용할 수 있다.
		var result = "<c:out value='${result}'/>";
		console.log(result);
		
		// 모달창 관련 스크립트
		checkModal(result);
		
		function checkModal(result){
			
			if(result === ""){
				console.log("책번호 정보 없음");
				return ;
			}
			
			if(parseInt(result) > 0){
				console.log(parseInt(result));
				console.log("책번호 정보 있음");
				$(".modal-body").html("책번호 " + parseInt(result) + "번이 등록되었습니다.");

			}
			
			$("#myModal").modal("show");
		}
	});
</script>

<%@include file="../include/footer.jsp"%>