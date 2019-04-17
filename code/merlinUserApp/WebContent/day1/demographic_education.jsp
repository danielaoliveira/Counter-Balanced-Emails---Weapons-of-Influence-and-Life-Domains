<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>

<body>
	<div id='content'>
		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">
			<p class='question'>Number of years of education:</p>
			<input type="text" name="edu_yrs">
			
			<br>
			
			<p class='question'>Highest form of degree:</p>
			<input id='radio1' type="radio" name="degree" value="1" class='answer'>
				<label for='radio1'>Less than high school</label><br>
			<input id='radio2' type="radio" name="degree" value="2">
				<label for='radio2'>High School</label><br>
			<input id='radio3' type="radio" name="degree" value="3">
				<label for='radio3'>Associates</label><br>
			<input id='radio4' type="radio" name="degree" value="4">
				<label for='radio4'>Bachelors</label><br>
			<input id='radio5' type="radio" name="degree" value="5">
				<label for='radio5'>Masters</label><br>
			<input id='radio6' type="radio" name="degree" value="6">
				<label for='radio6'>Doctorate</label><br>
			<input id='radio7' type="radio" name="degree" value="7">
				<label for='radio7'>Other Professional Degree</label><br>
			 
			<br>
			 
			<p class='question'>Current Employment Status:</p>
			<input id='radio8' type="radio" name="employed" value="1">
				<label for='radio8'>Employed</label><br>
			<input id='radio9' type="radio" name="employed" value="2">
				<label for='radio9'>Unemployed</label><br>
			<input id='radio10' type="radio" name="employed" value="3">
				<label for='radio10'>Retired</label><br>
			
			<p class='question'>What field (or fields) of work are/were you involved for the majority of your life?</p>
			<input type="text" name="fields_work">
			
			<p class='question'>Average Yearly Income:</p>
			<input id='radio11' type="radio" name="income" value="1">
				<label for='radio11'>< $40,000</label><br>
			<input id='radio12' type="radio" name="income" value="2">
				<label for='radio12'>$40,000 - $70,000</label><br>
			<input id='radio13' type="radio" name="income" value="3">
				<label for='radio13'>> $70,000</label><br>
			<input id='radio14' type="radio" name="income" value="4">
				<label for='radio14'>N/A</label><br>
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
<!-- <script language="javascript" type="text/javascript">

	function form_submit_function() { 
		var formElement = document.getElementById('hidden_form');
		console.log(formElement);
		$(formElement).submit();
		return false; 
	};

</script> -->

</html>