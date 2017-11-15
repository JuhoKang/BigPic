<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>
<link
	href="<c:url value="/resources/materialize/css/materialize.min.css" />"
	rel="stylesheet" type="text/css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>

<body>
	<div>
		<h2>회원등록</h2>
	</div>

	<form:form method="POST" modelAttribute="user" accept-charset="UTF-8">
		<form:input type="hidden" path="id" id="id" />
		<div>
			<div>
				<div>
					<div>
						<label for="ssoId">아이디: </label>
					</div>
				</div>
				<div>
					<div>
						<form:input type="text" path="ssoId" id="ssoIdInput" />
					</div>
				</div>
				<div>
					<div>
						<form:errors path="ssoId" cssClass="error" />
					</div>
				</div>
			</div>
		</div>

		<div class="col">
			<div>
				<div>
					<div>
						<label for="pw">비밀번호: </label>
					</div>
				</div>
				<div>
					<div>
						<form:input type="password" path="password" id="passwordInput" />
					</div>
				</div>
				<div>
					<div>
						<label for="pwexplain" id="pwexplain">비밀번호는 영문,숫자,특수기호
							혼합으로 8자 이상이여야합니다.</label>
					</div>
				</div>
				<div>
					<div>
						<form:errors path="password" cssClass="error" />
					</div>
				</div>
			</div>
		</div>
		<div class="col">
			<div>
				<div>
					<div>
						<label for="pw">비밀번호 확인: </label>
					</div>
				</div>
				<div>
					<div>
						<input type="password" id="passwordcheckInput" />
					</div>
				</div>
				<div>
					<div></div>
				</div>
			</div>
		</div>

		<div class="col">
			<div>
				<div>
					<div>
						<label for="name">이름: </label>
					</div>
				</div>
				<div>
					<div>
						<form:input type="text" path="name" id="nameInput" />
					</div>
				</div>
				<div>
					<div></div>
				</div>
			</div>
		</div>

		<div class="col">
			<div>
				<div>
					<div></div>
				</div>
				<div>
					<div>
						<input type="submit" value="등록" class="btn width-1of2"
							onClick="return checkValid()" />
					</div>
				</div>
				<div>
					<div></div>
				</div>
			</div>
		</div>

	</form:form>

	<br />
	<br />
	<a href="<c:url value='/login' />"><b>로그인 화면으로</b></a>


</body>
</html>