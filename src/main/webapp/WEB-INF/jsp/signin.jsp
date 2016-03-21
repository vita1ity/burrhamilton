<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Burrhamilton SignIn</title>
	<link href="/public/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='/public/js/modernizr.js'></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
</head>
<body>

<%@include file="header.jsp"%>

<div id="page-middle">
	<div class="wrapper">
		
		<c:if test="${param.logout != null}">
			<div class="alert alert-info alert-dismissable">
			  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			  You have been logged out
			</div>
		    
	    </c:if>	
	    
	    <sec:authorize access="isAnonymous()">
	    	<div id="login-box">
			    <ul>  
			    
				   	<li><a href="/auth/facebook?scope=email">
				    	<img alt="Sign in with Facebook " src="/public/images/facebook_login.png">
				    </a></li>
				    
				    <li><a href="/auth/google?scope=
				    			https://www.googleapis.com/auth/userinfo.profile 
				    			https://www.googleapis.com/auth/userinfo.email">
				    	<img alt="Sign in with Google+ " src="/public/images/google_login.png">
				    </a></li>
				    
				    <li><a href="/auth/twitter">
				    	<img alt="Sign in with Twitter " src="/public/images/twitter_login.png">
				    </a></li>
				    
				    <li><a href="/auth/linkedin">
				    	<img alt="Sign in with Linkedin" src="/public/images/linkedin_login.png">
				    </a></li>
				    
				    
				</ul>
			</div>
    	</sec:authorize>
		
	</div>
</div>	
    
<%@include file="footer.jsp"%>

</body>
</html>