<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<a href="/uploadForm">파일 업로드</a>
<a href="/uploadAjax">Ajax 파일 업로드</a>
<a href="/board/list">메인 프로젝트</a>

<script type="text/javascript">
	self.location = "/board/list";
</script>
</body>
</html>
