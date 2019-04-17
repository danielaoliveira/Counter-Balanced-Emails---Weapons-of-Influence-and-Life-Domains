<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - Thank You!</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>
<body>
	<div id='content'>

		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">

			<p>To draw conclusions, we will combine your results with data from other people. What this means is that we must ask you not to say anything about the study to anyone else. </p>
			
			<ul>
				<li>If you talk to other people about the purpose of the study and those people are later in the study, they may not respond naturally. </li>
				<li>As a result, we would not have valid data to draw conclusions.</li>
				<li>We want everyone to get some educational value out of this experiment. Thus, I am telling you what our true purpose and predictions are. However, if you tell someone else what happened and they participate in this study, then they won’t get the same experience that you have had. </li>
				<li>We hope you see why it is important not to tell anyone the purpose of the experiment.</li>
			</ul>
			
			<p>You may wonder what difference it makes to tell a friend or roommate or spouse because they will never be in the study, but they may tell someone else who will be in the study. We realize you may have an urge to tell people about what happened in this experiment. However, we ask that you not mention anything about the experiment.</p>
			
			<p>Thank you again for taking the time to participate in our research project. Your help is appreciated. </p>
			
			<p class='question'>Do you have any questions? Comments? Suggestions? </p>
			<input type="text" name="suggestions">
			
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