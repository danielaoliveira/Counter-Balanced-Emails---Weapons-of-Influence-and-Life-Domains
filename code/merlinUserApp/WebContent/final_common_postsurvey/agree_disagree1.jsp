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

			<h3 class='question'>Read each statement carefully. Indicate the degree to which you agree or disagree with each statement by using the following scale:</h3>

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
					 	<td>Hypocrisy is on the increase in our society.</td>
						<td><input class='visible-elements' type="radio" name="hypo" value="1"></td>
						<td><input class='visible-elements' type="radio" name="hypo" value="2"></td>
						<td><input class='visible-elements' type="radio" name="hypo" value="3"></td>
						<td><input class='visible-elements' type="radio" name="hypo" value="4"></td>
						<td><input class='visible-elements' type="radio" name="hypo" value="5"></td>
					</tr>

					<tr>
						<td>In dealing with strangers, one is better off to be cautious until they have provided evidence that they are trustworthy.</td>
						<td><input class='visible-elements' type="radio" name="stra" value="1"></td>
						<td><input class='visible-elements' type="radio" name="stra" value="2"></td>
						<td><input class='visible-elements' type="radio" name="stra" value="3"></td>
						<td><input class='visible-elements' type="radio" name="stra" value="4"></td>
						<td><input class='visible-elements' type="radio" name="stra" value="5"></td>
					</tr>

					<tr>
						<td>This country has a dark future unless we can attract better people into politics.</td>
						<td><input class='visible-elements' type="radio" name="dark" value="1"></td>
						<td><input class='visible-elements' type="radio" name="dark" value="2"></td>
						<td><input class='visible-elements' type="radio" name="dark" value="3"></td>
						<td><input class='visible-elements' type="radio" name="dark" value="4"></td>
						<td><input class='visible-elements' type="radio" name="dark" value="5"></td>
					</tr>

					<tr>
						<td>Fear, social disgrace, or punishment rather than conscience prevents most people from breaking the law.</td>
						<td><input class='visible-elements' type="radio" name="fear" value="1"></td>
						<td><input class='visible-elements' type="radio" name="fear" value="2"></td>
						<td><input class='visible-elements' type="radio" name="fear" value="3"></td>
						<td><input class='visible-elements' type="radio" name="fear" value="4"></td>
						<td><input class='visible-elements' type="radio" name="fear" value="5"></td>
					</tr>

					<tr>
						<td>Using the honor system of not having a teacher present during exams would probably result in increased cheating.</td>
						<td><input class='visible-elements' type="radio" name="honor" value="1"></td>
						<td><input class='visible-elements' type="radio" name="honor" value="2"></td>
						<td><input class='visible-elements' type="radio" name="honor" value="3"></td>
						<td><input class='visible-elements' type="radio" name="honor" value="4"></td>
						<td><input class='visible-elements' type="radio" name="honor" value="5"></td>
					</tr>

					<tr>
						<td>Parents usually can be relied on to keep their promises.</td>
						<td><input class='visible-elements' type="radio" name="parents" value="1"></td>
						<td><input class='visible-elements' type="radio" name="parents" value="2"></td>
						<td><input class='visible-elements' type="radio" name="parents" value="3"></td>
						<td><input class='visible-elements' type="radio" name="parents" value="4"></td>
						<td><input class='visible-elements' type="radio" name="parents" value="5"></td>
					</tr>

					<tr>
						<td>The United Nations will never be an effective force in keeping world peace.</td>
						<td><input class='visible-elements' type="radio" name="unations" value="1"></td>
						<td><input class='visible-elements' type="radio" name="unations" value="2"></td>
						<td><input class='visible-elements' type="radio" name="unations" value="3"></td>
						<td><input class='visible-elements' type="radio" name="unations" value="4"></td>
						<td><input class='visible-elements' type="radio" name="unations" value="5"></td>
					</tr>

					<tr>
						<td>The judiciary is a place where we can all get unbiased treatment.</td>
						<td><input class='visible-elements' type="radio" name="jud" value="1"></td>
						<td><input class='visible-elements' type="radio" name="jud" value="2"></td>
						<td><input class='visible-elements' type="radio" name="jud" value="3"></td>
						<td><input class='visible-elements' type="radio" name="jud" value="4"></td>
						<td><input class='visible-elements' type="radio" name="jud" value="5"></td>
					</tr>

					<tr>
						<td>Most people would be horrified if they knew how much news that the public hears and sees is distorted.</td>
						<td><input class='visible-elements' type="radio" name="horr" value="1"></td>
						<td><input class='visible-elements' type="radio" name="horr" value="2"></td>
						<td><input class='visible-elements' type="radio" name="horr" value="3"></td>
						<td><input class='visible-elements' type="radio" name="horr" value="4"></td>
						<td><input class='visible-elements' type="radio" name="horr" value="5"></td>
					</tr>

					<tr>
						<td>It is safe to believe that in spite of what people say, most people are primarily interested in their own welfare.</td>
						<td><input class='visible-elements' type="radio" name="bel" value="1"></td>
						<td><input class='visible-elements' type="radio" name="bel" value="2"></td>
						<td><input class='visible-elements' type="radio" name="bel" value="3"></td>
						<td><input class='visible-elements' type="radio" name="bel" value="4"></td>
						<td><input class='visible-elements' type="radio" name="bel" value="5"></td>
					</tr>

					<tr>
						<td>Even though we have reports in newspapers, radio, and T.V., it is hard to get objective accounts of public events.</td>
						<td><input class='visible-elements' type="radio" name="repo" value="1"></td>
						<td><input class='visible-elements' type="radio" name="repo" value="2"></td>
						<td><input class='visible-elements' type="radio" name="repo" value="3"></td>
						<td><input class='visible-elements' type="radio" name="repo" value="4"></td>
						<td><input class='visible-elements' type="radio" name="repo" value="5"></td>
					</tr>

					<tr>
						<td>The future seems very promising.</td>
						<td><input class='visible-elements' type="radio" name="fut" value="1"></td>
						<td><input class='visible-elements' type="radio" name="fut" value="2"></td>
						<td><input class='visible-elements' type="radio" name="fut" value="3"></td>
						<td><input class='visible-elements' type="radio" name="fut" value="4"></td>
						<td><input class='visible-elements' type="radio" name="fut" value="5"></td>
					</tr>

					<tr>
						<td>If we really knew what was going on in international politics, the public would have reason to be more frightened than they now seem to be.</td>
						<td><input class='visible-elements' type="radio" name="pol" value="1"></td>
						<td><input class='visible-elements' type="radio" name="pol" value="2"></td>
						<td><input class='visible-elements' type="radio" name="pol" value="3"></td>
						<td><input class='visible-elements' type="radio" name="pol" value="4"></td>
						<td><input class='visible-elements' type="radio" name="pol" value="5"></td>
					</tr>

					<tr>
						<td>Most elected officials are really sincere in their campaign promises.</td>
						<td><input class='visible-elements' type="radio" name="elec" value="1"></td>
						<td><input class='visible-elements' type="radio" name="elec" value="2"></td>
						<td><input class='visible-elements' type="radio" name="elec" value="3"></td>
						<td><input class='visible-elements' type="radio" name="elec" value="4"></td>
						<td><input class='visible-elements' type="radio" name="elec" value="5"></td>
					</tr>

					<tr>
						<td>Many major national sports contests are fixed in one way or another.</td>
						<td><input class='visible-elements' type="radio" name="spo" value="1"></td>
						<td><input class='visible-elements' type="radio" name="spo" value="2"></td>
						<td><input class='visible-elements' type="radio" name="spo" value="3"></td>
						<td><input class='visible-elements' type="radio" name="spo" value="4"></td>
						<td><input class='visible-elements' type="radio" name="spo" value="5"></td>
					</tr>

					<tr>
						<td>Most experts can be relied upon to tell the truth about the limits of their knowledge.</td>
						<td><input class='visible-elements' type="radio" name="expert" value="1"></td>
						<td><input class='visible-elements' type="radio" name="expert" value="2"></td>
						<td><input class='visible-elements' type="radio" name="expert" value="3"></td>
						<td><input class='visible-elements' type="radio" name="expert" value="4"></td>
						<td><input class='visible-elements' type="radio" name="expert" value="5"></td>
					</tr>

					<tr>
						<td>Most parents can be relied upon to carry out their threats of punishments.</td>
						<td><input class='visible-elements' type="radio" name="pun" value="1"></td>
						<td><input class='visible-elements' type="radio" name="pun" value="2"></td>
						<td><input class='visible-elements' type="radio" name="pun" value="3"></td>
						<td><input class='visible-elements' type="radio" name="pun" value="4"></td>
						<td><input class='visible-elements' type="radio" name="pun" value="5"></td>
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