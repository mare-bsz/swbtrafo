<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:import href="../conv2sap_aenderung.xsl" />
	
		
	<!--
		XSL zur Verarbeitung von XML-Exporten der Staatlichen Kunsthalle Karlsruhe
		
		@version: 1
		@created: 2014-07-28
		@modified: 2014-11-14
		@author: Christof Mainberger, christof.mainberger@bsz-bw.de
		         Boris Falkenstein, boris.falkenstein@bsz-bw.de
		
		Änderungen
		2014-08-28: 
		- Fehlerhandling und Ausgabe in externer Datei:
			- Bestimmung der SAP-Felder in Parametern eines Templates
			- Ausgabe der SAP-Variablen in einem Template 
			- Auslagerung allgemeiner Routinen in eine conv2sap.xsl
		2014-11-14:
		- Tausenderpunkte bei Einzelbewertung D
		-   
	-->	
	
	<xsl:template match="/">
		<xsl:apply-templates />
	</xsl:template>
	
	
	<xsl:template match="row"> 
	
		<xsl:call-template name="ausgabe">
		
		   <xsl:with-param name="anlagennummer" select="./field[@id='SAP-Anlagenummer']" />
			
			<xsl:with-param name="bezeichnung_1" select="./field[@id='Titel (Museumsobjekt)']" />
			
			<xsl:with-param name="bezeichnung_2" select="substring(./field[@id='Objektbezeichnung'],1,45)" />
			
			<xsl:with-param name="inventarnummer" select="./field[@id='Inv.Nr.']" />
			
			<xsl:with-param name="imdas-nummer" select="./field[@id='IMDAS ID']" />
			
			<xsl:with-param name="gueltig_ab">
			   <xsl:call-template name="normDate">
					<xsl:with-param name="datum" select="./subObject[@id='SAP-Exportdatum']/row/field" />
				</xsl:call-template>
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
			<!-- <xsl:include href="skk_kostenstellen.xsl" /> -->
			
			<xsl:with-param name="ordnungsbegriff" >
				<xsl:if test="./field[@id='Stück'] > '1'">
					<xsl:text>Konvolut</xsl:text>
				</xsl:if>
			</xsl:with-param>
			
								
			
			<xsl:with-param name="kumulierte_ahk">
				<xsl:choose>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'A - Erinnerungswert 1 Euro'">1</xsl:when>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'B - Mittelwert 50.000 Euro'">50000</xsl:when>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'C - Mittelwert 500.000 Euro'">500000</xsl:when>
					<xsl:when test="./subObject[@id='SAP-Wertekategorie']/row/field = 'D - Einzelbewertung in Euro'">
					  	 <xsl:value-of select="translate(./subObject[@id='SAP-Einzelbewertung (D) in Euro']/row/field,'.','')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="normalize-space(./subObject[@id='SAP-Wertekategorie']/row/field) = ''">
							<xsl:for-each select="./subObject[@id='Währungen']/row">
   								 	
     								<xsl:choose>
									    
										<xsl:when test="./field[@id='WType'] = 'Vermögensbewertung A – Erinnerungswert 1 Euro'">
     										<xsl:if test="./field[@id='WValue'] != '1'">FEHLER</xsl:if><xsl:text>Verm:1#</xsl:text>
										</xsl:when>
										
										<xsl:when test="./field[@id='WType'] = 'Vermögensbewertung B – Mittelwert 50.000 Euro'">
											<xsl:if test="field[@id='WValue'] != '50000'">FEHLER</xsl:if><xsl:text>Verm:50000#</xsl:text>
										</xsl:when>
										
										<xsl:when test="./field[@id='WType'] = 'Vermögensbewertung C - Mittelwert 500.000 Euro'">
											<xsl:if test="./field[@id='WValue'] != '500000'">FEHLER</xsl:if><xsl:text>Verm:500000#</xsl:text>
										</xsl:when>
									
     									<xsl:when test="./field[@id='WType'] = 'Vermögensbewertung D - Einzelbewertung in Euro'">
											<xsl:text>Verm:</xsl:text><xsl:value-of select="./field[@id='WValue']" /><xsl:text>#</xsl:text>
										</xsl:when>
																				
										<xsl:when test="./field[@id='WUnit'] = 'EUR'">
										    <xsl:value-of select="substring(./field[@id='WType'],1,4)" /><xsl:text>:</xsl:text>
											<xsl:value-of select="./field[@id='WValue']" /><xsl:text>#</xsl:text>
										</xsl:when>
										
										<xsl:when test="./field[@id='WUnit'] = 'DEM' or ./field[@id='WUnit'] = 'DM'">
										<xsl:value-of select="substring(./field[@id='WType'],1,4)" /><xsl:text>:</xsl:text>
											<xsl:variable name="amount" select="./field[@id='WValue']" />
											<xsl:value-of select="number($amount) * 0.54" /><xsl:text>#</xsl:text>
										</xsl:when>
										
									</xsl:choose> 
   								
								</xsl:for-each>									
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:with-param>
										
		</xsl:call-template>
		
	</xsl:template>
	
	
		
	

</xsl:stylesheet>