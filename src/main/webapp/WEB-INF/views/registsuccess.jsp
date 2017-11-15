<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SignUp Complete</title>
<link
	href="<c:url value="/resources/materialize/css/materialize.min.css" />"
	rel="stylesheet" type="text/css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col s12 m12">
				<div class="card blue-grey darken-1">
					<div class="card-content white-text">
						<span class="card-title">회원가입 성공!</span>
						<p>회원가입 성공했습니다.</p>
					</div>
					<div class="card-action">
						<a href="<c:url value='/' />">로그인 화면으로</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="<c:url value="/resources/jquery/jquery-3.0.0.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/resources/materialize/js/materialize.min.js"/>"></script>
</body>
</html>