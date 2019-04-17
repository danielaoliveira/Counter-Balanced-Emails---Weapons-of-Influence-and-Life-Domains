<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - after browsing</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">
	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>
<body>
	<div id='content'>

		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">

			<h4>Please give us an honest approximation of how many minutes you spent on each activity during the hour-long period today. </h4>

			 <div>News, Other Information		<input class='visible-elements' type="radio" name="news" value="0">0
								<input class='visible-elements' type="radio" name="news" value="10">10
								<input class='visible-elements' type="radio" name="news" value="20">20
								<input class='visible-elements' type="radio" name="news" value="30">30
								<input class='visible-elements' type="radio" name="news" value="40">40
								<input class='visible-elements' type="radio" name="news" value="50">50
								<input class='visible-elements' type="radio" name="news" value="60">60
								</div>
			<br>

			<div>Entertainment, Social Media	<input class='visible-elements' type="radio" name="ent" value="0">0
								<input class='visible-elements' type="radio" name="ent" value="10">10
								<input class='visible-elements' type="radio" name="ent" value="20">20
								<input class='visible-elements' type="radio" name="ent" value="30">30
								<input class='visible-elements' type="radio" name="ent" value="40">40
								<input class='visible-elements' type="radio" name="ent" value="50">50
								<input class='visible-elements' type="radio" name="ent" value="60">60
								</div>
			<br>

			<div>Free Browsing		<input class='visible-elements' type="radio" name="free" value="0">0
								<input class='visible-elements' type="radio" name="free" value="10">10
								<input class='visible-elements' type="radio" name="free" value="20">20
								<input class='visible-elements' type="radio" name="free" value="30">30
								<input class='visible-elements' type="radio" name="free" value="40">40
								<input class='visible-elements' type="radio" name="free" value="50">50
								<input class='visible-elements' type="radio" name="free" value="60">60
								</div>
			<br>

			<div>Check Email	<input class='visible-elements' type="radio" name="mails" value="0">0
								<input class='visible-elements' type="radio" name="mails" value="10">10
								<input class='visible-elements' type="radio" name="mails" value="20">20
								<input class='visible-elements' type="radio" name="mails" value="30">30
								<input class='visible-elements' type="radio" name="mails" value="40">40
								<input class='visible-elements' type="radio" name="mails" value="50">50
								<input class='visible-elements' type="radio" name="mails" value="60">60
								</div>
			<br>

			<p>Leave us a note here if you have any comments, concerns, or issues.  When you're done, please click the forward button below to finish today's survey!</p>
			<input class='visible-elements' type="text" name="comments">

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