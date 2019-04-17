<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - demographic life</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>

<body>
	<div id='content'>
		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">
			<p class='question'>Racial Category:</p>
				<input id='radio1' type="radio" name="racial" value="1">
					<label for='radio1'>American Indian or Alaskan Native</label><br>
				<input id='radio2' type="radio" name="racial" value="2">
					<label for='radio2'>Asian</label><br>
				<input id='radio3' type="radio" name="racial" value="3">
					<label for='radio3'>Black or African American</label><br>
				<input id='radio4' type="radio" name="racial" value="4">
					<label for='radio4'>Native Hawaiian or Other Pacific Islander</label><br>
				<input id='radio5' type="radio" name="racial" value="5">
					<label for='radio5'>Hispanic</label><br>
				<input id='radio6' type="radio" name="racial" value="6">
					<label for='radio6'>White</label><br>
				<input id='radio7' type="radio" name="racial" value="7">
					<label for='radio7'>Other</label><br>
				
				<br>
				
			<p class='question'>Marital Status:</p>
				<input id='radio8' type="radio" name="marital" value="1">
					<label for='radio8'>Single</label><br>
				<input id='radio9' type="radio" name="marital" value="2">
					<label for='radio9'>In a relationship, but not married</label><br>
				<input id='radio10' type="radio" name="marital" value="3">
					<label for='radio10'>Married</label><br>
				<input id='radio11' type="radio" name="marital" value="4">
					<label for='radio11'>Divorced/Separated</label><br>
				<input id='radio12' type="radio" name="marital" value="5">
					<label for='radio12'>Widowed</label><br>

			<br>

			<p class='question'>Living Condition:</p>	
				<input id='radio13' type="radio" name="living" value="1">
					<label for='radio13'>Alone</label><br>
				<input id='radio14' type="radio" name="living" value="2">
					<label for='radio14'>With roommates</label><br>
				<input id='radio15' type="radio" name="living" value="3">
					<label for='radio15'>With romantic partner/spouse</label><br>
				<input id='radio16' type="radio" name="living" value="4">
					<label for='radio16'>With children</label><br>
				<input id='radio17' type="radio" name="living" value="5">
					<label for='radio17'>Assisted Living</label><br>
				<input id='radio18' type="radio" name="living" value="6">
					<label for='radio18'>Other</label><br>
				
			<br>

			<p class='question'>Do you have any children?</p>
				<input id='radio19' type="radio" name="children" value="Yes"><label for='radio19'>Yes</label><br>
				<input id='radio20' type="radio" name="children" value="No"><label for='radio20'>No</label><br>
			<br>

			<p class='question'>If so, how many? (Enter N/A if not applicable)</p>
				<input type="text" name="num_children">

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