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
							<a href="#" class="brand-logo center">게시판</a>
							<ul id="nav-mobile" class="right hide-on-med-and-down">
                                <li><a href="<c:url value='/createpost' />">새 글 쓰기</a></li>
                            </ul>
						</div>
					</nav>
				</div>
				<div class="row">
					<table class="z-depth-1 boarded highlight responsive-table">
						<thead>
							<tr>
								<th>#</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성시간</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${posts}" var="post">
								<tr onClick="window.location='/post-${post.id}';">
									<td>${post.id}</td>
									<td>${post.title}</td>
									<td>${post.writerSsoId}</td>
									<td>${post.createTime}</td></a>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>
				<div class="row">
					<!-- hardcoded because i am so tired of thinking. TODO-->
					<c:if test="${param.page == null || param.page == 1}">
						<ul class="pagination center">
							<li class="disabled"><a href="#!"><i
									class="material-icons">chevron_left</i></a></li>
							<li class="active"><a href="#!">1</a></li>
							<c:if test="${maxpage > 5}">
								<c:forEach var="i" begin="2" end="5">
									<li class="waves-effect"><a
										href="<c:url value='/index?page=${i}' />"><c:out
												value="${i}" /></a></li>
								</c:forEach>
							</c:if>
							<c:if test="${maxpage <= 5}">
								<c:forEach var="i" begin="2" end="${maxpage}">
									<li class="waves-effect"><a
										href="<c:url value='/index?page=${i}' />"><c:out
												value="${i}" /></a></li>
								</c:forEach>
							</c:if>

							<c:if test="${maxpage == 1}">
								<li class="disabled"><a
									href="<c:url value='/index?page=${param.page+1}'/>"><i
										class="material-icons">chevron_right</i></a></li>
							</c:if>
							<c:if test="${maxpage > 1}">
								<li class="waves-effect"><a
									href="<c:url value='/index?page=${param.page+1}'/>"><i
										class="material-icons">chevron_right</i></a></li>
							</c:if>
						</ul>
					</c:if>
					<c:if test="${param.page == 2}">
						<ul class="pagination center">
							<li class="waves-effect"><a
								href="<c:url value='/index?page=${param.page - 1}'/>"><i
									class="material-icons">chevron_left</i></a></li>
							<li class="waves-effect"><a
								href="<c:url value='/index?page=${param.page-1}'/>">1</a></li>
							<li class="active"><a href="#!">2</a></li>
							<c:if test="${maxpage > 5}">
								<c:forEach var="i" begin="3" end="5">
									<li class="waves-effect"><a
										href="<c:url value='/index?page=${i}' />"><c:out
												value="${i}" /></a></li>
								</c:forEach>
							</c:if>
							<c:if test="${maxpage <= 5}">
								<c:forEach var="i" begin="3" end="${maxpage}">
									<li class="waves-effect"><a
										href="<c:url value='/index?page=${i}' />"><c:out
												value="${i}" /></a></li>
								</c:forEach>
							</c:if>
							<c:if test="${maxpage == 2}">
								<li class="disabled"><a
									href="<c:url value='/index?page=${param.page+1}'/>"><i
										class="material-icons">chevron_right</i></a></li>
							</c:if>
							<c:if test="${maxpage > 2}">
								<li class="waves-effect"><a
									href="<c:url value='/index?page=${param.page+1}'/>"><i
										class="material-icons">chevron_right</i></a></li>
							</c:if>
						</ul>
					</c:if>
					<c:if test="${param.page > 2}">
						<ul class="pagination center">
							<li class="waves-effect"><a
								href="<c:url value='/index?page=${param.page - 1}'/>"><i
									class="material-icons">chevron_left</i></a></li>
							<li class="waves-effect"><a
								href="<c:url value='/index?page=${param.page-2}'/>">${param.page-2}</a></li>
							<li class="waves-effect"><a
								href="<c:url value='/index?page=${param.page-1}'/>">${param.page-1}</a></li>
							<li class="active"><a href="#!">${param.page}</a></li>
							<c:if test="${maxpage > param.page+2}">
								<li class="waves-effect"><a
									href="<c:url value='/index?page=${param.page+1}'/>">${param.page+1}</a></li>
								<li class="waves-effect"><a
									href="<c:url value='/index?page=${param.page+2}'/>">${param.page+2}</a></li>
							</c:if>
							<c:if test="${maxpage <= param.page+2}">
								<c:forEach var="i" begin="${param.page+1}" end="${maxpage}">
									<li class="waves-effect"><a
										href="<c:url value='/index?page=${i}' />"><c:out
												value="${i}" /></a></li>
								</c:forEach>
							</c:if>
							<c:if test="${maxpage == param.page}">
								<li class="disabled"><a
									href="<c:url value='/index?page=${param.page+1}'/>"><i
										class="material-icons">chevron_right</i></a></li>
							</c:if>
							<c:if test="${maxpage > param.page}">
								<li class="waves-effect"><a
									href="<c:url value='/index?page=${param.page+1}'/>"><i
										class="material-icons">chevron_right</i></a></li>
							</c:if>
						</ul>
					</c:if>

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