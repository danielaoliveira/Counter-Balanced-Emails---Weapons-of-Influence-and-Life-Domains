<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="merlinUserApp.*" import="merlinUserApp.UserInfo.User" import="java.util.*" import="com.google.gson.Gson"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
	<link rel="stylesheet" href="<c:url value="/styling/style.css" />">

	<script src="jquery-2.1.4.js"></script>
	<script language="javascript" type="text/javascript">

		<%
		Gson gson = new Gson();
		UserInfo usrInfo = new UserInfo();
		List<User> users = usrInfo.getUsers();
		Map<String, User> internalMap = new HashMap<String, User>();

		for (User usr: users) {
			internalMap.put(usr.emailAddr, usr);
		}
		%>

		function validateEmailAddress() {
			
		    var map = <%=gson.toJson(internalMap) %>
		    var email = document.getElementById("emailAddr").value;
		    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		    
		    if (re.test(email)) {
		    	//console.log(email);
			    if (map[email]) {
			    	
			    	var url = "http://merlin.ece.ufl.edu:8088/merlinUserApp/users";
			    	
			    	var postData = map[email];
			    	
			    	var postFormStr = "<form id='hidden_form' method='POST' action='" + url + "'>\n";

		    	    for (var key in postData)
		    	    {
		    	    	
		    	        if (postData.hasOwnProperty(key))
		    	        {
		    	        	console.log(postData[key]);
		    	            postFormStr += "<input type='hidden' name='" + key + "' value='" + postData[key] + "'></input>";
		    	        }
		    	    }

		    	    postFormStr += "</form>";

		    	    var formElement = $(postFormStr);
		    	    $('body').append(formElement);
		    	    $(formElement).submit();
		    	    
			    	
			    } else {
			    	alert("failure: email address not found in database");
			    }
		    } else {
		    	alert("please enter a valid email address for example: helloworld@universe.com");
		    }
		    
		}
	</script>

	<title>Internet Study, University of Florida</title>
	<div id='top-line' class='line'></div>
	<div id='header'>
		<img id='top-logo' src="<c:url value="/styling/uf-logo_white.png" />">
	</div>
</head>

<body>
	<div id='content'>
		<div class="title">Internet Study by UFL Computer and Electrical Engineering Department</div>
		<br><br><label for="emailInput">Email address:<span style="color:red;"> * </span></label>
		<input class="email" id="emailAddr" type="text" value="" placeholder="Enter Your Email Address"><br><br>
		<input id='index-submit' class="submit" type="submit" value="Submit" onclick="return validateEmailAddress();"><br><br>
		
	</div> <!--content-->

	<div id='footer'>
		<div id='help'>Have any questions? Call us at <span class="highlight">352-273-2134</span> or email us at <span class="highlight">projmerlin0@gmail.com</span> .</div>
		<div id='bottom-line' class='line'></div><br>
		<div id='contact-us'>&copy; <a href="http://www.ufl.edu/" target="_blank" title="University of Florida">University of Florida</a>, Gainesville, FL 32611</div>
		<img id='bottom-logo' src="<c:url value="/styling/uf-logo_blue.png" />">
	</div>

</body>
</html>