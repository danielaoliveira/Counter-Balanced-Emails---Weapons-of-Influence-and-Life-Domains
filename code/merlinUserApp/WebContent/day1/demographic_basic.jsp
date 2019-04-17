<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - demographic basic</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>

<body>
	

	<div id='content'>
		<form id="hidden_form" method="POST">

		<p class='instr'>First, we'd like to collect some demographic information about you.  Please answer to the best of your ability.</p>


		<p class='question'>Date of Birth:</p>
		<br>
			<input type="text" name="dob" value="" placeholder="MM-DD-YYYY" class='visible-elements'></input>
		<br>

		<p class='question'>Sex:</p>
			<input id='radio1' type="radio" name="sex" value="male" class='visible-elements'><label for='radio1'>Male</label>
			<input id='radio2' type="radio" name="sex" value="female" class='visible-elements'><label for'radio2'>Female</label>
		<br>

		<p class='question'>First Language:</p>
			<input type="text" name="first_lang" value="">
		<br>

		<p class='question'>Are you fluent in any other languages?</p>
			<input id='radio3' type="radio" name="fluent_other" value="yes" class='visible-elements'><label for='radio3'>Yes</label>
			<input id='radio4' type="radio" name="fluent_other" value="no" class='visible-elements'><label for='radio4'>No</label>
		<br>

		<p class='question'>If so, what age did you start learning English? (Enter N/A if English is only language)</p>
			<input type="text" name="age_learn" value="">

		<br><br>
		
		<input type="submit" value="Next >>" onclick='return submit_form()'>
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
	</div> <!-- closes content -->

	<div id='footer'>
		<div id='bottom-line' class='line'></div><br>
		<div id='contact-us'>Questions? Call 352-273-2134 or email projmerlin0@gmail.com<br>&copy; <a href="http://www.ufl.edu/" target="_blank" title="University of Florida">University of Florida</a>, Gainesville, FL 32611</div>
		<img id='bottom-logo' src="<c:url value="/styling/uf-logo_blue.png" />">
	</div>

</body>

<script src="jquery-2.1.4.js"></script>
<script src="<c:url value="/js/formsubmit.js" />"></script>
<!-- <script src="js/formsubmit.js"></script> -->

<!-- <script language="javascript" type="text/javascript">

	function form_submit_function() { 
		var formElement = document.getElementById('hidden_form');
		console.log(formElement);
		$(formElement).submit();
		return false; 
	};

</script> -->

</html>