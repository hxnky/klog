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
					<input type="hidden" id="bno" name="bno"
						value="<c:out value='${board.bno }'/>"> <input
						type="hidden" name="pageNum"
						value="<c:out value='${cri.pageNum }'/>"> <input
						type="hidden" name="amount"
						value="<c:out value='${cri.amount }'/>"> <input
						type="hidden" name="keyword"
						value="<c:out value='${cri.keyword }'/>"> <input
						type="hidden" name="type" value="<c:out value='${cri.type }'/>">
				</form>

			</div>
			<!-- end panel-body -->
		</div>
	</div>
</div>

<!-- 댓글창 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
				<!-- 댓글 입력 버튼 추가 -->
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글
					달기</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<ul class="chat">
					<!-- start reply -->
					<li class="left clearfix" data-rno="12">
						<div>
							<div class="header">
								<strong class="primary-font">user00 </strong> <small
									class="pull-right text-muted">2022-01-11 02:51</small>
							</div>
							<p>GANG</p>
						</div>
					</li>
					<!-- end reply -->
				</ul>

			</div>
			<!-- end panel-body -->
		</div>
	</div>
</div>

<!-- 댓글 등록 모달창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="model-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">$times;</button>
				<h4 class="modal-title" id="myModalLabel">댓글 달기</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>댓글 내용</label> <input class="form-control" name="reply"
						value="새 댓글을 달아보세요!">
				</div>
				<div class="form-group">
					<label>댓글 작성자</label> <input class="form-control" name="replyer"
						value="replyer">
				</div>
				<div class="form-group">
					<label>댓글 작성 시간</label> <input class="form-control" name="replyDate"
						value="">
				</div>
			</div>
			<div class="modal-footer">
				<button id="modalModBtn"  type="button" class="btn btn-warning">수정하기</button>
				<button id="modalRemoveBtn"  type="button" class="btn btn-danger" >삭제하기</button>
				<button id="modalRegisterBtn"  type="button" class="btn btn-primary" >등록하기</button>
				<button id="modalCloseBtn" s type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>



<script src="/resources/js/reply.js"></script>

<!-- reply.js 테스트용 스크립트들 -->
<script type="text/javascript">
	// 	$(document).ready(function(){
	// 		console.log(replyService);
	// 	});
	// 	console.log("=================");
	// 	console.log("JS TEST");

	// 	var bnoValue= "<c:out value='${board.bno}'/>";

	// reply.js에 만든 add 메서드 테스트
	// 	replyService.add(
	// 			{reply:"JS TEST", replyer:"tester", bno:bnoValue}, 
	// 			function(result){
	// 				alert("RESULT : " + result);
	// 			}
	// 	);

	// reply.js에서 만든 getList 테스트
	// 	replyService.getList({bno:bnoValue, page:1}, function(list){

	// 		for(var i = 0, len = list.length||0; i < len; i++){
	// 			console.log(list[i]);
	// 		}

	// 	});

	// reply.js의 remove 테스트
	// 	replyService.remove(23, function(count){

	// 		console.log(count);
	// 		if(count === "success"){
	// 			alert("삭제되었습니다.");
	// 		}
	// 	}, function(err){
	// 		alert("ERROR.....");

	// 	});

	//reply.js의 update 테스트
	// 	replyService.update({
	// 		rno : 22,
	// 		bno : bnoValue,
	// 		reply : "JS를 통한 수정 테스트"
	// 	}, function(result){
	// 		alert("수정 완료");
	// 	});

	// reply.js의 get 테스트
	//  	replyService.get(10, function(data){
	//  		console.log(data);
	//  	});
</script>

<!-- 댓글 관련 스크립트 -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var bnoValue = "<c:out value='${board.bno}'/>";
						var replyUL = $(".chat");

						showList(1);

						function showList(page) {
							replyService
									.getList(
											{
												bno : bnoValue,
												page : page || 1
											},
											function(list) {
												var str = "";
												if (list == null
														|| list.length == 0) {
													replyUL.html("");

													return;
												}
												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
													str += " <div><div class='header'><strong class='primary-font'>"
															+ list[i].replyer
															+ "</strong>";
													str += "	<small class='pull-right text-muted'>"
															+ replyService
																	.displayTime(list[i].replyDate)
															+ "</small></div>";
													str += "		<p>"
															+ list[i].reply
															+ "</p></div></li>";

												}

												replyUL.html(str);

											}); // end function

						} // end showList
						
						// start modal
						var modal = $(".modal");
						var modalInputReply = modal.find("input[name='reply']");
						var modalInputReplyer = modal.find("input[name='replyer']");
						var modalInputReplyDate = modal.find("input[name='replyDate']");
						
						var modalModBtn = $("#modalModBtn");
						var modalRemoveBtn = $("#modalRemoveBtn");
						var modalRegisterBtn = $("#modalRegisterBtn");
						
						$("#addReplyBtn").on("click", function(e){
							modal.find("input").val("");
							modalInputReplyDate.closest("div").hide();
							modal.find("button[id != 'modalCloseBtn']").hide();
							modalRegisterBtn.show();
							
							$(".modal").modal("show");
						});
						
						modalRegisterBtn.on("click", function(e){
							var reply = {
									reply : modalInputReply.val(),
									replyer : modalInputReplyer.val(),
									bno : bnoValue
							};
							
							replyService.add(reply, function(result){
								alert(result);
								
								modal.find("input").val("");
								modal.modal("hide");
								
								// 댓글창 갱신
								showList(1);
							});
						});
						
						// 이벤트는 ul에 걸지만 실제 작동되는 곳은 li
						// 댓글 조회 이벤트
						$(".chat").on("click", "li", function(e){
							var rno = $(this).data("rno");
							
							replyService.get(rno, function(reply){
								modalInputReply.val(reply.reply);
								modalInputReplyer.val(reply.replyer);
								modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
								modal.data("rno", reply.rno);
								
								modal.find("button[id != 'modalCloseBtn']").hide();
								modalModBtn.show();
								modalRemoveBtn.show();
								
								$(".modal").modal("show");
							});
						});
						
						// 댓글 수정
						modalModBtn.on("click", function(e){
							var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
							replyService.update(reply, function(result){
								alert(result);
								modal.modal("hide");
								showList(1);
							});
						});
						
						// 댓글 삭제
						modalRemoveBtn.on("click", function(e){
							var rno = modal.data("rno");
							replyService.remove(rno, function(result){
								alert(result);
								modal.modal("hide");
								showList(1);
							});
						});
					});
</script>
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