<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - sample email</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>
<body>
	<div id='content'>
	<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">

	<h3>In the following task, we will present you a series of emails. Please read through each email and rate how interested you are in what the email has to say. </h3>
	
	<div name="email">
		<div name="subject" class='question'>Subject: Utilities Statements Now Online</div>
		<br>
		
		<div name="greeting">Hello Mr. Smith,</div>
		<br>
		
		<div name="mail-body">Your latest energy bill is now available to view online.  Account Number 245046885.  Total Amount Due: $524.30.  Due to changes in our policy, we require that you view your utilities statements online via the link below.  There are many options to pay your bill.  Sign up for the Automatic Payment Plan to have your payment automatically deducted from your bank or credit card.  Pay electronically online at the Account Center, visit an Authorized Payment Center or send a check by mail.  To view your most recent bill, please follow the link bellow.  You must login to your account or register for an online account to view your statment.</div>
		
		<p>Localenergy.com/login</p>
		
		<p>Sincerely,</p>
		
		<p>Alexander Cobb</p>
		
		Billing and Accounting Services Representative
	</div>
	
	<%
		String 	emailAddr 		= request.getParameter("emailAddr");
		String 	userStudyDayNo 	= request.getParameter("userStudyDayNo");
		int 	surveySet 		= Integer.parseInt(request.getParameter("surveySet"));
		int 	stateNo 		= (Integer) request.getAttribute("stateNo");

		
		String displayQuestion = "How interested are you in what this email has to say?";
		
		if (stateNo == 205)
			displayQuestion = "How interested are you in what this email has to say?";
		else if (stateNo == 227)
			displayQuestion = "How likely are you to click on a link in this email?";
		else
			displayQuestion = "How convincing is the content of this email?";
	%>
	
	<div name="question">
		<h4><%=displayQuestion %></h4>
		
		<p>You will see the options:</p>
		
		<ul>
			<li>(1) Not At All</li>
			<li>(2) A Little</li>
			<li>(3) Somewhat</li>
			<li>(4) Quite a Bit</li>
			<li>(5) Very Much</li>
		</ul>
	</div>

		<br><br><input type="submit" value="Next >>" onclick="return form_submit_function()">
			
		
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
<!-- <script language="javascript" type="text/javascript">

	function form_submit_function() { 
		var formElement = document.getElementById('hidden_form');
		console.log(formElement);
		$(formElement).submit();
		return false; 
	};

</script> -->

</html>