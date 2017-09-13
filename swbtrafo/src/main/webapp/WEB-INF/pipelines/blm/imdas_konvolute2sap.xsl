<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
	xmlns:java="http://xml.apache.org/xalan/java"
    exclude-result-prefixes="java">
	
	<xsl:import href="../conv2sap.xsl" />  
		
	<!--
		XSL zur Verarbeitung von XML-Exporten des Lindenmuseums Stuttgart
		
		@version: 1
		@created: 2014-08-27
		@modified: 2014-10-24
		@author: Christof Mainberger, christof.mainberger@bsz-bw.de
		
		Änderungen
		2014-08-28: 
		- Fehlerhandling und Ausgabe in externer Datei:
			- Bestimmung der SAP-Felder in Parametern eines Templates
			- Ausgabe der SAP-Variablen in einem Template 
			- Auslagerung allgemeiner Routinen in eine conv2sap.xsl  
			- Liste mit kostenstellen 
		2015-01-27
			-Schätzwert ausgeschlossen
	-->	
	
	<xsl:template match="/">
		<xsl:apply-templates select="imdasData/object/row[field[@id='SAP-Bewertung abgeschlossen'] = 'Ja']" />
	</xsl:template>

	<xsl:template match="row">
	 
		<xsl:call-template name="ausgabe">	
		
			<xsl:with-param name="bezeichnung_1">
				<!--  <xsl:value-of select="field[@id='Inv.Nr.']" />
				<xsl:text> : </xsl:text> -->
				<xsl:value-of select="./field[@id='Objektbezeichnung']" />
			</xsl:with-param>
			
			<xsl:with-param name="bezeichnung_2" select="./field[@id='Titel (Museumsobjekt)']" />			
			
			<xsl:with-param name="inventarnummer" select="./field[@id='Inv.Nr.']"/>
			
			<xsl:with-param name="imdas-nummer" select="./field[@id='IMDAS ID']" />
			
			<xsl:with-param name="aktivierungsdatum">
				<xsl:choose>
					<xsl:when test="string-length(normalize-space(./field[@id='Eingangsdatum'])) &gt; 0">
						<xsl:value-of select="./field[@id='Eingangsdatum']" />
					</xsl:when>
					<xsl:when test="string-length(normalize-space(./field[@id='Eingangsdatum (Text)'])) &gt; 0">
						<xsl:variable name="datum1" >
							<xsl:call-template name="normDate">
								<xsl:with-param name="datum" select="./field[@id='Eingangsdatum (Text)']" />
							</xsl:call-template>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="string-length($datum1) > 1">
								<xsl:value-of select="$datum1" />
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="'01.01.1900'" />
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'01.01.1900'" />
					</xsl:otherwise>
				</xsl:choose> 
			</xsl:with-param>
			
			<xsl:with-param name="kostenstelle">
				<xsl:choose>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Ankauf'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Ankauf aus Internet-Versteigerung'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Ankauf aus Versteigerung'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Ankauf mit Mitteln des Zentralfonds'"><xsl:text>7952111111</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Ausgrabung'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Depositum'"><xsl:text>7952222222</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Depotfund'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Fund'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Nachlass'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Schenkung'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Spende'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Sperrmüllfund'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Stiftung'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Tausch'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Übernahme'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Unbekannt'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Vermächtnis'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Zuteilung'"><xsl:text>7952000000</xsl:text></xsl:when>
					<xsl:when test="normalize-space(./field[@id='Eingangsart']) = 'Zuteilung nach Ausgrabung'"><xsl:text>7952000000</xsl:text></xsl:when>
				</xsl:choose>		
			</xsl:with-param>						
			
			<xsl:with-param name="ordnungsbegriff" select="'Konvolut'" />
			
			<xsl:with-param name="menge">
				<xsl:if test="./field[@id='Teile'] != ''">
					<xsl:value-of select="./field[@id='Teile']" />
				</xsl:if>
				<xsl:if test="./field[@id='Teile'] = ''">
					<xsl:text>1</xsl:text>
				</xsl:if>
			</xsl:with-param>
						
			<xsl:with-param name="kummulierte_ahk">					
				<xsl:choose>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'A - Erinnerungswert 1 Euro'">1</xsl:when>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'B - Mittelwert 50.000 Euro'">50000</xsl:when>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'C - Mittelwert 500.000 Euro'">500000</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row/field[@id='WType'] = 'Vermögensbewertung A - Erinnerungswert 1 Euro'">1</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row/field[@id='WType'] = 'Vermögensbewertung B - Mittelwert 50.000 Euro'">50000</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row/field[@id='WType'] = 'Vermögensbewertung C - Mittelwert 500.000 Euro'">500000</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row/field[@id='WType'] = 'Vermögensbewertung D - Einzelbewertung in Euro'">
						<xsl:value-of select="./subObject[@id='Währungen']/row[field[@id='WType'] = 'Vermögensbewertung D - Einzelbewertung in Euro']/field[@id='WValue']" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="normalize-space(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field) != ''">
							<xsl:value-of select="translate(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field, '.', '')" />
						</xsl:if>
						<xsl:if test="normalize-space(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field) = ''">
							<xsl:for-each select="./subObject[@id='Währungen' and field[@id='WType'] != 'Schätzwert']/row">
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
										<xsl:when test="field[@id='WUnit'] = '€'">
											<xsl:value-of select="translate(field[@id='WValue'], '.', '')" />
										</xsl:when>
										<xsl:when test="field[@id='WUnit'] = 'EURO'">
											<xsl:value-of select="translate(field[@id='WValue'], '.', '')" />
										</xsl:when>
										<xsl:when test="field[@id='WUnit'] = 'EUR'">
											<xsl:value-of select="field[@id='WValue']" />
										</xsl:when>
										<xsl:when test="field[@id='WUnit'] = 'DEM'">
											<xsl:variable name="amount" select="field[@id='WValue']" />
											<xsl:value-of select="number($amount) * 0.54" />
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
							
				<!-- xsl:choose>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'A - Erinnerungswert 1 Euro'">1</xsl:when>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'B - Mittelwert 50.000 Euro'">50000</xsl:when>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'C - Mittelwert 500.000 Euro'">500000</xsl:when>
					<xsl:otherwise>
						<xsl:if test="./subObject[@id='SAP-Einzelbewertung (D)']/row/field != ''">
							<xsl:value-of select="./subObject[@id='SAP-Einzelbewertung (D)']/row/field" />
						</xsl:if>
						<xsl:if test="./subObject[@id='SAP-Einzelbewertung (D)']/row/field = ''">
							<xsl:for-each select="./subObject[@id='Währungen']/row">
   								<xsl:sort select="field[@id='WNote']" data-type="text" order="descending"/>
   								<xsl:if test="position() = 1">
     									<xsl:choose>
										<xsl:when test="field[@id='WUnit'] = 'EUR'">
											<xsl:value-of select="field[@id='WValue']" />
										</xsl:when>
										<xsl:when test="field[@id='WUnit'] = 'DM'">
											<xsl:variable name="amount" select="field[@id='WValue']" />
											<xsl:value-of select="number($amount) * 0.54" />
										</xsl:when>
									</xsl:choose> 
   								</xsl:if>
								</xsl:for-each>									
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose -->
			</xsl:with-param>
										
		</xsl:call-template>
		
	</xsl:template>
	
	<xsl:template name="invertdatum">
		<xsl:param name="datum" />		
		<xsl:value-of select="substring($datum,7,4)"/><xsl:value-of select="substring($datum,4,2)"/><xsl:value-of select="substring($datum,1,2)"/>		
	</xsl:template>

</xsl:stylesheet>