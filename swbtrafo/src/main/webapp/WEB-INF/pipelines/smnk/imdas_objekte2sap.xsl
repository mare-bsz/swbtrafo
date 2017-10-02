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
		<xsl:apply-templates select="imdasData/object/row[field[@id='SAP-Bewertung abgeschlossen'] = 'Ja']" />
	</xsl:template>

	<xsl:template match="row"> 
		
		<xsl:call-template name="ausgabe">	
						
				<xsl:with-param name="bezeichnung_1">
					<!-- <xsl:value-of select="field[@id='Inv.Nr.']" />
					<xsl:text> : </xsl:text> -->
					<xsl:value-of select="./field[@id='Objektbezeichnung']" />
				</xsl:with-param>
				
				<xsl:with-param name="bezeichnung_2" select="./field[@id='Titel (Museumsobjekt)']" />
				
				<xsl:with-param name="inventarnummer" select="./field[@id='Inv.Nr.']"/>
				
				<xsl:with-param name="imdas-nummer" select="./field[@id='IMDAS ID']" />
				
				<xsl:with-param name="aktivierungsdatum" >	
					<xsl:if test="normalize-space(./field[@id='Eingangsdatum']) != ''">	
						<xsl:value-of select="./field[@id='Eingangsdatum']" />
					</xsl:if>
					<xsl:if test="normalize-space(./field[@id='Eingangsdatum']) = ''">						
						<xsl:call-template name="normDate">
							<xsl:with-param name="datum" select="./field[@id='Eingangsdatum (Text)']" />
						</xsl:call-template>
					</xsl:if> 
				</xsl:with-param>				
				
				<xsl:with-param name="kostenstelle" select="./subObject[@id='SAP-Kostenstelle']/row/field" />
				
				<xsl:with-param name="kostenstelle">
					<xsl:choose>
						<xsl:when test="./field[@id='Eingangsart'] = 'Aufsammlungen'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Alte Sammlungsbestände'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Dauerleihnahme'"><xsl:text></xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Depotfund'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Donation'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Eigenprodukt'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Erwerbungen'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Fund'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Funde'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Kauf'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Leihnahme'"><xsl:text></xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Museumsstiftung'"><xsl:text>7940111111</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Nachlass'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Schenkung'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Spende'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Tausch'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Unbekannt'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'unbekannt'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Zuweisung'"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Zentralfonds'"><xsl:text>7940111111</xsl:text></xsl:when>					
					</xsl:choose>
				</xsl:with-param>
				
				<xsl:with-param name="ordnungsbegriff">
					<xsl:if test="./field[@id='Stück'] > '1'">
						<xsl:text></xsl:text>
					</xsl:if>
				</xsl:with-param>
				
				<xsl:with-param name="menge" select="./field[@id='Stück']" />
				
				<xsl:with-param name="kummulierte_ahk">					
					<xsl:choose>
						<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'A - Erinnerungswert 1 Euro'">1</xsl:when>
						<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'B - Mittelwert 50.000 Euro'">50000</xsl:when>
						<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'C - Mittelwert 500.000 Euro'">500000</xsl:when>
						<xsl:otherwise>
							<xsl:if test="normalize-space(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field) != ''">
								<xsl:value-of select="./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field" />
							</xsl:if>
							<xsl:if test="normalize-space(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field) = ''">
								<xsl:for-each select="./subObject[@id='Währungen']/row[field[@id='WType'] != 'Schätzwert']">
									<xsl:sort select="concat(
										substring(
											java:bsz.swbtrafo.util.XsltUtil.sortableDate(field[@id='WNote'])
											, 1, number(field[@id='Gültigkeitsdatum']='01.01.0001') * 10),
										substring(
											concat(
												substring(field[@id='Gültigkeitsdatum'],7,4),
												substring(field[@id='Gültigkeitsdatum'],4,2),
												substring(field[@id='Gültigkeitsdatum'],1,2)
											)
											, 1, number(not(field[@id='Gültigkeitsdatum']='01.01.0001')) * 8))"  data-type="text" order="descending"/>
    								<xsl:if test="position() = 1">
      									<xsl:choose>
											<xsl:when test="field[@id='WUnit'] = 'Euro'">
												<xsl:value-of select="field[@id='WValue']" />
											</xsl:when>
											<xsl:when test="field[@id='WUnit'] = 'EUR'">
												<xsl:value-of select="field[@id='WValue']" />
											</xsl:when>
											<xsl:when test="field[@id='WUnit'] = 'DEM'">
												<xsl:variable name="amount" select="field[@id='WValue']" />
												<xsl:value-of select="ceiling(number($amount) * 0.54)" />
											</xsl:when>
											<xsl:when test="field[@id='WUnit'] = 'DM'">
												<xsl:variable name="amount" select="field[@id='WValue']" />
												<xsl:value-of select="ceiling(number($amount) * 0.54)" />
											</xsl:when>
										</xsl:choose> 
    								</xsl:if>
 								</xsl:for-each>									
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
											
		</xsl:call-template>
		
	</xsl:template>	

</xsl:stylesheet>