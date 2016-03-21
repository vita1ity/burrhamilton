<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta property="og:url" content="http://burrhamilton.io" />
	<meta property="og:type" content="website" />
	<meta property="og:title" content="Burrhamilton" />
	<meta id="meta-desc" property="og:description" content="Continuing the conversation  @burrhamilton" />
	<meta property="og:image" content="http://burrhamilton.io/public/images/share.jpg" />
	
	<title>Burrhamilton Discussion</title>
	<link href="/public/style.css" rel="stylesheet" type="text/css" />
	<script type='text/javascript' src='/public/js/modernizr.js'></script>
	
	<script type="text/javascript" src="/public/js/jquery.min.js"></script>
	<script type="text/javascript" src="/public/js/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="/public/js/jquery.jscrollpane.min.js"></script>
	<script type="text/javascript" src="/public/js/autosize.js"></script>
	<script type="text/javascript" src="/public/js/init.js"></script>
	
	<script src="/public/js/ajax.js" type="text/javascript"></script>
	<script src="/public/js/modal.js" type="text/javascript"></script>
	
	
</head>
<body>



<%@include file="header.jsp"%>
	
<div id="page-middle">
	<div class="wrapper">
		<!-- begin // .social_icons -->
		<div class="social_icons">
			<a href="" class="icons icon-share"></a>
			
			<a href="https://twitter.com/intent/tweet?text=Continuing the conversation @burrhamilton" 
				class="icons icon-t"
				target="_new"></a>
			
			<!-- <a href="#" class="icons icon-g"></a> -->
			<a class="icons icon-g" 
				href="https://plus.google.com/share?url=http://burrhamilton.io&
				title=Burrhamilton&
				summary=Continuing the conversation @burrhamilton&
				source=BurrHamilton" target="_new"></a>
				
			
			<a class="icons icon-f" href="https://www.facebook.com/sharer/sharer.php?
				u=burrhamilton.io&
				t=BurrHamilton"
				target="_new"></a>	
			<!-- <a class="fb-share-button icons icon-f" data-href="http://burrhamilton.io" ></a> -->
			<!-- <a href="#" class="icons icon-f"></a> -->
			
			<a class="icons icon-i" href="http://www.linkedin.com/shareArticle?mini=true&
				url=http://burrhamilton.io&
				title=Burrhamilton&
				summary=Continuing the conversation @burrhamilton&
				source=BurrHamilton" target="_new"> 
			</a>
			<!-- <a href="https://api.linkedin.com/v1/people/~/shares?format=json" class="icons icon-i"></a> -->
			
		</div>
		<!-- end // .social_icons -->
		
		<h1 class="title with-links">${question.question}</h1>
		
		<!-- begin // .row -->
		<div class="row">
			<!-- begin // .col (1) -->
			<div class="col">
				
				<p class="statement-text">${question.positiveStatement.statement}</p>
				<p><button class="btn open-positive-answer-modal"><span><span><span>AGREE + 
				<small>ANSWER</small></span></span></span></button></p>
				
				<div id="positiveAnswer" class="h300 textarea-jscroll scroll-pane">
					<c:forEach var="answer" items="${question.positiveStatement.answers}">
						<%@include file="answer.jsp"%>
					</c:forEach>
				</div>
					

			</div>
			<!-- end // .col (1) -->
			<!-- begin // .col (2) -->
			<div class="col">
				
				<p class="statement-text">${question.negativeStatement.statement}</p>
				<p><button class="btn open-negative-answer-modal"><span><span><span>AGREE + 
				<small>ANSWER</small></span></span></span></button></p>
				
				<div id="negativeAnswer" class="h300 textarea-jscroll scroll-pane">
					<c:forEach var="answer" items="${question.negativeStatement.answers}">
						<%@include file="answer.jsp"%>
					</c:forEach>
				</div>
					
			</div>
			<!-- end // .col (2) -->
		</div>
		<!-- end // .row -->
	</div>	
</div>



<!------------positive answer modal-------------->
<div class="modal-wrap modal-answer-positive">
    <div class="answer-block">
        <div class="answer-form-block">
            <div class="flipper">
                
                <div class="answer-form">
                    <div class="loader-box">
                        <div class="loader-inner">
                            <div></div>
                        </div>
                    </div>
                    <i class="close-modal" role="close_form">&times</i>

                    <h3>Positive Answer</h3>

					
					<p class="modal-error not-display"></p>
						

                    <div class="inputs-group">
                        
                       	<div class="h300 textarea-jscroll scroll-pane text-input">
                       		<textarea class="answerText" rows="10" cols="10" placeholder="Type your answer here..."></textarea>
                       	</div>
                        
                    </div>
                    
                    <c:url value="/answer" var="answerUrl"/>
                    
                    <button data-hover="" data-url="${answerUrl}" data-statement="${question.positiveStatement.id}"
                            class="btn enter-answer-button" role="button">
                        Enter
                    </button>
                    

                </div>
            </div>
        </div>
    </div>
</div>
<!----------------end modal---------->

<!------------negative answer modal-------------->
<div class="modal-wrap modal-answer-negative">
    <div class="answer-block">
        <div class="answer-form-block">
            <div class="flipper">
                
                <div class="answer-form">
                    <div class="loader-box">
                        <div class="loader-inner">
                            <div></div>
                        </div>
                    </div>
                    <i class="close-modal" role="close_form">&times</i>

                    <h3>Negative Answer</h3>

                    <p class="modal-error not-display"></p>

                   

                    <div class="inputs-group">
                        
                       	<div class="h300 textarea-jscroll scroll-pane text-input">
                       		<textarea class="answerText" rows="10" cols="10" placeholder="Type your answer here..."></textarea>
                       	</div>
                        
                    </div>
                    
                    <c:url value="/answer" var="answerUrl"/>
                    
                    <button data-hover="" data-url="${answerUrl}" data-statement="${question.negativeStatement.id}"
                            class="btn enter-answer-button" role="button">
                        Enter
                    </button>
                    

                </div>
            </div>
        </div>
    </div>
</div>
<!----------------end modal---------->

<%@include file="footer.jsp"%>

</body>
</html>