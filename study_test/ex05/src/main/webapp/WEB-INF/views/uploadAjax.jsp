<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="ContentType" content="text/html; charset=UTF-8">
<title>Ajax를 이용한 파일 업로드</title>
<style type="text/css">
	.uploadResult{
	width : 100%;
	background-color: gray;
	}
	
	.uploadResult ul{
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
	}
	
	.uploadResult ul li img{
		width: 200px;
	}
	
	.bigPictureWrapper {
		position: absolute;
		display: none;
		justify-content: center;
		align-content: center;
		top : 0%;
		width : 100%;
		height : 100%;
		background-color: gray;
		z-index : 100;
		background: rgba(255,255,255,0.5);
	}
	
	.bigPicture{
		position : relative;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.bigPicture img{
		width: 600px;
	}
</style>
</head>

<body>

	<h1>Upload With Ajax</h1>

	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<!-- 처리 결과 -->
	<div class="uploadResult">
		<ul></ul>
	</div>
	
	<!-- 원본 이미지 출력 -->
	<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
	</div>

	<button id="uploadBtn">Upload</button>

	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
	
		// 이미지의 경우 썸네일 클릭 시 원본 이미지를 보여주도록 한다
		function showImage(fileCallPath){
			//alert(fileCallPath);
			
			$(".bigPictureWrapper").css("display", "flex").show();
			
			$(".bigPicture")
			.html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>")
			.animate({width:'100%', height: '100%'}, 1000);
		}
	
		$(document).ready(function() {
			
			$(".uploadResult").on("click", "span", function(e){
				
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				console.log(targetFile);
				
				$.ajax({
					url : "/deleteFile",
					data : {fileName : targetFile,
							 type : type
					},
					dataType : "text",
					type : "POST",
					success : function(result){
						alert(result);
					}
				});
			});
			
			$(".bigPictureWrapper").on("click", function(e){
				$(".bigPicture").animate({width:'100%', height: '100%'}, 1000);
				setTimeout(() => {
					// 1초 후에 자동으로 배경창을 안보이도록 설정
					$(this).hide(); 
				}, 1000);
			});
			
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;		// 5MB
			
			function checkExtension(fileName, fileSize){
				
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					
					return false;
				}
				
				if(regex.test(fileName)){
					
					alert("해당 종류의 파일은 업로드 불가");
					
					return false;
				}
				
				return true;
			}
			
			var uploadResult = $(".uploadResult ul");
			
			// JSON 데이터를 받아서 해당 파일의 이름을 추가
			function showUploadedFile(uploadResultArr){
				
				var str = "";
				
				$(uploadResultArr).each(function(i, obj){
					
					if(!obj.image){
						
						// 파일 이름 클릭 시 다운로드 처리
						var fileCallPath = encodeURIComponent(obj.uploadPath+"/" + obj.uuid + "_" + obj.fileName);
						
						var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
						
						str += "<li><div><a href='download?fileName="+fileCallPath+"'>"+
								"<img src='/resources/img/attach.png'>" + obj.fileName + "</a>"+
								"<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span></div></li>";
					} else{
						// str += "<li>" + obj.fileName + "</li>";
						var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
						var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
						originPath = originPath.replace(new RegExp(/\\/g), "/");
						
						str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\"><img src='/display?fileName=" + fileCallPath+"'></a>"+
								"<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span></li>";

					}
				
				});
				
				uploadResult.append(str);
				
			}
			
			// 파일을 첨부하기 전 아무것도 없는 div 복사
			var cloneObj = $(".uploadDiv").clone();
			
			$("#uploadBtn").on("click", function(e) {

				var formData = new FormData();
				var inputFile = $("input[name = 'uploadFile']");
				var files = inputFile[0].files;

				console.log(files);

				//add filedate to formdata
				for (var i = 0; i < files.length; i++) {
					
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,	// 이 둘은 무조건 false로 해야 전송이 된다.
					contentType : false,
					data : formData,
					type : "POST",
					dataType : "json",
					success : function(result){
						console.log(result);
						
						showUploadedFile(result);
						
						// 첨부파일 div 초기화
						$(".uploadDiv").html(cloneObj.html());
					}
				});
				
			});
		});
	</script>

</body>
</html>