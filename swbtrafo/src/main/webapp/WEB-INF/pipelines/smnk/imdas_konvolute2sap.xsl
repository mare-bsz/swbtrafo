<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
	xmlns:java="http://xml.apache.org/xalan/java"
    exclude-result-prefixes="java">
	
	<xsl:import href="../conv2sap.xsl" />
		
	<!--
		XSL zur Verarbeitung von XML-Exporten des Staatlichen Naturkundemuseum Karlsruhe
		
		@version: 1 
		@created: 2014-09-01
		@author: Christof Mainberger, christof.mainberger@bsz-bw.de
		
		Abgeleitet aus em LIM-Template
		2015-01-27
			-Schätzwert ausgeschlossen
		 
	-->	
		
	<xsl:template match="/">
		<xsl:apply-templates select="OBJECTS/OBJECT[OBJ_USER_FIELDS/SAP/SAP-BEWERTUNG_ABGESCHLOSSEN = '1']" mode="rec" /> 
	</xsl:template>

	<xsl:template match="OBJECT" mode="rec">
			 
		<xsl:call-template name="ausgabe">	
		
			<xsl:with-param name="bezeichnung_1" select="./KONVOLUTBEZEICHNUNG" />
			
			<xsl:with-param name="bezeichnung_2" select="./KONVOLUTBEZEICHNUNG" />			
			
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
						<xsl:when test="contains(./EINGANGSART, 'Aufsammlungen')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Alte Sammlungsbestände')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Dauerleihnahme')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Depotfund')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Donation')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Eigenprodukt')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Erwerbungen')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Funde')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Fund')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Kauf')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Leihnahme')"><xsl:text></xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Museumsstiftung')"><xsl:text>7940111111</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Nachlass')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Schenkung')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Spende')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Tausch')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Unbekannt')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'unbekannt')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Zuweisung')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./EINGANGSART, 'Zentralfonds')"><xsl:text>7940111111</xsl:text></xsl:when>					
					</xsl:choose>
				</xsl:with-param>
						
			
			<xsl:with-param name="ordnungsbegriff" select="'Konvolut'" />
			
			<xsl:with-param name="menge">
				<xsl:if test="normalize-space(./TEILE) != ''">
					<xsl:value-of select="./TEILE" />
				</xsl:if>
				<xsl:if test="normalize-space(./TEILE) = ''">
					<xsl:text>1</xsl:text>
				</xsl:if>
			</xsl:with-param>
											
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
	
	<xsl:template name="waehrungen">
		<xsl:param name="waehrungen" />
		<xsl:choose>
			<xsl:when test="$waehrungen/row[contains(field[@id='WType'],'Versicherungswert')]">
				<xsl:for-each select="$waehrungen/row[contains(field[@id='WType'],'Versicherungswert')]"> 
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
						<xsl:call-template name="calcAmount">
							<xsl:with-param name="unit" select="field[@id='WUnit']" />
							<xsl:with-param name="value" select="field[@id='WValue']" />
						</xsl:call-template>		     								 
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$waehrungen/row[contains(field[@id='WType'],'Kaufpreis')]">
				<xsl:for-each select="$waehrungen/row[contains(field[@id='WType'],'Kaufpreis')]">
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
							<xsl:call-template name="calcAmount">
								<xsl:with-param name="unit" select="field[@id='WUnit']" />
								<xsl:with-param name="value" select="field[@id='WValue']" />
							</xsl:call-template>
						</xsl:if>
				</xsl:for-each>
			</xsl:when>
			<xsl:when test="$waehrungen/row[contains(field[@id='WType'],'Inventarbucheintrag')]">
				<xsl:for-each select="$waehrungen/row[contains(field[@id='WType'],'Inventarbucheintrag')]">
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
						<xsl:call-template name="calcAmount">
							<xsl:with-param name="unit" select="field[@id='WUnit']" />
							<xsl:with-param name="value" select="field[@id='WValue']" />
						</xsl:call-template>				
					</xsl:if>
				</xsl:for-each>
			</xsl:when>
		</xsl:choose>	
	</xsl:template>
	
	<xsl:template name="calcAmount">
		<xsl:param name="unit" />
		<xsl:param name="value" />
		<xsl:variable name="amount" select="translate(translate($value, '.', ''),',','.')" />
		<xsl:choose>
			<xsl:when test="contains('€,EURO,EUR',$unit)">
				<xsl:value-of select="$amount" />
			</xsl:when>			
			<xsl:when test="contains('DEM,DM',$unit)">
				<xsl:value-of select="number($amount) * 0.51129" />
			</xsl:when>			
		</xsl:choose>
	</xsl:template>
	

</xsl:stylesheet>