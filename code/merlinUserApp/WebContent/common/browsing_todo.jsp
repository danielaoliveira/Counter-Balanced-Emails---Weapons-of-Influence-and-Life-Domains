<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - browsing todo</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>
<body>
	<div id='content'>

		<p class='intro'>Now, please use the internet for the next hour.  We would like you to spend your time as follows:</p>

		<ul class='intro'>
			<li><b>News, Other Information:</b> 15 minutes reading the news or any other informative source you would like.</li>
			<li><b>Entertainment, Social Media:</b> 15 minutes reading entertainment sources.  If you have a social media account, you're welcome to use that as well. </li>
			<li><b>Free Browsing:</b> 15 minutes of unstructured time for you to do what you would like on the Internet</li>
			<li><b>Check Emails:</b> 15 minutes checking, responding to, or sending emails</li>
		</ul>

		<div class='question'>Once you are done with these activities, please click the next button.</div>
			

		<input type="submit" value="Next >>" onclick="return form_submit_function()">
			<%
				String 	emailAddr 		= request.getParameter("emailAddr");
				String 	userStudyDayNo 	= request.getParameter("userStudyDayNo");
				int 	surveySet 		= Integer.parseInt(request.getParameter("surveySet"));
				int 	stateNo 		= (Integer) request.getAttribute("stateNo");
				
			%>
			
			<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">
				<input type="hidden" name="emailAddr" value=<%=emailAddr %>></input>
				<input type="hidden" name="userStudyDayNo" value=<%=userStudyDayNo %>></input>
				<input type="hidden" name="surveySet" value=<%=surveySet %>>
				<input type="hidden" name="stateNo" value=<%=stateNo%>>
				
			</form>
	</div><!-- content -->

	<div id='footer'>
		<div id='bottom-line' class='line'></div><br>
		<div id='contact-us'>Questions? Call 352-273-2134 or email projmerlin0@gmail.com<br>&copy; <a href="http://www.ufl.edu/" target="_blank" title="University of Florida">University of Florida</a>, Gainesville, FL 32611</div>
		<img id='bottom-logo' src="<c:url value="/styling/uf-logo_blue.png" />">
	</div>

</body>

<script src="jquery-2.1.4.js"></script>
<script src="<c:url value="/js/formsubmit.js" />"></script>

</html>