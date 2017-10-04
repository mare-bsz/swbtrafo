<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
	xmlns:java="http://xml.apache.org/xalan/java"
    exclude-result-prefixes="java">
	
	<xsl:import href="../conv2sap.xsl" />
		
	<!--
		XSL zur Verarbeitung von XML-Exporten der Staatlichen Kunsthalle Karlsruhe
		
		@version: 1
		@created: 2014-07-28
		@modified: 2014-11-07
		@author: Christof Mainberger, christof.mainberger@bsz-bw.de  
		
		Änderungen: 
		2014-08-27:
		- Invertierung des Aktivierungsdatums, Eliminierung von Tausenderpunkten.		
		2014-08-28: 
		- Fehlerhandling und Ausgabe in externer Datei:
			- Bestimmung der SAP-Felder in Parametern eines Templates
			- Ausgabe der SAP-Variablen in einem Template 
			- Auslagerung allgemeiner Routinen in eine conv2sap.xsl
		2014-10-17: 
		- DM als Währung...
		2014-11-07: 
		- Künstler aus Objektbezeichnung rausschneiden 
		2014-12-04:
		- Name statt Objektbezeichnung
		- Die Sortierung der Wertetabelle soll Werners Schreibanweisung umsetzen
		2014-12-05:
		- SAP-Wertekategorien auch aus der Währungenmaske
		2015-01-27
		-Schätzwert ausgeschlossen  
		
	-->	
	
	<xsl:template match="/">
		<xsl:apply-templates select="imdasData/object/row[field[@id='Eingangsart'] != 'Leihgabe' and field[@id='SAP-Bewertung abgeschlossen'] = 'Ja']" />
	</xsl:template>

	<xsl:template match="row"> 
	
		<xsl:call-template name="ausgabe">	
		
			<xsl:with-param name="bezeichnung_1" >
				<!-- <xsl:value-of select="field[@id='Inv.Nr.']" />
				<xsl:text> : </xsl:text> -->
				<!--  Jetzt soll sowieso die Objektbezeichnung rausgenommen werden und stadessen der Künstlernamen eingesetzt werden. 
				
				Die Skk hat z.T. in den Objektbezeichnungen Künstlernamen drin, die eliminiert werden sollen. 
				<xsl:choose>
					<xsl:when test="contains(./field[@id='Objektbezeichnung'],': ')">
						<xsl:value-of select="substring-after(./field[@id='Objektbezeichnung'], ': ')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="./field[@id='Objektbezeichnung']" />
					</xsl:otherwise>
				</xsl:choose>
				-->
				<xsl:choose>
					<xsl:when test="contains(./field[@id='Objektbezeichnung'],': ')">
						<xsl:value-of select="substring-before(./field[@id='Objektbezeichnung'], ': ')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="./field[@id='Objektbezeichnung']" />
					</xsl:otherwise>
				</xsl:choose>				
			</xsl:with-param>
									
			<xsl:with-param name="bezeichnung_2" select="./field[@id='Titel (Museumsobjekt)']" />			
			
			<xsl:with-param name="inventarnummer" select="./field[@id='Inv.Nr.']" />
			
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
					<xsl:when test="./field[@id='Eingangsart'] = 'Altbestand'"><xsl:text>7944300000</xsl:text></xsl:when>
					<xsl:when test="./field[@id='Eingangsart'] = 'Depotfund'"><xsl:text>7944300000</xsl:text></xsl:when>						
					<xsl:when test="./field[@id='Eingangsart'] = 'Kauf'"><xsl:text>7944300000</xsl:text></xsl:when>						
					<xsl:when test="./field[@id='Eingangsart'] = 'Kauf (Museumsstiftung)'"><xsl:text>7944111111</xsl:text></xsl:when>						
					<xsl:when test="./field[@id='Eingangsart'] = 'Kauf (Zentralfond)'"><xsl:text>7944111112</xsl:text></xsl:when>
					<xsl:when test="./field[@id='Eingangsart'] = 'Kauf (Zentralfonds)'"><xsl:text>7944111112</xsl:text></xsl:when>							
					<xsl:when test="./field[@id='Eingangsart'] = 'Schenkung'"><xsl:text>7944300000</xsl:text></xsl:when>						
					<xsl:when test="./field[@id='Eingangsart'] = 'Tausch'"><xsl:text>7944300000</xsl:text></xsl:when>						
					<xsl:when test="./field[@id='Eingangsart'] = 'Übernahme'"><xsl:text>7944300000</xsl:text></xsl:when>						
					<xsl:when test="./field[@id='Eingangsart'] = 'Unbekannt'"><xsl:text>7944300000</xsl:text></xsl:when>						
					<xsl:when test="./field[@id='Eingangsart'] = 'Vermächtnis'"><xsl:text>7944300000</xsl:text></xsl:when>
					<xsl:when test="./field[@id='Eingangsart'] = 'Leihgabe MWK'"><xsl:text>7944111113</xsl:text></xsl:when>											
				</xsl:choose>
			</xsl:with-param>
			
			<xsl:with-param name="ordnungsbegriff">
				<xsl:if test="./field[@id='Stück'] > '1'">
					<xsl:text>Konvolut</xsl:text>
				</xsl:if>
			</xsl:with-param>
			
			<xsl:with-param name="menge" select="./field[@id='Stück']" />
						
			<xsl:with-param name="kummulierte_ahk">	
					
				<xsl:choose>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'A - Erinnerungswert 1 Euro'">1</xsl:when>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'B - Mittelwert 50.000 Euro'">50000</xsl:when>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'C - Mittelwert 500.000 Euro'">500000</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row/field[@id='WType'] = 'Vermögensbewertung A - Erinnerungswert 1 Euro'">1</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row/field[@id='WType'] = 'Vermögensbewertung B - Mittelwert 50.000 Euro'">50000</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row/field[@id='WType'] = 'Vermögensbewertung C - Mittelwert 500.000 Euro'">500000</xsl:when>
					<xsl:when test="./subObject[@id='Währungen']/row[starts-with(field[@id='WType'],'Vermögensbewertung D - Einzelbewertung in Euro')]">
						<xsl:value-of select="./subObject[@id='Währungen']/row[starts-with(field[@id='WType'],'Vermögensbewertung D - Einzelbewertung in Euro')]/field[@id='WValue']" />
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