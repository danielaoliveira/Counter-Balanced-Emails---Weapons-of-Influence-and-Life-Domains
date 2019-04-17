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

			<h3 class='question'>The following statements are about relationships.  Please rate how much you feel each statement applies to you.  There are no right or wrong answers.</h3>

			<table border=1 cellpadding=10 cellspacing=5 rules=rows frame=hsides>
				<thead>
					<tr>
						<th></th>
						<th>Strongly Disagree</th>
						<th>Mildly disagree</th>
						<th>Agree and Disagree Equally</th>
						<th>Mildly Agree</th>
						<th>Strongly Agree</th>
					</tr>
				</thead>

				<tbody>
					<tr>
					 	<td>My partner makes me feel safe.</td>
						<td><input class='visible-elements' type="radio" name="part" value="1"></td>
						<td><input class='visible-elements' type="radio" name="part" value="2"></td>
						<td><input class='visible-elements' type="radio" name="part" value="3"></td>
						<td><input class='visible-elements' type="radio" name="part" value="4"></td>
						<td><input class='visible-elements' type="radio" name="part" value="5"></td>
					</tr>

					<tr>
						<td>I tend to be accepting of others.</td>
						<td><input class='visible-elements' type="radio" name="acce" value="1"></td>
						<td><input class='visible-elements' type="radio" name="acce" value="2"></td>
						<td><input class='visible-elements' type="radio" name="acce" value="3"></td>
						<td><input class='visible-elements' type="radio" name="acce" value="4"></td>
						<td><input class='visible-elements' type="radio" name="acce" value="5"></td>
					</tr>

					<tr>
						<td>My partner sometimes makes me uncomfortable.</td>
						<td><input class='visible-elements' type="radio" name="unco" value="1"></td>
						<td><input class='visible-elements' type="radio" name="unco" value="2"></td>
						<td><input class='visible-elements' type="radio" name="unco" value="3"></td>
						<td><input class='visible-elements' type="radio" name="unco" value="4"></td>
						<td><input class='visible-elements' type="radio" name="unco" value="5"></td>
					</tr>

					<tr>
						<td>My relationships with others are characterized by trust and acceptance.</td>
						<td><input class='visible-elements' type="radio" name="rela" value="1"></td>
						<td><input class='visible-elements' type="radio" name="rela" value="2"></td>
						<td><input class='visible-elements' type="radio" name="rela" value="3"></td>
						<td><input class='visible-elements' type="radio" name="rela" value="4"></td>
						<td><input class='visible-elements' type="radio" name="rela" value="5"></td>
					</tr>

					<tr>
						<td>I do not worry that my partner will leave me.</td>
						<td><input class='visible-elements' type="radio" name="leav" value="1"></td>
						<td><input class='visible-elements' type="radio" name="leav" value="2"></td>
						<td><input class='visible-elements' type="radio" name="leav" value="3"></td>
						<td><input class='visible-elements' type="radio" name="leav" value="4"></td>
						<td><input class='visible-elements' type="radio" name="leav" value="5"></td>
					</tr>

					<tr>
						<td>Basically, I am a trusting person.</td>
						<td><input class='visible-elements' type="radio" name="trus" value="1"></td>
						<td><input class='visible-elements' type="radio" name="trus" value="2"></td>
						<td><input class='visible-elements' type="radio" name="trus" value="3"></td>
						<td><input class='visible-elements' type="radio" name="trus" value="4"></td>
						<td><input class='visible-elements' type="radio" name="trus" value="5"></td>
					</tr>

					<tr>
						<td>It is better to trust people until they prove otherwise than to be suspicious of others until they prove otherwise.</td>
						<td><input class='visible-elements' type="radio" name="susp" value="1"></td>
						<td><input class='visible-elements' type="radio" name="susp" value="2"></td>
						<td><input class='visible-elements' type="radio" name="susp" value="3"></td>
						<td><input class='visible-elements' type="radio" name="susp" value="4"></td>
						<td><input class='visible-elements' type="radio" name="susp" value="5"></td>
					</tr>

					<tr>
						<td>I accept others at "face value."</td>
						<td><input class='visible-elements' type="radio" name="face" value="1"></td>
						<td><input class='visible-elements' type="radio" name="face" value="2"></td>
						<td><input class='visible-elements' type="radio" name="face" value="3"></td>
						<td><input class='visible-elements' type="radio" name="face" value="4"></td>
						<td><input class='visible-elements' type="radio" name="face" value="5"></td>
				</tr>

					<tr>
						<td>I am sceptical that relationships ever work out.</td>
						<td><input class='visible-elements' type="radio" name="scep" value="1"></td>
						<td><input class='visible-elements' type="radio" name="scep" value="2"></td>
						<td><input class='visible-elements' type="radio" name="scep" value="3"></td>
						<td><input class='visible-elements' type="radio" name="scep" value="4"></td>
						<td><input class='visible-elements' type="radio" name="scep" value="5"></td>
					</tr>

					<tr>
						<td>Most people are trustworthy.</td>
						<td><input class='visible-elements' type="radio" name="worth" value="1"></td>
						<td><input class='visible-elements' type="radio" name="worth" value="2"></td>
						<td><input class='visible-elements' type="radio" name="worth" value="3"></td>
						<td><input class='visible-elements' type="radio" name="worth" value="4"></td>
						<td><input class='visible-elements' type="radio" name="worth" value="5"></td>
					</tr>

					<tr>
						<td>I believe in my partner.</td>
						<td><input class='visible-elements' type="radio" name="bel" value="1"></td>
						<td><input class='visible-elements' type="radio" name="bel" value="2"></td>
						<td><input class='visible-elements' type="radio" name="bel" value="3"></td>
						<td><input class='visible-elements' type="radio" name="bel" value="4"></td>
						<td><input class='visible-elements' type="radio" name="bel" value="5"></td>
					</tr>

					<tr>
						<td>In relationships, I tend to be alert for the possibility of rejection or betrayal.</td>
						<td><input class='visible-elements' type="radio" name="betr" value="1"></td>
						<td><input class='visible-elements' type="radio" name="betr" value="2"></td>
						<td><input class='visible-elements' type="radio" name="betr" value="3"></td>
						<td><input class='visible-elements' type="radio" name="betr" value="4"></td>
						<td><input class='visible-elements' type="radio" name="betr" value="5"></td>
					</tr>

					<tr>
						<td>It is better to be suspicious of people you have just met, until you know them better.</td>
						<td><input class='visible-elements' type="radio" name="bett" value="1"></td>
						<td><input class='visible-elements' type="radio" name="bett" value="2"></td>
						<td><input class='visible-elements' type="radio" name="bett" value="3"></td>
						<td><input class='visible-elements' type="radio" name="bett" value="4"></td>
						<td><input class='visible-elements' type="radio" name="bett" value="5"></td>
					</tr>

					<tr>
						<td>I make friends easily.</td>
						<td><input class='visible-elements' type="radio" name="frnd" value="1"></td>
						<td><input class='visible-elements' type="radio" name="frnd" value="2"></td>
						<td><input class='visible-elements' type="radio" name="frnd" value="3"></td>
						<td><input class='visible-elements' type="radio" name="frnd" value="4"></td>
						<td><input class='visible-elements' type="radio" name="frnd" value="5"></td>
					</tr>

					<tr>
						<td>I am sure about how my partner feels about me.</td>
						<td><input class='visible-elements' type="radio" name="feel" value="1"></td>
						<td><input class='visible-elements' type="radio" name="feel" value="2"></td>
						<td><input class='visible-elements' type="radio" name="feel" value="3"></td>
						<td><input class='visible-elements' type="radio" name="feel" value="4"></td>
						<td><input class='visible-elements' type="radio" name="feel" value="5"></td>
					</tr>

					<tr>
						<td>Only a fool would trust most people.</td>
						<td><input class='visible-elements' type="radio" name="fool" value="1"></td>
						<td><input class='visible-elements' type="radio" name="fool" value="2"></td>
						<td><input class='visible-elements' type="radio" name="fool" value="3"></td>
						<td><input class='visible-elements' type="radio" name="fool" value="4"></td>
						<td><input class='visible-elements' type="radio" name="fool" value="5"></td>
					</tr>

					<tr>
						<td>I am doubtful that my partner will always be there for me if I need him/her.</td>
						<td><input class='visible-elements' type="radio" name="dbt" value="1"></td>
						<td><input class='visible-elements' type="radio" name="dbt" value="2"></td>
						<td><input class='visible-elements' type="radio" name="dbt" value="3"></td>
						<td><input class='visible-elements' type="radio" name="dbt" value="4"></td>
						<td><input class='visible-elements' type="radio" name="dbt" value="5"></td>
					</tr>

					<tr>
						<td>I tell my partner that I trust him/her completely.</td>
						<td><input class='visible-elements' type="radio" name="tell" value="1"></td>
						<td><input class='visible-elements' type="radio" name="tell" value="2"></td>
						<td><input class='visible-elements' type="radio" name="tell" value="3"></td>
						<td><input class='visible-elements' type="radio" name="tell" value="4"></td>
						<td><input class='visible-elements' type="radio" name="tell" value="5"></td>
					</tr>

					<tr>
						<td>I find it better to accept others for what they say and what they appear to be.</td>
						<td><input class='visible-elements' type="radio" name="accept" value="1"></td>
						<td><input class='visible-elements' type="radio" name="accept" value="2"></td>
						<td><input class='visible-elements' type="radio" name="accept" value="3"></td>
						<td><input class='visible-elements' type="radio" name="accept" value="4"></td>
						<td><input class='visible-elements' type="radio" name="accept" value="5"></td>
					</tr>

					<tr>
						<td>Most people can be counted on to do what they say they will do.</td>
						<td><input class='visible-elements' type="radio" name="counted" value="1"></td>
						<td><input class='visible-elements' type="radio" name="counted" value="2"></td>
						<td><input class='visible-elements' type="radio" name="counted" value="3"></td>
						<td><input class='visible-elements' type="radio" name="counted" value="4"></td>
						<td><input class='visible-elements' type="radio" name="counted" value="5"></td>
					</tr>

					<tr>
						<td>In these competitive times, one has to be alert or someone is likely to take advantage of you.</td>
						<td><input class='visible-elements' type="radio" name="compet" value="1"></td>
						<td><input class='visible-elements' type="radio" name="compet" value="2"></td>
						<td><input class='visible-elements' type="radio" name="compet" value="3"></td>
						<td><input class='visible-elements' type="radio" name="compet" value="4"></td>
						<td><input class='visible-elements' type="radio" name="compet" value="5"></td>
					</tr>

					<tr>
						<td>Most idealists are sincere and usually practice what they preach.</td>
						<td><input class='visible-elements' type="radio" name="ideal" value="1"></td>
						<td><input class='visible-elements' type="radio" name="ideal" value="2"></td>
						<td><input class='visible-elements' type="radio" name="ideal" value="3"></td>
						<td><input class='visible-elements' type="radio" name="ideal" value="4"></td>
						<td><input class='visible-elements' type="radio" name="ideal" value="5"></td>
					</tr>

					<tr>
						<td>Most salesmen are honest in describing their products.</td>
						<td><input class='visible-elements' type="radio" name="sales" value="1"></td>
						<td><input class='visible-elements' type="radio" name="sales" value="2"></td>
						<td><input class='visible-elements' type="radio" name="sales" value="3"></td>
						<td><input class='visible-elements' type="radio" name="sales" value="4"></td>
						<td><input class='visible-elements' type="radio" name="sales" value="5"></td>
					</tr>

					<tr>
						<td>Most students in school would not cheat even if they were sure of getting away with it.</td>
						<td><input class='visible-elements' type="radio" name="sch" value="1"></td>
						<td><input class='visible-elements' type="radio" name="sch" value="2"></td>
						<td><input class='visible-elements' type="radio" name="sch" value="3"></td>
						<td><input class='visible-elements' type="radio" name="sch" value="4"></td>
						<td><input class='visible-elements' type="radio" name="sch" value="5"></td>
					</tr>

					<tr>
						<td>Most repairmen will not overcharge, even if they think you are ignorant of their specialty.</td>
						<td><input class='visible-elements' type="radio" name="repair" value="1"></td>
						<td><input class='visible-elements' type="radio" name="repair" value="2"></td>
						<td><input class='visible-elements' type="radio" name="repair" value="3"></td>
						<td><input class='visible-elements' type="radio" name="repair" value="4"></td>
						<td><input class='visible-elements' type="radio" name="repair" value="5"></td>
					</tr>

					<tr>
						<td>A large share of accident claims filed against insurance companies are phony.</td>
						<td><input class='visible-elements' type="radio" name="insu" value="1"></td>
						<td><input class='visible-elements' type="radio" name="insu" value="2"></td>
						<td><input class='visible-elements' type="radio" name="insu" value="3"></td>
						<td><input class='visible-elements' type="radio" name="insu" value="4"></td>
						<td><input class='visible-elements' type="radio" name="insu" value="5"></td>
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