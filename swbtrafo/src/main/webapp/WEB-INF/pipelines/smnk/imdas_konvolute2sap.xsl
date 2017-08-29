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
		<xsl:apply-templates select="imdasData/object/row[subObject[@id='SAP-Bewertung abgeschlossen']/row/field = 'Ja']" mode="rec" />
	</xsl:template>

	<xsl:template match="row" mode="rec">
			 
		<xsl:call-template name="ausgabe">	
		
			<xsl:with-param name="bezeichnung_1" select="./field[@id='Objektbezeichnung']" />
			
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
			
			<xsl:with-param name="kostenstelle">
					<xsl:choose>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Aufsammlungen')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Alte Sammlungsbestände')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Dauerleihnahme')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Depotfund')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Donation')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Eigenprodukt')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Erwerbungen')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Funde')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Fund')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Kauf')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Leihnahme')"><xsl:text></xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Museumsstiftung')"><xsl:text>7940111111</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Nachlass')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Schenkung')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Spende')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Tausch')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Unbekannt')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'unbekannt')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Zuweisung')"><xsl:text>7940000000</xsl:text></xsl:when>
						<xsl:when test="contains(./field[@id='Eingangsart'], 'Zentralfonds')"><xsl:text>7940111111</xsl:text></xsl:when>					
					</xsl:choose>
				</xsl:with-param>
						
			
			<xsl:with-param name="ordnungsbegriff" select="'Konvolut'" />
			
			<xsl:with-param name="menge">
				<xsl:if test="normalize-space(./field[@id='Teile']) != ''">
					<xsl:value-of select="./field[@id='Teile']" />
				</xsl:if>
				<xsl:if test="normalize-space(./field[@id='Teile']) = ''">
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
					<xsl:when test="./subObject[@id='Währungen']/row[starts-with(field[@id='WType'],'Vermögensbewertung D')]">
						<xsl:value-of select="./subObject[@id='Währungen']/row[starts-with(field[@id='WType'],'Vermögensbewertung D')]/field[@id='WValue']" />
					</xsl:when>
					<xsl:otherwise>						
						<xsl:if test="normalize-space(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field) != ''">
							<xsl:value-of select="translate(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field, '.', '')" />
						</xsl:if>
						<xsl:if test="normalize-space(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field) = ''">
							<xsl:call-template name="waehrungen">
								<xsl:with-param name="waehrungen" select="./subObject[@id='Währungen']"/>
							</xsl:call-template>		
															
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