<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

			<div class='question'>Please give us an honest approximation of how many minutes you spent on each activity during the hour-long period today. </div>

				<table border=1 cellpadding=10 cellspacing=5 rules=rows frame=hsides>
				 	<thead>
						<tr>
							<th></th>
							<th>0 mins</th>
							<th>10 mins</th>
							<th>20 mins</th>
							<th>30 mins</th>
							<th>40 mins</th>
							<th>50 mins</th>
							<th>60 mins</th>
						</tr>
					</thead>

				 	<tbody>
						<tr>
					 		<td>News, Other Information</td>
					 		<td><input type="radio" name="news" value="0"></td>
							<td><input type="radio" name="news" value="10"></td>
							<td><input type="radio" name="news" value="20"></td>
							<td><input type="radio" name="news" value="30"></td>
							<td><input type="radio" name="news" value="40"></td>
							<td><input type="radio" name="news" value="50"></td>
							<td><input type="radio" name="news" value="60"></td>
						</tr>

						<tr>
					 		<td>Entertainment, Social Media</td>
					 		<td><input type="radio" name="ent" value="0"></td>
							<td><input type="radio" name="ent" value="10"></td>
							<td><input type="radio" name="ent" value="20"></td>
							<td><input type="radio" name="ent" value="30"></td>
							<td><input type="radio" name="ent" value="40"></td>
							<td><input type="radio" name="ent" value="50"></td>
							<td><input type="radio" name="ent" value="60"></td>
						</tr>

						<tr>
					 		<td>Free Browsing</td>
					 		<td><input type="radio" name="free" value="0"></td>
							<td><input type="radio" name="free" value="10"></td>
							<td><input type="radio" name="free" value="20"></td>
							<td><input type="radio" name="free" value="30"></td>
							<td><input type="radio" name="free" value="40"></td>
							<td><input type="radio" name="free" value="50"></td>
							<td><input type="radio" name="free" value="60"></td>
						</tr>

						<tr>
					 		<td>Check Email</td>
					 		<td><input type="radio" name="mails" value="0"></td>
							<td><input type="radio" name="mails" value="10"></td>
							<td><input type="radio" name="mails" value="20"></td>
							<td><input type="radio" name="mails" value="30"></td>
							<td><input type="radio" name="mails" value="40"></td>
							<td><input type="radio" name="mails" value="50"></td>
							<td><input type="radio" name="mails" value="60"></td>
						</tr>
					</tbody>
				</table>

			<br><div class='question'>Leave us a note here if you have any comments, concerns, or issues.  When you're done, please click the forward button below to finish today's survey!</div>
			<input type="text" name="comments">

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
		</div><!--content-->

		<div id='footer'>
			<div id='bottom-line' class='line'></div><br>
			<div id='contact-us'>Questions? Call 352-273-2134 or email projmerlin0@gmail.com<br>&copy; <a href="http://www.ufl.edu/" target="_blank" title="University of Florida">University of Florida</a>, Gainesville, FL 32611</div>
			<img id='bottom-logo' src="<c:url value="/styling/uf-logo_blue.png" />">
		</div>

</body>

<script src="jquery-2.1.4.js"></script>
<script src="<c:url value="/js/formsubmit.js" />"></script>

</html>