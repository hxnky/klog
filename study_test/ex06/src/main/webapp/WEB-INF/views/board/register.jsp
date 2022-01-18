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

<!-- 파일 첨부 추가 -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">파일 첨부</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" multiple>
					<ul></ul>
				</div>
				<!-- 처리 결과 -->
				<div class="uploadResult">
					<ul></ul>
				</div>
				
			</div>
		</div>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<script type="text/javascript">
	

	$(document).ready(function() {
		// 돌아가기 버튼을 클릭하여도 아무 이벤트도 일어나지 않아 스크립트 별도 추가
		$("#resetBtn").on("click", function() {
			self.location = "/board/list";
		});

		var formObj = $("form[role='form']");

		$("button[type='submit']").on("click", function(e) {
			e.preventDefault();

			console.log("submit Clicked");
			
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
			
		});

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
		
		// 파일 삭제
		$(".uploadResult").on("click", "button", function(e){
			console.log("delete");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url : "/deleteFile",
				data : {
					fileName : targetFile,
					type : type
				},
				dataType : "text",
				type : "POST",
				success : function(result){
					alert(result);
					targetLi.remove();
				}
			}); // ajax 끝
			
		}); // end 파일삭제

	});
</script>
<%@include file="../include/footer.jsp"%>