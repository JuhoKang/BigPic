<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>AccessDenied page</title>
</head>
<body>
	접근 권한이 없습니다.
	<a href="<c:url value="/logout" />">로그 아웃</a>
</body>
</html>