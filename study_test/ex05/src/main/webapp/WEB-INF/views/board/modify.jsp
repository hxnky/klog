<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../include/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Modify</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/board/modify" method="post">
				<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
				<input type="hidden" name="amount" value="<c:out value='${cri.amount }'/>">
				<input type="hidden" name="keyword" value="<c:out value='${cri.keyword }'/>">
				<input type="hidden" name="type" value="<c:out value='${cri.type }'/>">
					<div class="form-group">
						<label>책 번호</label> <input class="form-control" name="bno"
							value="<c:out value='${board.bno }'/>" readonly="readonly">
					</div>
					<div class="form-group">
						<label>책 제목</label> <input class="form-control" name="title"
							value="<c:out value='${board.title }'/>">
					</div>
					<div class="form-group">
						<label>책 내용</label>
						<textarea class="form-control" rows="3" name="content"><c:out
								value="${board.content }" /></textarea>
					</div>
					<div class="form-group">
						<label>작가명</label> <input class="form-control" name="writer"
							value="<c:out value='${board.writer }'/>" readonly="readonly">
					</div>
					<div class="form-group">
						<label>등록일</label> <input class="form-control" name="regDate"
							value="<fmt:formatDate pattern='yyyy/MM/dd' value='${board.regdate }'/>"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label>수정일</label> <input class="form-control" name="updateDate"
							value="<fmt:formatDate pattern='yyyy/MM/dd' value='${board.updateDate }'/>"
							readonly="readonly">
					</div>

					<button type="submit" data-oper="modify" class="btn btn-default">수정</button>
					<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
					<button type="submit" data-oper="list" class="btn btn-info">돌아가기</button>
				</form>

			</div>
			<!-- end panel-body -->
		</div>
	</div>
</div>
<!-- 첨부파일 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Files</div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" multiple="multiple">
				</div>
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 원본 이미지 출력 -->
<div class="bigPictureWrapper">
	<div class="bigPicture"></div>
</div>


<script type="text/javascript">
	$(document).ready(function() {
		
		// 첨부파일 관련 이벤트
		
			var bno = "<c:out value='${board.bno}'/>";
			
			$.getJSON("/board/getAttachList", {bno:bno}, function(arr){
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, obj){
					if (!obj.fileType) {

						str += "<li data-path = '"+obj.uploadPath+"' data-uuid = '"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
						str += "<span> " + obj.fileName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button>";
						str+= "<img src='/resources/img/attach.png'><br>";
						str += "</div></li>";
					} else {
						// str += "<li>" + obj.fileName + "</li>";
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

						str += "<li data-path = '"+obj.uploadPath+"' data-uuid = '"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
						str += "<span> " + obj.fileName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button>";
						str += "<img src='/display?fileName="+fileCallPath+"'><br>";
						str += "</div></li>";

					}
				});
				
				$(".uploadResult ul").html(str);
				
			});
			
			// 첨부파일의 x를 눌렀을 경우 화면상에서만 사라지게 하기
			$(".uploadResult").on("click", "button", function(e){
				console.log("첨부파일 삭제");
				
				if(confirm("이 파일을 삭제하시겠습니까?")){
					var targetLi = $(this).closest("li");
					targetLi.remove();
				}
			});
			
			// 해당 파일이 첨부가능한지 확인
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; // 5MB

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
		
			// 파일 첨부 함수
			$("input[type='file']").change(function(e) {

				var formData = new FormData();
				var inputFile = $("input[name = 'uploadFile']");
				var files = inputFile[0].files;

				console.log(files);

				//add filedate to formdata
				for (var i = 0; i < files.length; i++) {

					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);
				}

				$.ajax({
					url : '/uploadAjaxAction',
					processData : false, // 이 둘은 무조건 false로 해야 전송이 된다.
					contentType : false,
					data : formData,
					type : "POST",
					dataType : "json",
					success : function(result) {
						console.log(result);
						showUploadResult(result);

					}
				}); // end ajax

			});	//end 파일첨부
			
			//썸네일
			function showUploadResult(uploadResultArr) {
			
				if (!uploadResultArr || uploadResultArr.length == 0) {
					
					return;
				}

				var uploadUL = $(".uploadResult ul");
				var str = "";
				
				$(uploadResultArr).each(function(i, obj) {
					if (!obj.image) {

						// 파일 이름 클릭 시 다운로드 처리
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);

						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

						str += "<li data-path = '"+obj.uploadPath+"' data-uuid = '"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
						str += "<span> " + obj.fileName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button>";
						str+= "<img src='/resources/img/attach.png'>";
						str += "</div></li>";
					} else {
						// str += "<li>" + obj.fileName + "</li>";
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

						str += "<li data-path = '"+obj.uploadPath+"' data-uuid = '"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
						str += "<span> " + obj.fileName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-cricle'><i class='fa fa-times'></i></button><br>";
						str += "<img src='/display?fileName="+fileCallPath+"'>";
						str += "</div></li>";

					}

				});
				
				
				uploadUL.append(str);
			}
			

		var formObj = $("form");

		$("button").on("click", function(e) {

			// 기본 동작 막기
			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === "remove") {
				formObj.attr("action", "/board/remove");
			} else if (operation === "list") {
				formObj.attr("action", "/board/list").attr("method","get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();
				
				// 필요한 파라미터 태그들 추가
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			} else if(operation === 'modify'){
				
				console.log("수정하기");
				
				var str = "";
				
				$(".uploadResult ul li").each(function(i, obj){
					
					var jobj = $(obj);
					console.dir(jobj);
					
					str += "<input type = 'hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type = 'hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type = 'hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type = 'hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
				});
				console.log(str);
				formObj.append(str).submit();
				
	
			}

			// 직접 submit 수행
			formObj.submit();
		});

	});
</script>

<%@include file="../include/footer.jsp"%>