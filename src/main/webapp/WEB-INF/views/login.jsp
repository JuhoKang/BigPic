<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<title>Login</title>

	<%--<link href="<c:url value="/resources/bootstrap/bootstrap.min.css"/>"--%>
		<%--rel="stylesheet" type="text/css" />--%>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


	<link href="<c:url value="/resources/app/sign.css"/>"
		rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
	<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />

	<script type="text/javascript" src="<c:url value="/resources/jquery/jquery-3.0.0.min.js"/>"></script>

	<%--<script type="text/javascript" src="<c:url value="/resources/bootstrap/bootstrap.min.js"/>"></script>--%>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

	<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
	<script type="text/javascript" src="<c:url value="/resources/app/sign.js"/>"></script>



</head>
<body>
	<c:if test="${param.error != null}">
		<p hidden id="condition">error</p>
	</c:if>
	<c:if test="${param.logout != null}">
		<p hidden id="condition">logout</p>
	</c:if>
	<div class="page-header">
		<h1 class="title">Big picture</h1>
	</div>
	<div class="main-box">
		<div class="slider-cont">
			<div class="signup-slider">
				<div class="img-txt">
					<div class="img-layer"></div>
					<h1>The hardest part of starting up is starting out for you.</h1>
					<img src="https://static.pexels.com/photos/33972/pexels-photo.jpg"/>
				</div>
				<div class="img-txt">
					<div class="img-layer"></div>
					<h1>We understand you and your business, We have the right solutions for you.</h1>
					<img src="https://static.pexels.com/photos/257897/pexels-photo-257897.jpeg"/>
				</div>
				<div class="img-txt">
					<div class="img-layer"></div>
					<h1>Join US Now!</h1>
					<img src="https://static.pexels.com/photos/317383/pexels-photo-317383.jpeg"/>
				</div>
			</div>
		</div>
		<div class="form-cont">

			<div class="top-buttons">
				<button class="to-signup top-active-button">
					Sign Up
				</button>
				<button class="to-signin">
					Sign In
				</button>
			</div>

			<div class="form form-signup">
				<form:form action="/signup" method="POST" modelAttribute="user" accept-charset="UTF-8">
					<form:input type="hidden" path="id" id="id" />
					<lable>E-MAIL</lable>
					<form:input type="text" path="ssoId" id="ssoIdInput" placeholder="Your e-mail" />
					<form:errors path="ssoId" cssClass="error" />
					<lable>PASSWORD</lable>
					<form:input type="password" path="password" id="passwordInput" placeholder="Your password"/>
					<form:errors path="password" cssClass="error" />
					<lable>PASSWORD</lable>
					<input type="password" id="passwordcheckInput" placeholder="Check Your password" />
					<lable>FULL NAME</lable>
					<form:input type="text" path="name" id="nameInput" placeholder="Your full name" />
					<input type="submit" value="등록" class="form-btn"
						   onClick="return checkValid()" />
				</form:form>
			</div>

			<div class="form form-signin">
				<form:form method="POST" modelAttribute="user">
					<lable>E-MAIL</lable>
					<input type="text" class="input-field" name="ssoId"
						   placeholder="Your e-mail" required>
					<lable>PASSWORD</lable>
					<input type="password" class="input-field" name="password"
						   placeholder="Your password" required>
					<input type="submit"
						   class="form-btn"
						   value="Sign In"/>
					<input type="hidden" name="${_csrf.parameterName}"
						   value="${_csrf.token}" />
					<a href="#" class="lined-link to-signup-link">Create new account</a>
				</form:form>
			</div>
		</div>
		<div class="clear-fix"></div>
	</div>
</body>
</html>