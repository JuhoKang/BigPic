<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="<c:url value="/resources/materialize/css/materialize.min.css" />"
	rel="stylesheet" type="text/css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body>
	<nav>
		<div class="nav-wrapper orange">
			<a href="<c:url value='/index' />" class="brand-logo"> Example Board </a>
			<!-- <ul id="nav-mobile" class="right hide-on-med-and-down">
				<li><a href="sass.html">Sass</a></li>
				<li><a href="badges.html">Components</a></li>
				<li><a href="collapsible.html">JavaScript</a></li>
			</ul> -->
		</div>
	</nav>

	<div class="container">
		<br> <br>
		<div class="row">
			<div class="col s12 m12">
				<form:form method="POST" modelAttribute="post"
					accept-charset="UTF-8">
					<form:input type="hidden" path="writerSsoId" id="writerssoid" />
					<div class="row">
						<nav>
							<div class="nav-wrapper black">
								<label for="input1">제목</label>
								<form:input id="input1" type="text" path="title"
									class="brand-logo center"></form:input>
								
							</div>
						</nav>
					</div>
					<div class="row">
						<p class="z-depth-1">
							<label for="textarea1">밑에 글을 작성하세요</label>
							<form:textarea id="textarea1" type="text" path="content"
								class="materialize-textarea"></form:textarea>
							

						</p>

					</div>
					<div class="row">
						<input class="btn" type="submit" value="작성완료" class="" />
					</div>
					
					<form:errors path="title" />
					<form:errors path="content" />
				</form:form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="<c:url value="/resources/jquery/jquery-3.0.0.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/resources/materialize/js/materialize.min.js"/>"></script>
</body>
</html>