<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Burrhamilton Add Question</title>
	<link href="/public/style.css" rel="stylesheet" type="text/css" />
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	
	<script src="/public/js/ajax.js" type="text/javascript"></script>
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="/public/js/init.js"></script>
	
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
		
		
		<h1 class="title-middle">Add Question</h1>
		
		<div class="add-question-form">
			<form:form modelAttribute="questionForm" role="form" method="POST" onsubmit="return formatText();">
				<div class="row">
					<!-- <div class="col"> -->
					
						<p>
					
							<form:label path="title">Question title</form:label>
							<form:textarea id="title" path="title" class="h200 textarea-jscroll scroll-pane" 
								rows="10" cols="10" placeholder="Type title of the question..." required="true" />
							<form:errors cssClass="error" path="title" />
							
						</p>
						<p>
					
							<form:label path="positiveStatement">Positive statement</form:label>
							<form:textarea id="positiveStatement" path="positiveStatement" class="h200 textarea-jscroll scroll-pane" 
								rows="10" cols="10" placeholder="Type positive statement..." required="true" />
							<form:errors cssClass="error" path="positiveStatement" />
							
						</p>
						<p>
					
							<form:label path="negativeStatement">Negative statement</form:label>
							<form:textarea id="negativeStatement" path="negativeStatement" class="h200 textarea-jscroll scroll-pane" 
								rows="10" cols="10" placeholder="Type negative statement..." required="true" />
							<form:errors cssClass="error" path="negativeStatement" />
							
						</p>
						
						
						
						<p><button id="saveQuestion" class="btn" type="submit">
							<span><span><span>SAVE<small>QUESTION</small></span></span></span>
						</button></p>
					<!-- </div> -->
				</div>
			</form:form>
			
		</div>
		
		
	</div> 
</div>
<%@include file="footer.jsp"%>

</body>
</html>