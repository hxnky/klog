<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Social Login</title>
</head>
<body>


	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
			if(${socialResult} == 1){
				alert("이미 이메일로 가입된 회원입니다.");
				location.href = "/";
			} else if(${socialResult} == 0){
				var email = "${email}";
				location.href = "/mainPage/"+email;
			} else if(${socialResult} == 2){
				var email = "${email}";
				location.href = "/mainPage/"+email;
			}
	
	});
</script>
</body>
</html>