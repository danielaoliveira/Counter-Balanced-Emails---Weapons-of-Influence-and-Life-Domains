<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - demographic health</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>

<body>
	<div id='content'>
		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">

		<p class='question'>Do you exercise?</p>
			<input id='radio1' type="radio" name="exercise" value="Yes"><label for='radio1'>Yes</label><br>
			<input id='radio2' type="radio" name="exercise" value="No"><label for='radio2'>No</label><br>
		<br>

		<p class='question'>If so, how many hours per week?  (Enter N/A if not applicable)</p>
			<input type="text" name="ex_hours">
		<br>

		<p class='question'>On a scale from 1 to 10, with 1 being "Poor" and 10 being "Excellent," please rate your general physical health.</p>
			<input id='radio3' type="radio" name="phy" value="1"><label for='radio3'> 1</label>
			<input id='radio4' type="radio" name="phy" value="2"><label for='radio4'> 2</label>
			<input id='radio5' type="radio" name="phy" value="3"><label for='radio5'> 3</label>
			<input id='radio6' type="radio" name="phy" value="4"><label for='radio6'> 4</label>
			<input id='radio7' type="radio" name="phy" value="5"><label for='radio7'> 5</label>
			<input id='radio8' type="radio" name="phy" value="6"><label for='radio8'> 6</label>
			<input id='radio9' type="radio" name="phy" value="7"><label for='radio9'> 7</label>
			<input id='radio10' type="radio" name="phy" value="8"><label for='radio10'> 8</label>
			<input id='radio11' type="radio" name="phy" value="9"><label for='radio11'> 9</label>
			<input id='radio12' type="radio" name="phy" value="10"><label for='radio12'> 10</label>
		<br>

		<p class='question'>On a scale from 1 to 10, with 1 being "Poor" and 10 being "Excellent," please rate your mental health or mood.</p>
			<input id='radio13' type="radio" name="mental" value="1"><label for='radio13'> 1</label>
			<input id='radio14' type="radio" name="mental" value="2"><label for='radio14'> 2</label>
			<input id='radio15' type="radio" name="mental" value="3"><label for='radio15'> 3</label>
			<input id='radio16' type="radio" name="mental" value="4"><label for='radio16'> 4</label>
			<input id='radio17' type="radio" name="mental" value="5"><label for='radio17'> 5</label>
			<input id='radio18' type="radio" name="mental" value="6"><label for='radio18'> 6</label>
			<input id='radio19' type="radio" name="mental" value="7"><label for='radio19'> 7</label>
			<input id='radio20' type="radio" name="mental" value="8"><label for='radio20'> 8</label>
			<input id='radio21' type="radio" name="mental" value="9"><label for='radio21'> 9</label>
			<input id='radio22' type="radio" name="mental" value="10"><label for='radio22'> 10</label>

		<br>


		<p class='question'>Do you take any medications? </p>
			<input id='radio23' type="radio" name="medication" value="Yes"><label for='radio23'>Yes</label><br>
			<input id='radio24' type="radio" name="medication" value="No"><label for='radio24'>No</label><br>
		<br>

		<p class='question'>If so, which ones? (Enter N/A if not applicable)</p>
			<input type="text" name="medicines">
		<br>
		<br>

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