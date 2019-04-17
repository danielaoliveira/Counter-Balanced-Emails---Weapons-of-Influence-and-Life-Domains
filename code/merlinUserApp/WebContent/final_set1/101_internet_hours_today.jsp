<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - internet hours today</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">
	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>
<body>
	<div id='content'>
		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">

			<p class='question'>How many hours have you already spent on the internet today?</p>

			<input class='visible-elements' type="radio" name="hours_already_spent" value="1">1 <input class='visible-elements' type="radio" name="hours" value="2">2 <input class='visible-elements' type="radio" name="hours" value="3">3 <input class='visible-elements' type="radio" name="hours" value="4">4 <input class='visible-elements' type="radio" name="hours" value="5">5 <input class='visible-elements' type="radio" name="hours" value="6">6 <input class='visible-elements' type="radio" name="hours" value="7">7 <input class='visible-elements' type="radio" name="hours" value="8">8 <input class='visible-elements' type="radio" name="hours" value="9">9 <input class='visible-elements' type="radio" name="hours" value="10">10 <input class='visible-elements' type="radio" name="hours" value="11">11 <input class='visible-elements' type="radio" name="hours" value="12">12

			<p class='question'>What types of websites did you visit during your free browsing time?</p>
			<input class='visible-elements' type="text" name="websites_visited_freetime">

			<br><br>

			<input type="submit" value="Next >>" onclick="form_submit_function()">
				<%
					String emailAddr = request.getParameter("emailAddr");
					String userStudyDayNo = request.getParameter("userStudyDayNo");
					int calledFrom = Integer.parseInt(request.getParameter("pageNo"));
					int currPageNo = calledFrom + 1;
				%>
				
					<input type="hidden" name="emailAddr" value=<%=emailAddr %>></input>
					<input type="hidden" name="userStudyDayNo" value=<%=userStudyDayNo %>></input>
					<input type="hidden" name="pageNo" value=<%=currPageNo%>>
				
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