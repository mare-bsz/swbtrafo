<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="swbtrafo.css">
		<title>SWBtrafo - Datenverarbeitung im Web: Ergebnis der Verarbeitung</title>
	</head>
	<body>
		<div>
			<div>eingeloggt: ${pageContext.request.remoteUser}&nbsp;<a href="<c:url value='/logout' />">logout</a></div>
			<img src="logo.jpg" style="float: left; margin: 0 50px 30px 0;" />
			<h1>SWBtrafo - Datenverarbeitung im Web</h1>
			<h2>Ergebnisse</h2>
			<div>				
				<p style="clear: both">Gewählte Pipeline: <c:out value="${pipeline.name}" /></p>			
				<div>
					<c:forEach var="message" items="${pipeline.messages}" >
						<p style="color: red; text-weight: bold;"><c:out value="${message}" /></p>
					</c:forEach>
				</div>				
				<div>
					<c:forEach var="result" items="#{pipeline.results}" >
						<p><a href="<c:url value='deliver?result=${result.name}' />"><c:out value="${result.name}" /></a></p>											
					</c:forEach>
				</div>
			</div>		
		</div>	
	</body>
</html>