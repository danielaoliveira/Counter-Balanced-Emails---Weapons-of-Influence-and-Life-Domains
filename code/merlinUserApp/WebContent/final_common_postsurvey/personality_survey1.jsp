<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>UFL Online Survey - personality</title>
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>

<body>
	<div id='content'>

	<%
		String 	emailAddr 		= request.getParameter("emailAddr");
		String 	userStudyDayNo 	= request.getParameter("userStudyDayNo");
		int 	surveySet 		= Integer.parseInt(request.getParameter("surveySet"));
		int 	stateNo 		= (Integer) request.getAttribute("stateNo");
		
		int val = stateNo%100 - 75; // 176 -> 188; 276 -> 288; 276 -> 388; 476 -> 488;

		int qno = val;
		String questionStmt = "Statement 1: You have a great need for people to like and admire you.";
		
		switch(qno){
			case 1:
				questionStmt = "Statement 1: You have a great need for people to like and admire you.";
				break;
			case 2:
				questionStmt = "Statement 2: You have a tendency to be critical of yourself. ";
				break;
			case 3:
				questionStmt = "Statement 3: You have a great deal of unused capacity which you have not turned to your advantage.";
				break;
			case 4:
				questionStmt = "Statement 4: While you have some personality weaknesses, you generally are able to compensate for them.";
				break;
			case 5:
				questionStmt = "Statement 5: Your teenage years presented problems for you.";
				break;
			case 6:
				questionStmt = "Statement 6: Disciplined and self-controlled on the outside, you're worrisome and insecure on the inside.";
				break;
			case 7:
				questionStmt = "Statement 7: At times, you have serious doubts whether you made the right decision or done the right thing. ";
				break;
			case 8:
				questionStmt = "Statement 8: You prefer a certain amount of change and variety and become dissastisfied when hemmed in by restrictions and limitations.";
				break;
			case 9:
				questionStmt = "Statement 9: You pride yourself as an independent thinker and do not accept others' statements without satisfactory proof.";
				break;
			case 10:
				questionStmt = "Statement 10: You have found it unwise to be too frank in revealing yourself to others. ";
				break;
			case 11:
				questionStmt = "Statement 11: At times you are extroverted, affable, and sociable, while at other times you are introvered, wary, and reserved. ";
				break;
			case 12:
				questionStmt = "Statement 12: Some of your aspirations tend to be pretty unrealistic.";
				break;
			case 13:
				questionStmt = "Statement 13: Security is one of your major goals in life.";
				break;
		}
		
%>
		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">

			<h4 class='instr'><%=questionStmt%></h4>
			
			<div id="personality">
				<h4 class='question'>Does this statement accurately reflect your personality?</h4>
					<input class='visible-elements' id='radio1' type="radio" name="reflect" value="1"><label for='radio1'>Yes</label>
					<input class='visible-elements' id='radio2' type="radio" name="reflect" value="2"><label for='radio2'>No</label>
			</div>
			
			<div id="degree">
				<h4 class='question'>How much does this statement reveal something specific about your personality?</h4>
					<input class='visible-elements' id='radio3' type="radio" name="degree" value="1"><label for='radio3'> Not At All</label>
					<input class='visible-elements' id='radio4' type="radio" name="degree" value="2"><label for='radio4'> Poorly</label>
					<input class='visible-elements' id='radio5' type="radio" name="degree" value="3"><label for='radio5'> Decently</label>
					<input class='visible-elements' id='radio6' type="radio" name="degree" value="4"><label for='radio6'> Well</label>
					<input class='visible-elements' id='radio7' type="radio" name="degree" value="5"><label for='radio7'> Perfectly</label>
			</div>

			<br><br>

			<input type="submit" value="Next >>" onclick="return form_submit_function()">
			<input type="hidden" name="emailAddr" value=<%=emailAddr %>></input>
			<input type="hidden" name="userStudyDayNo" value=<%=userStudyDayNo %>></input>
			<input type="hidden" name="surveySet" value=<%=surveySet %>>
			<input type="hidden" name="stateNo" value=<%=stateNo%>>
		</form>
	</div><!-- content-->

	<div id='footer'>
		<div id='bottom-line' class='line'></div><br>
		<div id='contact-us'>Questions? Call 352-273-2134 or email projmerlin0@gmail.com<br>&copy; <a href="http://www.ufl.edu/" target="_blank" title="University of Florida">University of Florida</a>, Gainesville, FL 32611</div>
		<img id='bottom-logo' src="<c:url value="/styling/uf-logo_blue.png" />">
	</div>

</body>
<script src="<c:url value="jquery-2.1.4.js" />"></script>
<script src="<c:url value="/js/formsubmit.js" />"></script>

</html>