<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Index</title>
	<link href="<c:url value="/resources/bootstrap/bootstrap.min.css" />"
		  rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/resources/spectrum/spectrum.css" />"
		  rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/resources/nouislider/nouislider.min.css" />"
		  rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/resources/fa/font-awesome.min.css" />"
		  rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/resources/css/chatting.css" />"
		  rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/resources/css/teststyle.css" />"
		  rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/resources/css/landing-page.css" />"
		  rel="stylesheet" type="text/css"/>

	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<script type="text/javascript"
			src="<c:url value="/resources/jquery/jquery-3.2.1.min.js"/>"></script>
	<script type="text/javascript"
			src="<c:url value="/resources/interact/interact.js"/>"></script>
</head>
<body>
<c:if test="${param.error != null}">
	<p hidden id="condition">error</p>
</c:if>
<c:if test="${param.logout != null}">
	<p hidden id="condition">logout</p>
</c:if>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top"><a class="navbar-brand" href="/">Big-Picture</a>
	<ul class="navbar-nav ml-auto">
		<li class="nav-item"><a class="nav-link" href="/login">로그인</a></li>
	</ul>
</nav>
<section class="content-section-b">
	<hr style="margin-top:5%;"/><br/>
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<h3 style="padding-bottom:15px;">로그인</h3>
				<form:form method="POST" modelAttribute="user">
					<div class="form-group">
						<label>이메일</label>
						<input type="text" class="form-control" name="ssoId" required/>
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" class="form-control" name="password" required/>
					</div>
					<div class="form-group"><br/>
						<input type="submit" value="로그인" class="form-control btn btn-secondary"/>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
					<div class="form-group"><br/>
						<button type="button" data-toggle="modal" data-target="#pw-find-modal" class="form-control btn btn-secondary">비밀번호 찾기</button>
					</div>
					<div class="form-group"><br/>
						<label>Big-picture에 처음 이신가요?</label>
						<button type="button" data-toggle="modal" data-target="#signup-modal" class="form-control btn btn-info">회원가입</button>
					</div>
				</form:form>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</section>
<div id="pw-find-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 id="myModalLabel" class="modal-title">비밀번호 찾기</h4>
				<button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			</div>
			<form action="/userController/pwfind" method="post">
				<div class="modal-body">
					<div class="form-group">
						<label>이메일</label>
						<input type="email" name="email" placeholder="example@mail.com" class="form-control"/>
					</div>
					<label>입력한 이메일로 임시 비밀번호가 설정되어 보내집니다.</label>
				</div>
				<div class="modal-footer">
					<input type="submit" value="이메일로 전송" class="btn btn-primary"/>
				</div>
			</form>
		</div>
	</div>
</div>
<div id="signup-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 id="myModalLabel" class="modal-title">회원가입</h4>
				<button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
			</div>
			<form:form action="/signup" method="post" modelAttribute="user" accept-charset="UTF-8">
				<form:input type="hidden" path="id" id="id" />
				<div class="modal-body">
					<div class="form-group">
						<label>이메일</label>
						<form:input type="text" path="ssoId" id="ssoIdInput" placeholder="example@mail.com" class="form-control"/>
						<form:errors path="ssoId" cssClass="error" />
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<form:input type="password" path="password" id="passwordInput" placeholder="Password" class="form-control"/>
						<form:errors path="password" cssClass="error" />
					</div>
					<div class="form-group">
						<label>비밀번호 확인</label>
						<input type="password" id="passwordcheckInput" placeholder="Password" class="form-control"/>
					</div>
					<div class="form-group">
						<label>닉네임</label>
						<form:input type="text" path="name" id="nameInput" placeholder="Name" class="form-control"/>
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" value="가입하기" class="btn btn-primary" onClick="return checkValid()"/>
				</div>
			</form:form>
		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>
<script type="text/javascript"
		src="<c:url value="/resources/bootstrap/bootstrap.bundle.min.js"/>"></script>
<script type="text/javascript"
		src="<c:url value="/resources/bootstrap/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/app/sign.js"/>"></script>

</body>
</html>
