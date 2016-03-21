<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- begin // #page-header -->
<header id="page-header">
	<div class="wrapper">
		<a href="/" class="logo"></a><!-- header logo -->
		
		<!-- begin // header menu -->
		<nav class="menu">
			<a href="#" class="menu-mobile-link"></a>
			<ul>
				<li><a href="/">HOME</a></li>
				<li><a href="/write">WRITE</a></li>
				<li><a href="/about">ABOUT</a></li>
				
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li id="addQuestion"><a href="/question/add">ADD</a></li>
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
			 		<c:url var="logoutUrl" value="/logout" />
			 		<li>
				       	<form:form	id="logoutForm" action="${logoutUrl}" method="POST">
				       		<input class="header-link" type="submit" value="LOGOUT">
						</form:form>
					</li>
				</sec:authorize>
			
			</ul>
		</nav>
		<!-- end // header menu  -->
		
		<!-- begin // header signup-login-nav -->
		<sec:authorize access="isAnonymous()">
			<nav class="signup-login-nsv">
				<ul>
					<li><a href="/signin">LOGIN</a></li>
					<li><a href="/signin">SIGN UP</a></li>
				</ul>
			</nav>
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
			
			<div class="user-block">
				<a href="#" class="header-user"><sec:authentication property="principal.user.username" /></a>
				<img alt="user image" class="user-image"  src="<sec:authentication property="principal.user.imageUrl" />">
			</div>
		</sec:authorize>
	</div>
	
	
</header>
