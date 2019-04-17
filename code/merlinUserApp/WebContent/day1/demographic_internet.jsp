<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - demographic internet</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>

<body>
	<div id='content'>
		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">

		<p class='question'>How many hours per week do you normally use the Internet (outside of this study)?</p>
			<input id='radio1' type="radio" name="internet_hours" value="1" class='visible-elements'><label for='radio1'> 1</label>
			<input id='radio2' type="radio" name="internet_hours" value="2" class='visible-elements'><label for='radio2'> 2</label>
			<input id='radio3' type="radio" name="internet_hours" value="3" class='visible-elements'><label for='radio3'> 3</label>
			<input id='radio4' type="radio" name="internet_hours" value="4" class='visible-elements'><label for='radio4'> 4</label>
			<input id='radio5' type="radio" name="internet_hours" value="5" class='visible-elements'><label for='radio5'> 5</label>
			<input id='radio6' type="radio" name="internet_hours" value="6" class='visible-elements'><label for='radio6'> 6</label>
			<input id='radio7' type="radio" name="internet_hours" value="7" class='visible-elements'><label for='radio7'> 7</label>
			<input id='radio8' type="radio" name="internet_hours" value="8" class='visible-elements'><label for='radio8'> 8</label>
			<input id='radio9' type="radio" name="internet_hours" value="9" class='visible-elements'><label for='radio9'> 9</label>
			<input id='radio10' type="radio" name="internet_hours" value="10" class='visible-elements'><label for='radio10'> 10</label>

		<br>

		<p class='question'>What do you use the Internet for? (Browsing, checking mail, work, school, gaming, social media, shopping, etc.)</p>
			<input type="text" name="internet_used_for" class='visible-elements'>

		<br><br>

		<input type="submit" value="Next >>" onclick="return form_submit_function()">
			<%
				String 	emailAddr 		= request.getParameter("emailAddr");
				String 	userStudyDayNo 	= request.getParameter("userStudyDayNo");
				int 	surveySet 		= Integer.parseInt(request.getParameter("surveySet"));
				int 	stateNo 		= (Integer) request.getAttribute("stateNo");
			
			%>
		
			<input type="hidden" name="emailAddr" value=<%=emailAddr %>></input>
			<input type="hidden" name="userStudyDayNo" value=<%=userStudyDayNo %>></input>
			<input type="hidden" name="surveySet" value=<%=surveySet %>>
			<input type="hidden" name="stateNo" value=<%=stateNo%>>
			
		</form>
	</div> <!-- content -->

	<div id='footer'>
		<div id='bottom-line' class='line'></div><br>
		<div id='contact-us'>Questions? Call 352-273-2134 or email projmerlin0@gmail.com<br>&copy; <a href="http://www.ufl.edu/" target="_blank" title="University of Florida">University of Florida</a>, Gainesville, FL 32611</div>
		<img id='bottom-logo' src="<c:url value="/styling/uf-logo_blue.png" />">
	</div>

</body>

<script src="jquery-2.1.4.js"></script>
<script src="<c:url value="/js/formsubmit.js" />"></script>

</html>