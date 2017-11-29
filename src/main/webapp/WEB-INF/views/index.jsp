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
<link
	href="<c:url value="/resources/bootstrap/bootstrap.min.css" />"
	rel="stylesheet" type="text/css" />

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>
<body>

<div id="main-content" class="container">
	<div class="row">
		<div class="col-md-6">
			<form class="form-inline">
				<div class="form-group">
					<label for="connect">WebSocket connection:</label>
					<button id="connect" class="btn btn-default" type="submit">Connect</button>
					<button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">Disconnect
					</button>
				</div>
			</form>
		</div>
		<div class="col-md-6">
			<form class="form-inline">
				<div class="form-group">
					<label for="name">What is your name?</label>
					<input type="text" id="name" class="form-control" placeholder="Your name here...">
				</div>
				<button id="send" class="btn btn-default" type="submit">Send</button>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<table id="conversation" class="table table-striped">
				<thead>
				<tr>
					<th>Greetings</th>
				</tr>
				</thead>
				<tbody id="greetings">
				</tbody>
			</table>
		</div>
	</div>
</div>



<script type="text/javascript"
	src="<c:url value="/resources/jquery/jquery-3.0.0.min.js"/>"></script>
<script type="text/javascript"
		src="<c:url value="/resources/bootstrap/bootstrap.bundle.min.js"/>"></script>
<script type="text/javascript"
		src="<c:url value="/resources/bootstrap/bootstrap.bundle.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/bootstrap/bootstrap.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/sockjs-client/sockjs.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/stompjs/stomp.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/app/app.js"/>"></script>
</body>
</html>
