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
		2016-12-13
			-Übernahme nach Swbtrafo2	
	-->	
	
	<xsl:template match="/">
		<xsl:apply-templates select="imdasData/object/row" mode="record"/>
	</xsl:template>

	<xsl:template match="row" mode="record"> 
		
		<xsl:call-template name="ausgabe">
		
		 		<xsl:with-param name="sap">
					<xsl:if test="field[@id='SAP-Bewertung abgeschlossen'] = 'Ja'">Ja</xsl:if>
					<xsl:if test="field[@id='SAP-Bewertung abgeschlossen'] != 'Ja'">Nein</xsl:if>
				</xsl:with-param>
						
				<xsl:with-param name="bezeichnung_1">
					<!-- <xsl:value-of select="field[@id='Inv.Nr.']" />
					<xsl:text> : </xsl:text> -->
					<xsl:value-of select="./field[@id='Objektbezeichnung']" />
				</xsl:with-param>
				
				<xsl:with-param name="bezeichnung_2" select="./field[@id='Titel (Museumsobjekt)']" />
				
				<xsl:with-param name="inventarnummer" select="./field[@id='Inv.Nr.']"/>
				
				<xsl:with-param name="imdas-nummer" select="./field[@id='IMDAS ID']" />
				
				<xsl:with-param name="aktivierungsdatum" >
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
						<xsl:when test="./field[@id='Eingangsart'] = 'Erwerbung Museumsstiftung'"><xsl:text>7950010000</xsl:text></xsl:when>
						<xsl:when test="starts-with(./field[@id='Eingangsart'],'Erwerbung MWK')"><xsl:text>7950060000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Erwerbung Staatsgalerie'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Erwerbung Zentralfonds'"><xsl:text>7950050000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Korrespondenz/Dokumentenablage'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Schenkung'"><xsl:text>7950020000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Tausch'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überlassung Stiftung Domnick'"><xsl:text>7950030000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus dem d. Vermög.-u. Hochbauamt Konstanz'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus dem Kupferstichkabinett'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus dem Landesgewerbeamt'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus dem Landesmuseum'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus dem Staatsministerium BW'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus dem Württ. Staatstheater Stuttg.'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus der ABK Stuttgart'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus der ehem. Altertümersammlung'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus der Württemb. Hofbibliothek'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung der Königl. Öffentl. Bibliothek'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung der Pädag. Hochschule Esslingen'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus Schloss Ludwigsburg'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung der Ludwigsburger Porzellanmanufaktur'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung MWK'"><xsl:text>7950040000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung Staatl. Verm.u-Hochbauamt Ludwigsburg'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung Verein zur Förderung der Kunst'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung vor 1843'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Erwerbung Zentralfonds und Museumsstiftung'"><xsl:text>7950010000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Erwerbung Staatsgalerie und Galerieverein'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Unbekannt'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Vermächtnis'"><xsl:text>7950020000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Kunsterwerb Allgemein'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus d. Vermög.-u. Hochbauamt Konstanz'"><xsl:text>7950000000</xsl:text></xsl:when>
						<xsl:when test="./field[@id='Eingangsart'] = 'Überstellung aus dem Kowarzik Hilfsfonds'"><xsl:text>7950000000</xsl:text></xsl:when>
						<!--  xsl:when test="./field[@id='Eingangsart'] = ''"><xsl:text>7950000000</xsl:text></xsl:when -->				
						<xsl:otherwise></xsl:otherwise>												
					</xsl:choose>
				</xsl:with-param>
				
				<xsl:with-param name="ordnungsbegriff">
					<xsl:if test="./field[@id='Stück'] > '1'">
						<xsl:text>Konvolut</xsl:text>
					</xsl:if>
				</xsl:with-param>
				
				<xsl:with-param name="menge" select="field[@id='Stück']" />
				
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
								<xsl:apply-templates select="./subObject[@id='Währungen']" mode="waehrung">
									<xsl:with-param name="pos" select="1" />
								</xsl:apply-templates>														
							</xsl:if>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
											
		</xsl:call-template>	
		
		
		
	</xsl:template>	
	
	<xsl:template match="subObject" mode="waehrung">
		<xsl:param name="pos" />
		<xsl:choose>
			<xsl:when test="./row[contains(field[@id='WType'],'Vermögensbewertung A')]">1</xsl:when>
			<xsl:when test="./row[contains(field[@id='WType'],'Vermögensbewertung B')]">50000</xsl:when>
			<xsl:when test="./row[contains(field[@id='WType'],'Vermögensbewertung C')]">500000</xsl:when>
			<xsl:when test="./row[contains(field[@id='WType'],'Vermögensbewertung D')]">
				<xsl:call-template name="umrechnung">
					<xsl:with-param name="unit" select="./row[contains(field[@id='WType'],'Vermögensbewertung D')]/field[@id='WUnit']"></xsl:with-param>
					<xsl:with-param name="value" select="./row[contains(field[@id='WType'],'Vermögensbewertung D')]/field[@id='WValue']"></xsl:with-param>
				</xsl:call-template>				
			</xsl:when>					
			<xsl:when test="./row[contains(field[@id='WType'],'Versicherungswert')]">
				<xsl:apply-templates select="./row[contains(field[@id='WType'],'Versicherungswert')]" mode="waehrung">
					<xsl:with-param name="pos" select="$pos" />
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
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="./row[contains(field[@id='WType'],'Kaufpreis')]" >									
				<xsl:apply-templates select="./row[contains(field[@id='WType'],'Kaufpreis')]" mode="waehrung">
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
					<xsl:with-param name="pos" select="$pos" />
				</xsl:apply-templates>
			</xsl:when>
			<xsl:when test="./row[contains(field[@id='WType'],'Inventarbucheintrag')]" >
				<xsl:apply-templates select="./row[contains(field[@id='WType'],'Inventarbucheintrag')]" mode="waehrung">
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
					<xsl:with-param name="pos" select="$pos" />
				</xsl:apply-templates>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	
	
	<xsl:template match="row" mode="waehrung">
		<xsl:param name="pos" />			
		<xsl:if test="position() = $pos">
			<xsl:choose>				
				<xsl:when test="contains('Euro,EUR',field[@id='WUnit'])">
					<xsl:value-of select="field[@id='WValue']" />
				</xsl:when>
				<xsl:when test="contains('DEM,DM',field[@id='WUnit'])">
					<xsl:value-of select="ceiling(number(field[@id='WValue']) * 0.51129)" />
				</xsl:when>	
				<xsl:otherwise>
					<xsl:apply-templates select="./.." mode="waehrung">
						<xsl:with-param name="pos" select="$pos + 1" />
					</xsl:apply-templates>
				</xsl:otherwise>
			</xsl:choose> 
		</xsl:if>
	</xsl:template>	
	
	<xsl:template name="umrechnung" >
		<xsl:param name="unit" />
		<xsl:param name="value" />
		<xsl:message><xsl:value-of select="$unit" /></xsl:message>
		<xsl:choose>
			<xsl:when test="contains('Euro,EUR',$unit)">
				<xsl:value-of select="$value" />
			</xsl:when>
			<xsl:when test="contains('DEM,DM',$unit)">
				<xsl:value-of select="ceiling(number($value) * 0.51129)" />
			</xsl:when>					
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>