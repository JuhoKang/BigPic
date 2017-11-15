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
				<div class="row">
					<nav>
						<div class="nav-wrapper green">
							<a href="#" class="brand-logo center">${post.title}</a>
							<ul id="nav-mobile" class="right hide-on-med-and-down">
								<li><span>작성자 : ${post.writerSsoId}</span></li>
								<li><span>작성시간 : ${post.createTime}</span></li>
							</ul>
						</div>
					</nav>
				</div>
				<div class="row">
					<p style="word-break:break-all" class="z-depth-1">
					   ${post.content}
					</p>
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