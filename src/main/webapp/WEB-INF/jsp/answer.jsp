<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="answer">
	<div class="votes">
		Votes: <span class="votes-num">${answer.votesNum}</span>
	</div>
	
	<div class="answer-text">
		${answer.answer}
	</div>
	
	<div class="answer-buttons">
		<sec:authorize access="isAnonymous()">
			<span id="notRegistered"></span>
			<c:url value="/answer/vote/${answer.id}" var="voteUrl"/>
			<button title="Upvote answer" class="not-registered answer-button vote center-vote" data-url="${voteUrl}"></button>
			
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">	
			<c:set var="alreadyVoted" value="false"/>
			<c:set var="loginedUser">
				<sec:authentication property = "principal.user.uniqueKey"/>
			</c:set>
			
			<c:forEach var="votedUser" items="${answer.userVoteSet}">
			
				<c:if test="${votedUser.uniqueKey eq loginedUser}">
					
					<c:set var="alreadyVoted" value="true"/>
					
				</c:if>
			</c:forEach>
			
			
			<sec:authorize access="hasRole('ROLE_USER')">
				<c:if test="${alreadyVoted eq false }">
					<c:url value="/answer/vote/${answer.id}" var="voteUrl"/>
					<button title="Upvote answer" class="answer-button vote center-vote" data-url="${voteUrl}"></button>
				</c:if>
				
				<c:if test="${alreadyVoted eq true }">
					<c:url value="/answer/vote/${answer.id}" var="voteUrl"/>
					<button title="Answer already upvoted" class="vote-disabled-center " disabled data-url="${voteUrl}"></button>
				</c:if>
			</sec:authorize>
			
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				
				<c:if test="${alreadyVoted eq false }">
					<c:url value="/answer/vote/${answer.id}" var="voteUrl"/>
					<button title="Upvote answer" class="answer-button vote left-vote" data-url="${voteUrl}"></button>
				</c:if>
				
				<c:if test="${alreadyVoted eq true }">
					<c:url value="/answer/vote/${answer.id}" var="voteUrl"/>
					<button title="Answer already upvoted" class="vote-disabled-left" disabled data-url="${voteUrl}"></button>
				</c:if>
				
				
				<c:url value="/answer/delete/${answer.id}" var="deleteUrl"></c:url>
				<button title="Delete answer" class="answer-button answer-delete-button" data-url="${deleteUrl}" ></button>
				
			</sec:authorize>
		</sec:authorize>
	</div>
</div>