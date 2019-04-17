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

			<h3 class='question'>A number of statements which people use to describe themselves, are given below. Read each statement and rate, using the numbers in the scale below, to indicate how you feel right now, that is, at this moment. There are no right or wrong answers. Do not spend too much time on any one statement but give the answer which seems to describe your present feelings best.</h3>

			<table border=1 cellpadding=10 cellspacing=5 rules=rows frame=hsides>
				<thead>
					<tr>
						<th></th>
						<th>Not At All</th>
						<th>Somewhat</th>
						<th>Moderately So</th>
						<th>Very Much So</th>
					</tr>
				</thead>

				<tbody>
					<tr>
					 	<td>Calm</td>
						<td><input class='visible-elements' type="radio" name="calm" value="1"></td>
						<td><input class='visible-elements' type="radio" name="calm" value="2"></td>
						<td><input class='visible-elements' type="radio" name="calm" value="3"></td>
						<td><input class='visible-elements' type="radio" name="calm" value="4"></td>
					</tr>

					<tr>
						<td>Secure</td>
						<td><input class='visible-elements' type="radio" name="secure" value="1"></td>
						<td><input class='visible-elements' type="radio" name="secure" value="2"></td>
						<td><input class='visible-elements' type="radio" name="secure" value="3"></td>
						<td><input class='visible-elements' type="radio" name="secure" value="4"></td>
					</tr>

					<tr>
						<td>Tense</td>
						<td><input class='visible-elements' type="radio" name="tense" value="1"></td>
						<td><input class='visible-elements' type="radio" name="tense" value="2"></td>
						<td><input class='visible-elements' type="radio" name="tense" value="3"></td>
						<td><input class='visible-elements' type="radio" name="tense" value="4"></td>
					</tr>

					<tr>
						<td>Strained</td>
						<td><input class='visible-elements' type="radio" name="strained" value="1"></td>
						<td><input class='visible-elements' type="radio" name="strained" value="2"></td>
						<td><input class='visible-elements' type="radio" name="strained" value="3"></td>
						<td><input class='visible-elements' type="radio" name="strained" value="4"></td>
					</tr>

					<tr>
						<td>At Ease</td>
						<td><input class='visible-elements' type="radio" name="ease" value="1"></td>
						<td><input class='visible-elements' type="radio" name="ease" value="2"></td>
						<td><input class='visible-elements' type="radio" name="ease" value="3"></td>
						<td><input class='visible-elements' type="radio" name="ease" value="4"></td>
					</tr>

					<tr>
						<td>Upset</td>
						<td><input class='visible-elements' type="radio" name="upset" value="1"></td>
						<td><input class='visible-elements' type="radio" name="upset" value="2"></td>
						<td><input class='visible-elements' type="radio" name="upset" value="3"></td>
						<td><input class='visible-elements' type="radio" name="upset" value="4"></td>
					</tr>

					<tr>
						<td>Worrying over possible misfortunes</td>
						<td><input class='visible-elements' type="radio" name="worry" value="1"></td>
						<td><input class='visible-elements' type="radio" name="worry" value="2"></td>
						<td><input class='visible-elements' type="radio" name="worry" value="3"></td>
						<td><input class='visible-elements' type="radio" name="worry" value="4"></td>
					</tr>

					<tr>
						<td>Satisfied</td>
						<td><input class='visible-elements' type="radio" name="satisfy" value="1"></td>
						<td><input class='visible-elements' type="radio" name="satisfy" value="2"></td>
						<td><input class='visible-elements' type="radio" name="satisfy" value="3"></td>
						<td><input class='visible-elements' type="radio" name="satisfy" value="4"></td>
					</tr>

					<tr>
						<td>Frightened</td>
						<td><input class='visible-elements' type="radio" name="fright" value="1"></td>
						<td><input class='visible-elements' type="radio" name="fright" value="2"></td>
						<td><input class='visible-elements' type="radio" name="fright" value="3"></td>
						<td><input class='visible-elements' type="radio" name="fright" value="4"></td>
					</tr>

					<tr>
						<td>Comfortable</td>
						<td><input class='visible-elements' type="radio" name="comfort" value="1"></td>
						<td><input class='visible-elements' type="radio" name="comfort" value="2"></td>
						<td><input class='visible-elements' type="radio" name="comfort" value="3"></td>
						<td><input class='visible-elements' type="radio" name="comfort" value="4"></td>
					</tr>

					<tr>
						<td>Self-confident</td>
						<td><input class='visible-elements' type="radio" name="selfc" value="1"></td>
						<td><input class='visible-elements' type="radio" name="selfc" value="2"></td>
						<td><input class='visible-elements' type="radio" name="selfc" value="3"></td>
						<td><input class='visible-elements' type="radio" name="selfc" value="4"></td>
					</tr>

					<tr>
						<td>Nervous</td>
						<td><input class='visible-elements' type="radio" name="nervous" value="1"></td>
						<td><input class='visible-elements' type="radio" name="nervous" value="2"></td>
						<td><input class='visible-elements' type="radio" name="nervous" value="3"></td>
						<td><input class='visible-elements' type="radio" name="nervous" value="4"></td>
					</tr>

					<tr>
						<td>Jittery</td>
						<td><input class='visible-elements' type="radio" name="jittery" value="1"></td>
						<td><input class='visible-elements' type="radio" name="jittery" value="2"></td>
						<td><input class='visible-elements' type="radio" name="jittery" value="3"></td>
						<td><input class='visible-elements' type="radio" name="jittery" value="4"></td>
					</tr>

					<tr>
						<td>Indecisive</td>
						<td><input class='visible-elements' type="radio" name="inde" value="1"></td>
						<td><input class='visible-elements' type="radio" name="inde" value="2"></td>
						<td><input class='visible-elements' type="radio" name="inde" value="3"></td>
						<td><input class='visible-elements' type="radio" name="inde" value="4"></td>
					</tr>

					<tr>
						<td>Relaxed</td>
						<td><input class='visible-elements' type="radio" name="relaxed" value="1"></td>
						<td><input class='visible-elements' type="radio" name="relaxed" value="2"></td>
						<td><input class='visible-elements' type="radio" name="relaxed" value="3"></td>
						<td><input class='visible-elements' type="radio" name="relaxed" value="4"></td>
					</tr>

					<tr>
						<td>Content</td>
						<td><input class='visible-elements' type="radio" name="content" value="1"></td>
						<td><input class='visible-elements' type="radio" name="content" value="2"></td>
						<td><input class='visible-elements' type="radio" name="content" value="3"></td>
						<td><input class='visible-elements' type="radio" name="content" value="4"></td>
					</tr>

					<tr>
						<td>Worried</td>
						<td><input class='visible-elements' type="radio" name="worried" value="1"></td>
						<td><input class='visible-elements' type="radio" name="worried" value="2"></td>
						<td><input class='visible-elements' type="radio" name="worried" value="3"></td>
						<td><input class='visible-elements' type="radio" name="worried" value="4"></td>
					</tr>

					<tr>
						<td>Confused</td>
						<td><input class='visible-elements' type="radio" name="confused" value="1"></td>
						<td><input class='visible-elements' type="radio" name="confused" value="2"></td>
						<td><input class='visible-elements' type="radio" name="confused" value="3"></td>
						<td><input class='visible-elements' type="radio" name="confused" value="4"></td>
					</tr>

					<tr>
						<td>Steady</td>
						<td><input class='visible-elements' type="radio" name="steady" value="1"></td>
						<td><input class='visible-elements' type="radio" name="steady" value="2"></td>
						<td><input class='visible-elements' type="radio" name="steady" value="3"></td>
						<td><input class='visible-elements' type="radio" name="steady" value="4"></td>
					</tr>

					<tr>
						<td>Pleasant</td>
						<td><input class='visible-elements' type="radio" name="pleasant" value="1"></td>
						<td><input class='visible-elements' type="radio" name="pleasant" value="2"></td>
						<td><input class='visible-elements' type="radio" name="pleasant" value="3"></td>
						<td><input class='visible-elements' type="radio" name="pleasant" value="4"></td>
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