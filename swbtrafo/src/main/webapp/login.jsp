<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="swbtrafo.css">
		<title>SWBtrafo - Datenverarbeitung im WWW: Login</title>
	</head>
	<body>
		<form method="post" action="j_security_check" >
			<img src="logo.jpg" style="float: left; margin: 0 50px 30px 0;" />
			<h1>SWBtrafo - Datenverarbeitung im Web</h1>
			<h2>Login</h2>
	        <div style="clear: both">
	        	<label for="j_username" >Username:</label><br/>
	            <input type="text" name="j_username"/><br/>
	            <label for="j_password" >Passwort:</label><br/>
	            <input type="password" name="j_password" />
	            <div style="margin: 5px 0 0 0;">
	               <input type="submit" value="Login"/>
	            </div>
	        </div>
	    </form>    
	</body>
</html>