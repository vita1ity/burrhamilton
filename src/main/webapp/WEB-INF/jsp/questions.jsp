<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta property="og:url" content="http://burrhamilton.io" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="Burrhamilton" />
	<meta id="meta-desc" property="og:description" content="Continuing the conversation  @burrhamilton" />
	<meta property="og:image" content="http://burrhamilton.io/public/images/share.jpg" />
	
	<title>Burrhamilton Questions</title>
	<link href="/public/style.css" rel="stylesheet" type="text/css" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<!-- <script type="text/javascript" src="/public/js/jquery.min.js"></script> -->
	<!-- <script src="/public/js/jquery.dotdotdot.js" type="text/javascript"></script> --> 
	
	<script type='text/javascript' src='/public/js/modernizr.js'></script>
	
	<script type="text/javascript" src="/public/js/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="/public/js/jquery.jscrollpane.min.js"></script>
	<script type="text/javascript" src="/public/js/autosize.js"></script>
	<script type="text/javascript" src="/public/js/init.js"></script>
	
	<script type='text/javascript' src='/public/js/ajax.js'></script>
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
</head>
<body>

<%@include file="header.jsp"%>
	
	<div id="page-middle">
		<div class="wrapper">
		
		<div class="flash-message">
			<c:if test="${not empty flashMessage}">
				<div class="alert alert-${flashKind} alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
				  ${flashMessage}
				</div>
		  	</c:if>
		</div>	
		
		<c:forEach var="question" items="${allQuestions}">
			<div class="question">
				
				<fmt:parseDate value="${question.postDate}" pattern="yyyy-MM-dd" 
                          var="parsedDate" type="date" />

				<fmt:setLocale value="en_US" scope="session"/>
				<fmt:formatDate value="${parsedDate}" var="stdDatum" 
	                           type="date" pattern="MMMM dd" />
			
				<span class="date">${stdDatum}</span>
				
				<h2 class="title-short title with-author"><a href="/question/${question.id}">${question.question}</a></h2>
				<span class="author">${question.author.username}</span>
				<div class="statement">
					<div class="left-statement">
						<p class="statement-text statement-short">
							${question.positiveStatement.statement}
						</p>
						<div class="likes-box">
							<span class="likes">
								Likes <img alt="" src="/public/images/like_separator.png"> 
								${question.positiveStatement.likes}
							</span>
						</div>
					</div>
					
					<div class="right-statement">
						<p class="statement-text statement-short">
							${question.negativeStatement.statement}
						</p>
						<div class="likes-box">
							<span class="likes">
								Likes <img alt="" src="/public/images/like_separator.png"> 
								${question.negativeStatement.likes}
							</span>
						</div>
					</div>
				</div>
				
				<div class="clear"></div>
				
				<div class="delete-question">
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						
						<c:url value="/question/delete/${question.id}" var="deleteUrl"></c:url>
						<p><button class="btn delete-button" data-url="${deleteUrl}"><span><span><span>Delete</span></span></span></button></p> 
						
					</sec:authorize>
				</div>
				
				<hr align="center" class="shorter">
				<hr class="full">
				<hr align="center" class="shorter">
			</div>
		</c:forEach>
		</div>
	</div>
	
<%@include file="footer.jsp"%>	

</body>
</html>