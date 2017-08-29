<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="swbtrafo.css">
		<title>SWBtrafo - Datenverarbeitung im WWWweb</title>
	</head>
	<body>
		<img src="logo.jpg" style="float: left; margin: 0 50px 30px 0;" />
		<h1>SWBtrafo - Datenverarbeitung im Web</h1>
		<h2>Startseite</h2>
		<div style="clear: both;">
			<p >SWBtrafo erm�glicht Datenverarbeitungen �ber eine Online-Schnittstelle f�r unterschiedliche Zielanwendungen.</p> 
			<p>Jede Datenverarbeitung wird durch eine sogenannte Pipeline vorgenommen, die 
			zun�chst ausgew�hlt wird. F�r jeden Nutzer, der sich �ber ein LogIn identifiziert,
			steht dabei eine Auswahl an f�r seinen Bedarf angepassten Pipelines zur Verf�gung</p>
			<p>Die Daten zur Verabeitung werden gew�hnlich �ber	ein File-Upload als XML-Datei 
			hochgeladen. Es sind - je nach Pipeline - aber auch andere Formate m�glich oder 
			auf dem Server hinterlegte Dateien. Zus�tzlich k�nnen weitere 
			Konfigurationsparameter �ber ein Webformular abgefragt werden.</p>
			<p>Die verarbeiteten Daten werden je nach Pipeline z.B. als XML oder CSV-Download
			angeboten. Es gibt allerdings auch Pipelines, die Solr-Indexe aktualisieren oder
			andere server-seitige Prozesse durchf�hren. Jedenfalls werden auf einer Ergebnisseite
			z.B. die Anzahl der verarbeiteten Datens�tze oder andere Resultate ausgegeben</p>
			<p><a href="<c:url value='/pipelines.jsp' />">Zum Login und zur Pipelineauswahl</a></p>	
		</div>	
	</body>
</html>