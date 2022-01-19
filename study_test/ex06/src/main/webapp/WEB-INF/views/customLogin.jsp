<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>로그인 페이지</title>
</head>
<body>
	<h1>Custom Login Page</h1>
	
	<h2><c:out value='${error }'/></h2>
	<h2><c:out value="${logout }"/></h2>
	
	<form method="post" action="/login">
		<div>
			<input type="text" name="username" value="admin">
		</div>
		<div>
			<input type="password" name="password" value="admin">
		</div>
		<div>
			<input type="checkbox" name="remember-me">Remember Me
		</div>
		<div>
			<input type="submit">
		</div>
		<!-- 이 때 value는 임의의 값이다 -->
		<!-- csrf : Cross-site request forgery / 사이트간 위조 방지를 목적으로 특정한 값의 토큰을 사용 -->
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	</form>
</body>
</html>