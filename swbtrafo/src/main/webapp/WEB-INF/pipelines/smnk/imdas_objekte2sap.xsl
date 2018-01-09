<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
	xmlns:java="http://xml.apache.org/xalan/java"
    exclude-result-prefixes="java">
	
	<xsl:import href="../conv2sap.xsl" />
		
	<!-- 
		XSL zur Verarbeitung von XML-Exporten der Staatsgalerie Stuttgart
		
		@version: 1
		@created: 2014-08-28
		@modified: 2014-08-28
		@author: Christof Mainberger, christof.mainberger@bsz-bw.de
		
		Änderungen
		2014-08-28: 
		- Fehlerhandling und Ausgabe in externer Datei:
			- Bestimmung der SAP-Felder in Parametern eines Templates
			- Ausgabe der SAP-Variablen in einem Template 
			- Auslagerung allgemeiner Routinen in eine conv2sap.xsl  
			- Datumsnormalisierung mit externer Java-Klasse
		2015-01-20:
			- Inventarnummer mit Doppelpunkt vor Bezeichnung1
		2015-01-27
			-Schätzwert ausgeschlossen	
	-->	
	
	<xsl:template match="/">
		<xsl:apply-templates select="OBJECTS/OBJECT[OBJ_USER_FIELDS/SAP/SAP-BEWERTUNG_ABGESCHLOSSEN = '1']" />
	</xsl:template>

	<xsl:template match="OBJECT"> 
		
		<xsl:call-template name="ausgabe">	
						
				<xsl:with-param name="bezeichnung_1">
					<xsl:value-of select="./TERM/OBJEKTBEZEICHNUNG_THESAURUS" />
				</xsl:with-param>
				
				<xsl:with-param name="bezeichnung_2" select="./OBJEKTBEZEICHNUNG_FREITEXT" />
				
				<xsl:with-param name="inventarnummer" select="./INVENTARNUMMER"/>
				
				<xsl:with-param name="imdas-nummer" select="./IMDAS_ID" />
				
				<xsl:with-param name="aktivierungsdatum" >	
					<xsl:if test="normalize-space(./EINGANGSDATUM) != ''">	
						<xsl:value-of select="substring(./EINGANGSDATUM,9,2)" /><xsl:text>.</xsl:text>
						<xsl:value-of select="substring(./EINGANGSDATUM,6,2)" /><xsl:text>.</xsl:text>
						<xsl:value-of select="substring(./EINGANGSDATUM,1,4)" />
					</xsl:if>
					<xsl:if test="normalize-space(./EINGANGSDATUM) = ''">						
						<xsl:call-template name="normDate">
							<xsl:with-param name="datum" select="./EINGANGSDATUM_TEXT" />
						</xsl:call-template>
					</xsl:if> 
				</xsl:with-param>				
												
				<xsl:with-param name="kostenstelle">
					<xsl:choose>
						<xsl:when test="./EINGANGSART = 'Aufsammlungen'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Alte Sammlungsbestände'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Dauerleihnahme'"><xsl:text></xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Depotfund'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Donation'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Eigenprodukt'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Erwerbungen'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Fund'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Funde'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Kauf'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Leihnahme'"><xsl:text></xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Museumsstiftung'"><xsl:text>7940111111</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Nachlass'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Schenkung'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Spende'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Tausch'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Unbekannt'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'unbekannt'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Zuweisung'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./EINGANGSART = 'Zentralfonds'"><xsl:text>7940111111</xsl:text></xsl:when>					
					</xsl:choose>
				</xsl:with-param>
				
				<xsl:with-param name="ordnungsbegriff">
					<xsl:if test="./STUECK > '1'">
						<xsl:text></xsl:text>
					</xsl:if>
				</xsl:with-param>
				
				<xsl:with-param name="menge" select="./STUECK" />			
				
				<xsl:with-param name="kummulierte_ahk">					
					<xsl:choose>
						<xsl:when test="./OBJ_VALUE/WERTEART = 'Vermögensbewertung A - Erinnerungswert 1 Euro'">1</xsl:when>
						<xsl:when test="./OBJ_VALUE/WERTEART = 'Vermögensbewertung B - Mittelwert 50.000 Euro'">50000</xsl:when>
						<xsl:when test="./OBJ_VALUE/WERTEART = 'Vermögensbewertung C - Mittelwert 500.000 Euro'">500000</xsl:when>
						<xsl:otherwise>
							<xsl:if test="./OBJ_VALUE[WERTEART = 'Vermögensbewertung D - Einzelbewertung in Euro']/WERT != ''">
								<xsl:value-of select="./OBJ_VALUE[WERTEART = 'Vermögensbewertung D - Einzelbewertung in Euro']/WERT" />
							</xsl:if>
							<xsl:if test="normalize-space(./OBJ_VALUE[WERTEART = 'Vermögensbewertung D - Einzelbewertung in Euro']/WERT) = ''">
								<xsl:text>toDo: Bewertung muss aus dem letzten Wert ermittelt werden</xsl:text>									
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
											
		</xsl:call-template>
		
	</xsl:template>	

</xsl:stylesheet>