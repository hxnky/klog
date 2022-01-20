<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/taglibs/standard/scriptfree"
	prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자만 허용</title>
</head>
<body>
	<h1>/sample/admin</h1>
	
	<!-- principal : 현재 사용자의 정보 -->
	<p>principal ; <sec:authentication property="principal"/></p>
	<p>MemberVO ; <sec:authentication property="principal.member"/></p>
	<p>사용자 이름 : <sec:authentication property="principal.member.userName"/></p>
	<p>사용자 아이디; <sec:authentication property="principal.username"/></p>
	<p>사용자 권한 리스트 ; <sec:authentication property="principal.member.authList"/></p>

	<a href="/customLogout">Logout</a>
</body>
</html>