
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Burrhamilton SignUp</title>
	<link href="/public/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='/public/js/modernizr.js'></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script type='text/javascript' src='/public/js/validation.js'></script>
	
	
</head>
<body>

<%@include file="header.jsp"%>	
	
<!-- begin // #page-middle -->
<div id="page-middle">
	<div class="wrapper">
		<div id="signup-alert" class="not-display">
			<span id="signup-error-message"></span>
		</div>
		<div class="file-upload-form">
			<form:form modelAttribute="signupForm" method="POST" action="#" onsubmit="return validateSignUp()">
				<div class="row">
					<div class="col col-2-3">
						<p class="input-group">
							<form:label path="username">Screen Name</form:label>
							
							<span class="input-control">
								<form:input id="username" path="username" class="form-control" placeholder="Enter name" />
							</span>
							<span class="input-error"><form:errors cssClass="error" path="username" /></span>
						</p>
						
					</div>
					<div class="col col-1-3">
						<div class="file-upload-box fl-right">
							<figure><img src="${signupForm.imageUrl}" alt="/public/images/file-upload.png" /></figure>
							
						</div>
					</div>
				</div>
				<p>
					
					<form:label path="qualification">What qualifies you to answer questions?</form:label>
					<form:textarea id="qualification" path="qualification" class="h200 textarea-jscroll scroll-pane" 
						rows="10" cols="10" placeholder="Type something..." />
					<form:errors cssClass="error" path="qualification" />
					
				</p>
				<p><button class="btn" type="submit" ><span><span><span>CREATE<small>ACCOUNT</small></span></span></span></button></p>
			</form:form>
		</div>
	</div>
</div>
	

<%@include file="footer.jsp"%>

</body>
</html>