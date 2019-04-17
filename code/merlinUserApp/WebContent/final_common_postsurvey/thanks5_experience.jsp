<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - US1 experience</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>
<body>
	<div id='content'>

		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">

			<p class='instr'>If you don't mind, we'd like to ask you some questions about your experience in our study:</p>
			
			<p class='question'>Were all of the activities and questions clear? If not, what confused you? </p>
			<input class='visible-elements' type="text" name="clear">
			
			<br>
			
			<p class='question'>Did you experience difficulty installing the web browser plugin? If yes, what troubled you? </p>
			<input class='visible-elements' type="text" name="plugin_difficulties">
			
			<br>
			
			<p class='question'>Have you heard of the term ‘social engineering’ before? If so, in which context? </p>
			<input class='visible-elements' type="text" name="social_engineering">
			
			<br>
			
			<p class='question'>Have you heard of the terms ‘Internet fraud’ or ‘cybercrime’ before? If so, in which context?</p>
			<input class='visible-elements' type="text" name="cybercrime">
			
			<br>
			
			<p class='question'>Were you suspicious of the real goal of this study?</p>
			<input class='visible-elements' type="text" name="suspicious">
			
			<br>
			
			<p class='question'>What was your reaction when you received a social engineering attack with some suspicious offer?</p>
			<input class='visible-elements' type="text" name="reaction1">
			
			<br>
			
			<p class='question'>What was your reaction when you recieved an alleged email from a banking institution or retailer store? Were you suspicious of fraud?  Why or why not?</p>
			<input class='visible-elements' type="text" name="reaction2">
			
			<br>
			
			<p class='question'>Why do you think Internet users become victims of social engineering attacks? </p>
			<input class='visible-elements' type="text" name="reasons_victims">
			
			<br>
			
			<p class='question'>Do you think participating in this study will change the way you do business or interact with people online?</p>
			<input class='visible-elements' type="text" name="behaviour_change">
			
			<br><br><br>
			
			<%
				String 	emailAddr 		= request.getParameter("emailAddr");
				String 	userStudyDayNo 	= request.getParameter("userStudyDayNo");
				int 	surveySet 		= Integer.parseInt(request.getParameter("surveySet"));
				int 	stateNo 		= (Integer) request.getAttribute("stateNo");
			
			%>

			<br><br>
			<input type="submit" value="Next >>" onclick="return form_submit_function()">
			<input type="hidden" name="emailAddr" value=<%=emailAddr %>></input>
			<input type="hidden" name="userStudyDayNo" value=<%=userStudyDayNo %>></input>
			<input type="hidden" name="surveySet" value=<%=surveySet %>>
			<input type="hidden" name="stateNo" value=<%=stateNo%>>
		
		</form>

	</div><!--content-->

	<div id='footer'>
		<div id='bottom-line' class='line'></div><br>
		<div id='contact-us'>Questions? Call 352-273-2134 or email projmerlin0@gmail.com<br>&copy; <a href="http://www.ufl.edu/" target="_blank" title="University of Florida">University of Florida</a>, Gainesville, FL 32611</div>
		<img id='bottom-logo' src="<c:url value="/styling/uf-logo_blue.png" />">
	</div>

</body>

<script src="<c:url value="jquery-2.1.4.js" />"></script>
<script src="<c:url value="/js/formsubmit.js" />"></script>

</html>