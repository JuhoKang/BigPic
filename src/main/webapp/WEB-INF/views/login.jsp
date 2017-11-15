<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link
	href="<c:url value="/resources/materialize/css/materialize.min.css" />"
	rel="stylesheet" type="text/css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body>
	<div class="container">
		<c:if test="${param.error != null}">
			<p hidden id="condition">error</p>
		</c:if>
		<c:if test="${param.logout != null}">
			<p hidden id="condition">logout</p>
		</c:if>
		<div class="col s8 m8 offset-m2">


			<h1 class="header center">로그인 하십시오</h1>
			<div class="row">
				<form:form method="POST" modelAttribute="user">
					<input type="text" class="input-field" name="ssoId"
						placeholder="ssoId" required autofocus>
					<input type="password" class="input-field" name="password"
						placeholder="password" required>
					<button class="col s12 orange waves-effect waves-light btn"
						type="submit">Sign in</button>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form:form>
			</div>
			<div class="row">
				<a href="<c:url value='/signup' />"
					class="col s12 waves-effect waves-light btn green">Create an
					account </a>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="<c:url value="/resources/jquery/jquery-3.0.0.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/resources/materialize/js/materialize.min.js"/>"></script>

	<script>
		$(document).ready(
				function() {
					if ($("#condition").length) {
						if ($("#condition").text() == "error") {
							Materialize.toast("올바른 아이디와 비밀번호를 입력해주세요.", 3000,
									"center rounded red");
						} else if ($("#condition").text() == "logout") {
							Materialize.toast("로그아웃 되었습니다.", 3000,
									"center rounded blue");
						}
					}
				});
	</script>

</body>
</html>