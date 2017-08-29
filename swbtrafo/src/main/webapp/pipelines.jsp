<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FilenameFilter" %>
<%
	File pipelinedir = new File(getServletContext().getRealPath("/WEB-INF/pipelines/" + request.getRemoteUser()));
	String[] pipelines = pipelinedir.list(new FilenameFilter() {
		public boolean accept(File dir, String name) { return name.endsWith(".pipeline"); }
	});
	request.setAttribute("pipelines", pipelines);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="swbtrafo.css">
		<title>SWBtrafo - Datenverarbeitung im Web: Auswahl der Pipeline</title>
	</head>
	<body>
		<div>eingeloggt: ${pageContext.request.remoteUser}&nbsp;<a href="<c:url value='/logout' />">logout</a></div>
		<img src="logo.jpg" style="float: left; margin: 0 50px 30px 0;" />
		<h1>SWBtrafo - Datenverarbeitung im Web</h1>
		<h2>Auswahl der Pipeline</h2>
		<p style="clear: both">Bitte wählen Sie eine Pipeline aus</p>
		<form action="<c:url value='/run' />" method="GET">
			<div>
				<select name="trafo" size="10">
					<c:forEach items="${pipelines}" var="pipeline">
						<option>${pipeline}</option>
					</c:forEach>		
				</select>
			</div>
			<div>
				<input type="submit" value="Ausführen" style="margin: 30px;"></input>
			</div>
		</form>
	</body>
</html>