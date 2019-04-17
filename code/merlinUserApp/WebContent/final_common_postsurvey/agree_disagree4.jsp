<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - agree or disagree</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>
<body>
	<div id='content'>

		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">

			<h3 class='question'>A number of statements which people use to describe themselves, are given below. Read each statement and rate, using the numbers in the scale below, to indicate how you generally feel. There are no right or wrong answers. Do not spend too much time on any one statement but give the answer which seems to describe your present feelings best.</h3>

			<table border=1 cellpadding=10 cellspacing=5 rules=rows frame=hsides>
				<thead>
					<tr>
						<th></th>
						<th>Almost Never</th>
						<th>Sometimes</th>
						<th>Often</th>
						<th>Almost Always</th>
					</tr>
				</thead>

				<tbody>
					<tr>
					 	<td>Pleasant</td>
						<td><input class='visible-elements' type="radio" name="pleasant" value="1"></td>
						<td><input class='visible-elements' type="radio" name="pleasant" value="2"></td>
						<td><input class='visible-elements' type="radio" name="pleasant" value="3"></td>
						<td><input class='visible-elements' type="radio" name="pleasant" value="4"></td>
					</tr>

					<tr>
						<td>Nervous and restless</td>
						<td><input class='visible-elements' type="radio" name="nervous" value="1"></td>
						<td><input class='visible-elements' type="radio" name="nervous" value="2"></td>
						<td><input class='visible-elements' type="radio" name="nervous" value="3"></td>
						<td><input class='visible-elements' type="radio" name="nervous" value="4"></td>
					</tr>

					<tr>
						<td>Satisfied with myself</td>
						<td><input class='visible-elements' type="radio" name="satisfied" value="1"></td>
						<td><input class='visible-elements' type="radio" name="satisfied" value="2"></td>
						<td><input class='visible-elements' type="radio" name="satisfied" value="3"></td>
						<td><input class='visible-elements' type="radio" name="satisfied" value="4"></td>
					</tr>

					<tr>
						<td>I wish I could be as happy as others seem to be</td>
						<td><input class='visible-elements' type="radio" name="happyothers" value="1"></td>
						<td><input class='visible-elements' type="radio" name="happyothers" value="2"></td>
						<td><input class='visible-elements' type="radio" name="happyothers" value="3"></td>
						<td><input class='visible-elements' type="radio" name="happyothers" value="4"></td>
					</tr>

					<tr>
						<td>Like a failure</td>
						<td><input class='visible-elements' type="radio" name="failure" value="1"></td>
						<td><input class='visible-elements' type="radio" name="failure" value="2"></td>
						<td><input class='visible-elements' type="radio" name="failure" value="3"></td>
						<td><input class='visible-elements' type="radio" name="failure" value="4"></td>
					</tr>

					<tr>
						<td>Rested</td>
						<td><input class='visible-elements' type="radio" name="rested" value="1"></td>
						<td><input class='visible-elements' type="radio" name="rested" value="2"></td>
						<td><input class='visible-elements' type="radio" name="rested" value="3"></td>
						<td><input class='visible-elements' type="radio" name="rested" value="4"></td>
					</tr>

					<tr>
						<td>Calm, cool, and collected</td>
						<td><input class='visible-elements' type="radio" name="ccc" value="1"></td>
						<td><input class='visible-elements' type="radio" name="ccc" value="2"></td>
						<td><input class='visible-elements' type="radio" name="ccc" value="3"></td>
						<td><input class='visible-elements' type="radio" name="ccc" value="4"></td>
					</tr>

					<tr>
						<td>I feel that difficulties are piling up so that I cannot overcome them</td>
						<td><input class='visible-elements' type="radio" name="difficulties" value="1"></td>
						<td><input class='visible-elements' type="radio" name="difficulties" value="2"></td>
						<td><input class='visible-elements' type="radio" name="difficulties" value="3"></td>
						<td><input class='visible-elements' type="radio" name="difficulties" value="4"></td>
					</tr>

					<tr>
						<td>I worry too much over something that doesn't really matter</td>
						<td><input class='visible-elements' type="radio" name="worrytoomuch" value="1"></td>
						<td><input class='visible-elements' type="radio" name="worrytoomuch" value="2"></td>
						<td><input class='visible-elements' type="radio" name="worrytoomuch" value="3"></td>
						<td><input class='visible-elements' type="radio" name="worrytoomuch" value="4"></td>
					</tr>

					<tr>
						<td>Happy</td>
						<td><input class='visible-elements' type="radio" name="happy" value="1"></td>
						<td><input class='visible-elements' type="radio" name="happy" value="2"></td>
						<td><input class='visible-elements' type="radio" name="happy" value="3"></td>
						<td><input class='visible-elements' type="radio" name="happy" value="4"></td>
					</tr>

					<tr>
						<td>I have disturbing thoughts</td>
						<td><input class='visible-elements' type="radio" name="disturbing" value="1"></td>
						<td><input class='visible-elements' type="radio" name="disturbing" value="2"></td>
						<td><input class='visible-elements' type="radio" name="disturbing" value="3"></td>
						<td><input class='visible-elements' type="radio" name="disturbing" value="4"></td>
					</tr>

					<tr>
						<td>Lack self-confidence</td>
						<td><input class='visible-elements' type="radio" name="lacking" value="1"></td>
						<td><input class='visible-elements' type="radio" name="lacking" value="2"></td>
						<td><input class='visible-elements' type="radio" name="lacking" value="3"></td>
						<td><input class='visible-elements' type="radio" name="lacking" value="4"></td>
					</tr>

					<tr>
						<td>Secure</td>
						<td><input class='visible-elements' type="radio" name="secure" value="1"></td>
						<td><input class='visible-elements' type="radio" name="secure" value="2"></td>
						<td><input class='visible-elements' type="radio" name="secure" value="3"></td>
						<td><input class='visible-elements' type="radio" name="secure" value="4"></td>
					</tr>

					<tr>
						<td>I make decisions easily</td>
						<td><input class='visible-elements' type="radio" name="easyd" value="1"></td>
						<td><input class='visible-elements' type="radio" name="easyd" value="2"></td>
						<td><input class='visible-elements' type="radio" name="easyd" value="3"></td>
						<td><input class='visible-elements' type="radio" name="easyd" value="4"></td>
					</tr>

					<tr>
						<td>Inadequate</td>
						<td><input class='visible-elements' type="radio" name="inadq" value="1"></td>
						<td><input class='visible-elements' type="radio" name="inadq" value="2"></td>
						<td><input class='visible-elements' type="radio" name="inadq" value="3"></td>
						<td><input class='visible-elements' type="radio" name="inadq" value="4"></td>
					</tr>

					<tr>
						<td>Content</td>
						<td><input class='visible-elements' type="radio" name="content" value="1"></td>
						<td><input class='visible-elements' type="radio" name="content" value="2"></td>
						<td><input class='visible-elements' type="radio" name="content" value="3"></td>
						<td><input class='visible-elements' type="radio" name="content" value="4"></td>
					</tr>

					<tr>
						<td>Some unimportant thought runs through my mind and it bothers me</td>
						<td><input class='visible-elements' type="radio" name="unimp" value="1"></td>
						<td><input class='visible-elements' type="radio" name="unimp" value="2"></td>
						<td><input class='visible-elements' type="radio" name="unimp" value="3"></td>
						<td><input class='visible-elements' type="radio" name="unimp" value="4"></td>
					</tr>

					<tr>
						<td>I take disappointments so keenly that I can't put them out of my mind</td>
						<td><input class='visible-elements' type="radio" name="disapp" value="1"></td>
						<td><input class='visible-elements' type="radio" name="disapp" value="2"></td>
						<td><input class='visible-elements' type="radio" name="disapp" value="3"></td>
						<td><input class='visible-elements' type="radio" name="disapp" value="4"></td>
					</tr>

					<tr>
						<td>I am a steady person</td>
						<td><input class='visible-elements' type="radio" name="steady" value="1"></td>
						<td><input class='visible-elements' type="radio" name="steady" value="2"></td>
						<td><input class='visible-elements' type="radio" name="steady" value="3"></td>
						<td><input class='visible-elements' type="radio" name="steady" value="4"></td>
					</tr>

					<tr>
						<td>I get in a state of tension or turmoil as I think over my recent concerns or interests</td>
						<td><input class='visible-elements' type="radio" name="tension" value="1"></td>
						<td><input class='visible-elements' type="radio" name="tension" value="2"></td>
						<td><input class='visible-elements' type="radio" name="tension" value="3"></td>
						<td><input class='visible-elements' type="radio" name="tension" value="4"></td>
					</tr>
				</tbody>
			</table>

			<%
				String 	emailAddr 		= request.getParameter("emailAddr");
				String 	userStudyDayNo 	= request.getParameter("userStudyDayNo");
				int 	surveySet 		= Integer.parseInt(request.getParameter("surveySet"));
				int 	stateNo 		= (Integer) request.getAttribute("stateNo");
			
			%>
			
			<br><br>
			<input type="submit" value="Next >>" onclick="return form_submit_function()">
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

</html>