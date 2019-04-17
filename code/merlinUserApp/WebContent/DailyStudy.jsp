<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">
	<title>Daily Internet Study, University of Florida</title>
	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>
<body>

	<%
	
		String firstName = request.getParameter("firstName");
		String lastName  = request.getParameter("lastName");
		String emailAddr = request.getParameter("emailAddr");
		String startDate = request.getParameter("startDate");
		int userStudyDayNo = request.getAttribute("userStudyDayNo")==null?1:(Integer) request.getAttribute("userStudyDayNo");
		String forwardPage = request.getAttribute("includeJspContent")==null?"":(String) request.getAttribute("includeJspContent");
		int surveySet = request.getAttribute("surveyId")==null?1:(Integer) request.getAttribute("surveyId");
		System.out.println(userStudyDayNo + " : " + forwardPage);
	%>
	
	<div id='content'>
		<h3 id='greeting' class="welcome">Hello <%=firstName %>,</h3>
		
		<div class="welcome">
			<p>You have started this Internet Study on <%=startDate %> so you are on day <%=userStudyDayNo %>: </p>
		</div>

		<div id="dayNum">
	 		<jsp:include page='<%=forwardPage%>' />
		</div>
		
		<form id="hidden_form" method="POST" action="http://merlin.ece.ufl.edu:8088/merlinUserApp/survey">
			<input type="hidden" name="emailAddr" value=<%=emailAddr %>>
			<input type="hidden" name="userStudyDayNo" value=<%=userStudyDayNo %>>
			<input type="hidden" name="surveySet" value=<%=surveySet %>>
			<input type="hidden" name="stateNo" value="0">		
		</form>
	</div><!--content-->

	<div id='footer'>
		<div id='bottom-line' class='line'></div><br>
		<div id='help'>Have any questions? Call us at <span class="highlight">352-273-2134</span> or email us at <span class="highlight">projmerlin0@gmail.com</span> .</div>
		<div id='contact-us'>&copy; <a href="http://www.ufl.edu/" target="_blank" title="University of Florida">University of Florida</a>, Gainesville, FL 32611</div>
		<img id='bottom-logo' src="<c:url value="/styling/uf-logo_blue.png" />">
	</div>
</body>

<script src="jquery-2.1.4.js"></script>
<script src="<c:url value="/js/formsubmit.js" />"></script>
<script language="javascript" type="text/javascript">

	var userStudyDayNo = <%=userStudyDayNo%>;
	if (userStudyDayNo == 21) {
		
		$("a").attr("href", "https://ufl.qualtrics.com/SE/?SID=SV_3NUeilFqmTPkobr&SurveySet="+<%=surveySet%>);
		console.log(userStudyDayNo + " -> " + <%=surveySet%>);
		
	}
	
	$('a').click( function() { 
		console.log('inside atag click');
		var formElement = document.getElementById('hidden_form');
		console.log(formElement);
		$(formElement).submit();
		return false; 
	} );

</script>

</html>