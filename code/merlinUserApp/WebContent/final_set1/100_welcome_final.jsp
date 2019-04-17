<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - welcome to final day</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">
	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>
<body>
	<div id='content'>
		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">

			<h3>Welcome to the final day of the Daily Internet Study!</h3>
			
			<p>Today, we will ask you complete a short series of questionairres as well as a rating task.  The session today will take about 1.5 to 2 hours.  As always, please use:</p>
			
			<ul>
				<li>Your computer</li>
				<li>Your browser</li>
				<li>Your personal email.</li>
			</ul>
			
			<p>If you use other computers or browsers, we can't track your internet usage, which means we will not be able to collect any data from you. </p>
			
			<p>When you are ready to proceed, click the next button.</p>
			
			<br><br>
			<input type="submit" value="Next >>" onclick="form_submit_function()">
				<%
					String emailAddr = request.getParameter("emailAddr");
					String userStudyDayNo = request.getParameter("userStudyDayNo");
					int calledFrom = Integer.parseInt(request.getParameter("pageNo"));
					
				%>
				
					<input type="hidden" name="emailAddr" value=<%=emailAddr %>></input>
					<input type="hidden" name="userStudyDayNo" value=<%=userStudyDayNo %>></input>
					<input type="hidden" name="pageNo" value="100">
					
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