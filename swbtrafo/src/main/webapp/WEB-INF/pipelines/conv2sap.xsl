<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:java="http://xml.apache.org/xalan/java"
    exclude-result-prefixes="java">	
		
	<!--
		XSL zur Bereitstellung grundlegender XSL-Routinen für die SAP-Aufbereitung
		
		@version: 1
		@created: 2014-08-28
		@modified: 2014-09-01
		@author: Christof Mainberger, christof.mainberger@bsz-bw.de
		
		Änderungen: Einbindung von XsltUtil
				  
	-->	
	
	<xsl:template name="ausgabe">
	
		<xsl:param name="sap" select="'Ja'"/>
	
		<xsl:param name="buchungskreis" select="'1400'"/>
		
		<xsl:param name="anlagenklasse" select="'G00200'"/>
		
		<xsl:param name="bezeichnung_1"/>
		
		<xsl:param name="bezeichnung_2"/>
		
		<xsl:param name="inventarnummer" />
		
		<xsl:param name="imdas-nummer" />
		
		<xsl:param name="aktivierungsdatum"/>
				
		<xsl:param name="kostenstelle" />
		
		<xsl:param name="ordnungsbegriff" select="''" />			
		
		<xsl:param name="menge" select="'1'" />
		
		<xsl:param name="eigentumskennzeichen" select="'1'" />
		
		<xsl:param name="bewertungsbereich" select="'01'" />
		
		<xsl:param name="kummulierte_ahk" />			
	 
		<add>
			<doc>
				<xsl:attribute name="status">
					<xsl:choose>
						<xsl:when test="$sap != 'Ja'"><xsl:value-of select="$inventarnummer" />: SAP-Bewertung nicht abgeschlossen</xsl:when>
						<xsl:when test="substring($aktivierungsdatum,7,4) &gt; 2017"><xsl:value-of select="$inventarnummer" />: Aktivierungsdatum groesser 2017</xsl:when>
						<xsl:when test="string-length($aktivierungsdatum) = 0"><xsl:value-of select="$inventarnummer" />: Aktivierungsdatum nicht angegeben</xsl:when>
						<xsl:when test="string-length($inventarnummer) &gt; 25"><xsl:value-of select="$inventarnummer" />: Inventarnummer länger als 25 Zeichen</xsl:when>
						<xsl:when test="string-length($imdas-nummer) &gt; 50"><xsl:value-of select="$inventarnummer" />: Imdas-Nummer länger als 50 Zeichen</xsl:when>
						<xsl:when test="string-length($kostenstelle) &gt; 10"><xsl:value-of select="$inventarnummer" />: Kostenstelle länger als 10 Zeichen</xsl:when>
						<xsl:when test="string-length($kostenstelle) = 0"><xsl:value-of select="$inventarnummer" />: Kostenstelle nicht ermittelt oder nicht angegeben</xsl:when>
						<xsl:when test="string-length($kummulierte_ahk) = 0"><xsl:value-of select="$inventarnummer" />: Kein Wert angegeben</xsl:when>
						<xsl:when test="starts-with($kummulierte_ahk,'FEHLER')"><xsl:value-of select="$inventarnummer" />: Werttyp in Wertetabelle entspricht nicht Wert</xsl:when>
						<xsl:otherwise>OK</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<field name="buchungskreis" type="plain">
					<xsl:value-of select="$buchungskreis" />
				</field>
				<field name="anlagenklasse" type="plain">
					<xsl:value-of select="$anlagenklasse" />
				</field>			
				<field name="bezeichnung_1" type="plain">
					<xsl:value-of select="substring($bezeichnung_1,1,50)" />
				</field>
				<field name="bezeichnung_2" type="plain">
					<xsl:value-of select="substring($bezeichnung_2,1,50)" />
				</field>
				<field name="inventarnummer" type="plain">
					<xsl:value-of select="$inventarnummer" />
				</field>	
				<field name="imdas-nummer" type="plain">
					<xsl:value-of select="$imdas-nummer" />
				</field>
				<field name="aktivierungsdatum" type="date">
					<xsl:choose>
						<xsl:when test="substring($aktivierungsdatum,7,4) &lt; '1900'">
							<xsl:text>19000101</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="substring($aktivierungsdatum,7,4)"/>
							<xsl:value-of select="substring($aktivierungsdatum,4,2)"/>
							<xsl:value-of select="substring($aktivierungsdatum,1,2)"/>
						</xsl:otherwise>						
					</xsl:choose>							
				</field>
				<field name="kostenstelle" type="number">
					<xsl:value-of select="$kostenstelle" />
				</field>
				<field name="ordnungsbegriff 5" type="plain">
					<xsl:value-of select="$ordnungsbegriff" />
				</field>
				<field name="eigentumskennzeichen" type="plain">
					<xsl:value-of select="$eigentumskennzeichen" />
				</field>
				<field name="menge" type="number">
					<xsl:value-of select="$menge" />
				</field>
				<field name="bewertungsbereich" type="plain">
					<xsl:value-of select="$bewertungsbereich" />
				</field>
				<field name="kummulierte_ahk" type="number">
					<xsl:value-of select="translate($kummulierte_ahk,',','.')" />
				</field>							
			</doc>
		</add>
	</xsl:template>	
	
	<xsl:template name="normDate">
		<xsl:param name="datum"/>
		<xsl:if test="string-length($datum) != 0"> 
			<xsl:value-of select="java:bsz.swbtrafo.util.XsltUtil.normalizeDate($datum)" />
			<!--  xsl:text>01.01.1900</xsl:text -->
		</xsl:if>
		<xsl:if test="string-length($datum) = 0">
			<xsl:text>01.01.1900</xsl:text> 
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="sortDate">
		<xsl:param name="datum"/>
		<!-- <xsl:value-of select="java:bsz.swbtrafo.util.XsltUtil.sortableDate($datum)" /> -->
		<xsl:text>01.01.1900</xsl:text>
	</xsl:template>

</xsl:stylesheet>