<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:import href="../conv2sap.xsl" />
		
	<!--
		XSL zur Verarbeitung von XML-Exporten des Archäologischen Landesmuseum
		
		@version: 1
		@created: 2014-07-25
		@modified: 2014-08-28
		@author: Christof Mainberger, christof.mainberger@bsz-bw.de
		
		Änderungen
		2014-08-28: 
		- Fehlerhandling und Ausgabe in externer Datei:
			- Bestimmung der SAP-Felder in Parametern eines Templates
			- Ausgabe der SAP-Variablen in einem Template 
			- Auslagerung allgemeiner Routinen in eine conv2sap.xsl  
	-->
	
	<xsl:template match="/">
		<xsl:apply-templates select="almobjekt" />
	</xsl:template>

	<xsl:template match="almobjekt"> 
	
		<xsl:call-template name="ausgabe">
		
			<xsl:with-param name="buchungskreis" select="Buchungskreis" />
			
			<xsl:with-param name="anlagenklasse" select="Anlagenklasse" />
			
			<xsl:with-param name="bezeichnung_1" select="Bezeichnung_1" />
			
			<xsl:with-param name="bezeichnung_2" select="Bezeichnung_2" />
			
			<xsl:with-param name="inventarnummer" select="Inventarnummer"/>
			
			<xsl:with-param name="imdas-nummer" select="IMDAS-Nummer" />
			
			<xsl:with-param name="aktivierungsdatum" select="Aktivierungsdatum" />
			
			<xsl:with-param name="kostenstelle" select="Kostenstelle" />
			
			<xsl:with-param name="ordnungsbegriff" select="Ordnungsbegriff_5" />
			
			<xsl:with-param name="menge" select="Menge" />
			
			<xsl:with-param name="eigentumskennzeichen" select="Eigentumskennzeichen" />
			
			<xsl:with-param name="bewertungsbereich" select="Bewertungsbereich" />
			
			<xsl:with-param name="kummulierte_ahk" select="Kummulierte_AHK" />
			
		</xsl:call-template>
		
	</xsl:template>

</xsl:stylesheet>