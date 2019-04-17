<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - feelings and emotions</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">
	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>
<body>
	<div id='content'>

		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">
			<p>The following words on the left describe different feelings and emotions.</p>
			<p>Read each item and then indicate to what extent you feel this way right now, that is, at the present moment.  Mark the appropriate bubble.</p>

			<h4>Very Slightly or Not at All, A Little, Moderately, Quite a Bit, Extremely</h4>

			<br>


			<div>
			 
			 <div>Interested		<input class='visible-elements' type="radio" name="interested" value="1">
								<input class='visible-elements' type="radio" name="interested" value="2">
								<input class='visible-elements' type="radio" name="interested" value="3">
								<input class='visible-elements' type="radio" name="interested" value="4">
								<input class='visible-elements' type="radio" name="interested" value="5">
								</div>
			<br>

			<div>Distressed	<input class='visible-elements' type="radio" name="distressed" value="1">
								<input class='visible-elements' type="radio" name="distressed" value="2">
								<input class='visible-elements' type="radio" name="distressed" value="3">
								<input class='visible-elements' type="radio" name="distressed" value="4">
								<input class='visible-elements' type="radio" name="distressed" value="5">
								</div>
			<br>

			<div>Excited		<input class='visible-elements' type="radio" name="excited" value="1">
								<input class='visible-elements' type="radio" name="excited" value="2">
								<input class='visible-elements' type="radio" name="excited" value="3">
								<input class='visible-elements' type="radio" name="excited" value="4">
								<input class='visible-elements' type="radio" name="excited" value="5">
								</div>
			<br>

			<div>Happy	<input class='visible-elements' type="radio" name="happy" value="1">
								<input class='visible-elements' type="radio" name="happy" value="2">
								<input class='visible-elements' type="radio" name="happy" value="3">
								<input class='visible-elements' type="radio" name="happy" value="4">
								<input class='visible-elements' type="radio" name="happy" value="5">
								</div>
			<br>

			<div>Upset			<input class='visible-elements' type="radio" name="upset" value="1">
								<input class='visible-elements' type="radio" name="upset" value="2">
								<input class='visible-elements' type="radio" name="upset" value="3">
								<input class='visible-elements' type="radio" name="upset" value="4">
								<input class='visible-elements' type="radio" name="upset" value="5">
								</div>
			<br>

			<div >Strong		<input class='visible-elements' type="radio" name="strong" value="1">
								<input class='visible-elements' type="radio" name="strong" value="2">
								<input class='visible-elements' type="radio" name="strong" value="3">
								<input class='visible-elements' type="radio" name="strong" value="4">
								<input class='visible-elements' type="radio" name="strong" value="5">
								</div>
			<br>

			<div>Guilty		<input class='visible-elements' type="radio" name="guilty" value="1">
								<input class='visible-elements' type="radio" name="guilty" value="2">
								<input class='visible-elements' type="radio" name="guilty" value="3">
								<input class='visible-elements' type="radio" name="guilty" value="4">
								<input class='visible-elements' type="radio" name="guilty" value="5">
								</div>
			<br>
			 
			</div>
			<br><br>

			<div>
			 <div>Scared		<input class='visible-elements' type="radio" name="scared" value="1">
								<input class='visible-elements' type="radio" name="scared" value="2">
								<input class='visible-elements' type="radio" name="scared" value="3">
								<input class='visible-elements' type="radio" name="scared" value="4">
								<input class='visible-elements' type="radio" name="scared" value="5">
								</div>
			<br>

			<div>Downhearted	<input class='visible-elements' type="radio" name="downhearted" value="1">
								<input class='visible-elements' type="radio" name="downhearted" value="2">
								<input class='visible-elements' type="radio" name="downhearted" value="3">
								<input class='visible-elements' type="radio" name="downhearted" value="4">
								<input class='visible-elements' type="radio" name="downhearted" value="5">
								</div>
			<br>

			<div>Hostile		<input class='visible-elements' type="radio" name="hostile" value="1">
								<input class='visible-elements' type="radio" name="hostile" value="2">
								<input class='visible-elements' type="radio" name="hostile" value="3">
								<input class='visible-elements' type="radio" name="hostile" value="4">
								<input class='visible-elements' type="radio" name="hostile" value="5">
								</div>
			<br>

			<div>Enthusiastic	<input class='visible-elements' type="radio" name="enthu" value="1">
								<input class='visible-elements' type="radio" name="enthu" value="2">
								<input class='visible-elements' type="radio" name="enthu" value="3">
								<input class='visible-elements' type="radio" name="enthu" value="4">
								<input class='visible-elements' type="radio" name="enthu" value="5">
								</div>
			<br>

			<div>Proud			<input class='visible-elements' type="radio" name="proud" value="1">
								<input class='visible-elements' type="radio" name="proud" value="2">
								<input class='visible-elements' type="radio" name="proud" value="3">
								<input class='visible-elements' type="radio" name="proud" value="4">
								<input class='visible-elements' type="radio" name="proud" value="5">
								</div>
			<br>

			<div >Frustrated		<input class='visible-elements' type="radio" name="frus" value="1">
								<input class='visible-elements' type="radio" name="frus" value="2">
								<input class='visible-elements' type="radio" name="frus" value="3">
								<input class='visible-elements' type="radio" name="frus" value="4">
								<input class='visible-elements' type="radio" name="frus" value="5">
								</div>
			<br>

			<div>Irritable		<input class='visible-elements' type="radio" name="irri" value="1">
								<input class='visible-elements' type="radio" name="irri" value="2">
								<input class='visible-elements' type="radio" name="irri" value="3">
								<input class='visible-elements' type="radio" name="irri" value="4">
								<input class='visible-elements' type="radio" name="irri" value="5">
								</div>
			<br>
			</div>

			<br><br>

			<div>
			 <div>Alert		<input class='visible-elements' type="radio" name="alert" value="1">
								<input class='visible-elements' type="radio" name="alert" value="2">
								<input class='visible-elements' type="radio" name="alert" value="3">
								<input class='visible-elements' type="radio" name="alert" value="4">
								<input class='visible-elements' type="radio" name="alert" value="5">
								</div>
			<br>

			<div>Ashamed	<input class='visible-elements' type="radio" name="ashamed" value="1">
								<input class='visible-elements' type="radio" name="ashamed" value="2">
								<input class='visible-elements' type="radio" name="ashamed" value="3">
								<input class='visible-elements' type="radio" name="ashamed" value="4">
								<input class='visible-elements' type="radio" name="ashamed" value="5">
								</div>
			<br>

			<div>Inspired		<input class='visible-elements' type="radio" name="inspired" value="1">
								<input class='visible-elements' type="radio" name="inspired" value="2">
								<input class='visible-elements' type="radio" name="inspired" value="3">
								<input class='visible-elements' type="radio" name="inspired" value="4">
								<input class='visible-elements' type="radio" name="inspired" value="5">
								</div>
			<br>

			<div>Sad	<input class='visible-elements' type="radio" name="sad" value="1">
								<input class='visible-elements' type="radio" name="sad" value="2">
								<input class='visible-elements' type="radio" name="sad" value="3">
								<input class='visible-elements' type="radio" name="sad" value="4">
								<input class='visible-elements' type="radio" name="sad" value="5">
								</div>
			<br>

			<div>Nervous			<input class='visible-elements' type="radio" name="nervous" value="1">
								<input class='visible-elements' type="radio" name="nervous" value="2">
								<input class='visible-elements' type="radio" name="nervous" value="3">
								<input class='visible-elements' type="radio" name="nervous" value="4">
								<input class='visible-elements' type="radio" name="nervous" value="5">
								</div>
			<br>

			<div >Determined		<input class='visible-elements' type="radio" name="det" value="1">
								<input class='visible-elements' type="radio" name="det" value="2">
								<input class='visible-elements' type="radio" name="det" value="3">
								<input class='visible-elements' type="radio" name="det" value="4">
								<input class='visible-elements' type="radio" name="det" value="5">
								</div>
			<br>

			<div>Attentive		<input class='visible-elements' type="radio" name="attentive" value="1">
								<input class='visible-elements' type="radio" name="attentive" value="2">
								<input class='visible-elements' type="radio" name="attentive" value="3">
								<input class='visible-elements' type="radio" name="attentive" value="4">
								<input class='visible-elements' type="radio" name="attentive" value="5">
								</div>
			<br>
			</div>

			<br><br>

			<div>
			 <div>Content		<input class='visible-elements' type="radio" name="content" value="1">
								<input class='visible-elements' type="radio" name="content" value="2">
								<input class='visible-elements' type="radio" name="content" value="3">
								<input class='visible-elements' type="radio" name="content" value="4">
								<input class='visible-elements' type="radio" name="content" value="5">
								</div>
			<br>

			<div>Jittery	<input class='visible-elements' type="radio" name="jittery" value="1">
								<input class='visible-elements' type="radio" name="jittery" value="2">
								<input class='visible-elements' type="radio" name="jittery" value="3">
								<input class='visible-elements' type="radio" name="jittery" value="4">
								<input class='visible-elements' type="radio" name="jittery" value="5">
								</div>
			<br>

			<div>Active		<input class='visible-elements' type="radio" name="active" value="1">
								<input class='visible-elements' type="radio" name="active" value="2">
								<input class='visible-elements' type="radio" name="active" value="3">
								<input class='visible-elements' type="radio" name="active" value="4">
								<input class='visible-elements' type="radio" name="active" value="5">
								</div>
			<br>

			<div>Afraid	<input class='visible-elements' type="radio" name="afraid" value="1">
								<input class='visible-elements' type="radio" name="afraid" value="2">
								<input class='visible-elements' type="radio" name="afraid" value="3">
								<input class='visible-elements' type="radio" name="afraid" value="4">
								<input class='visible-elements' type="radio" name="afraid" value="5">
								</div>
			<br>

			<div>Cheerful			<input class='visible-elements' type="radio" name="cheerful" value="1">
								<input class='visible-elements' type="radio" name="cheerful" value="2">
								<input class='visible-elements' type="radio" name="cheerful" value="3">
								<input class='visible-elements' type="radio" name="cheerful" value="4">
								<input class='visible-elements' type="radio" name="cheerful" value="5">
								</div>
			<br>

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