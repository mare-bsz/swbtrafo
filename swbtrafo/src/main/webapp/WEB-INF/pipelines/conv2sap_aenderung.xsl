<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:java="http://xml.apache.org/xalan/java"
    exclude-result-prefixes="java">	
		
	<!--
		XSL zur Bereitstellung grundlegender XSL-Routinen für die SAP-Aufbereitung
		
		@version: 1.1
		@created: 2014-08-28
		@modified: 2017-03-08
		@author: Christof Mainberger, christof.mainberger@bsz-bw.de, Boris Falkenstein
		
		
				  
	-->	
	
	<xsl:template name="ausgabe">
	
		<xsl:param name="sap" select="./field[@id='SAP-Bewertung abgeschlossen']" />
	
		<xsl:param name="buchungskreis" select="'1400'"/>
		
		<xsl:param name="anlagennummer"/>
		
		<xsl:param name="anlagenunternummer" select="'0000'"/>
		
		<xsl:param name="bezeichnung_1"/>
		
		<xsl:param name="bezeichnung_2"/>
		
		<xsl:param name="inventarnummer" />
		
		<xsl:param name="imdas-nummer" />
		
		<xsl:param name="gueltig_ab" /> 
		
		<xsl:param name="gueltig_bis" select="'99991231'" />
		
		<xsl:param name="kostenstelle" />
		
		<xsl:param name="ordnungsbegriff" select="''" />			
		
		<xsl:param name="menge" select="'1'" />
		
		<xsl:param name="eigentumskennzeichen" select="'1'" />
		
		<xsl:param name="kumulierte_ahk" />			
	 
		<add>
			<doc>
				<xsl:attribute name="status">
					<xsl:choose>
						<xsl:when test="$sap != 'Ja'">SAP-Bewertung nicht abgeschlossen (Inv.Nr. <xsl:value-of select='$inventarnummer'/>)</xsl:when>
						<xsl:when test="string-length($inventarnummer) &gt; 25">Inventarnummer länger als 25 Zeichen (Inv.Nr. <xsl:value-of select='$inventarnummer'/>)</xsl:when>
						<xsl:when test="string-length($imdas-nummer) &gt; 50">Imdas-Nummer länger als 50 Zeichen (Inv.Nr. <xsl:value-of select='$inventarnummer'/>)</xsl:when>
						<xsl:when test="string-length($kostenstelle) &gt; 10">Kostenstelle länger als 10 Zeichen (Inv.Nr. <xsl:value-of select='$inventarnummer'/>)</xsl:when>
						<xsl:when test="string-length($kostenstelle) = 0">Kostenstelle unbekannt oder nicht angegeben (Inv.Nr. <xsl:value-of select='$inventarnummer'/>)</xsl:when>
						<xsl:when test="string-length($kumulierte_ahk) = 0">Kein Wert angegeben (Inv.Nr. <xsl:value-of select='$inventarnummer'/>)</xsl:when>
						<xsl:when test="starts-with($kumulierte_ahk,'FEHLER')">Werttyp in Wertetabelle entspricht nicht Wert (Inv.Nr. <xsl:value-of select='$inventarnummer'/>)</xsl:when>
						<xsl:otherwise>OK</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				
				<field name="buchungskreis" type="string">
					<xsl:value-of select="$buchungskreis" />
				</field>
				
                <field name="anlagennummer" type="string">
					<xsl:text>00</xsl:text><xsl:value-of select="$anlagennummer" />
				</field>
				
				<field name="anlagenunternummer" type="string">
					<xsl:value-of select="$anlagenunternummer" />
				</field>
								
				<field name="bezeichnung_1" type="string">
					<xsl:value-of select="substring($bezeichnung_1,1,50)" />
				</field>
				
				<field name="bezeichnung_2" type="string">
					<xsl:value-of select="substring($bezeichnung_2,1,50)" />
				</field>
				
				<field name="inventarnummer" type="string">
					<xsl:value-of select="$inventarnummer" />
				</field>
					
				<field name="imdas-nummer" type="string">
					<xsl:value-of select="$imdas-nummer" />
				</field>
				
				<field name="gueltig_ab" type="date">
					<xsl:value-of select="$gueltig_ab" />
				</field>
				
				<field name="gueltig_bis" type="date">
					<xsl:value-of select="$gueltig_bis" />
				</field>
								  				
				<field name="kostenstelle" type="number">
					<xsl:value-of select="$kostenstelle" />
				</field>
				
				<field name="ordnungsbegriff 5" type="string">
					<xsl:value-of select="$ordnungsbegriff" />
				</field>
				
				<field name="eigentumskennzeichen" type="string">
					<xsl:value-of select="$eigentumskennzeichen" />
				</field>
				
				<field name="menge" type="number">
					<xsl:value-of select="$menge" />
				</field>
												
				<field name="kumulierte_ahk" type="string">
				
				  <xsl:choose>
				    <xsl:when test="contains($kumulierte_ahk, '#')">
					   <xsl:call-template name="string-replace-all">
                         <xsl:with-param name="text" select="substring-before(substring-after($kumulierte_ahk, 'Verm:'), '#')" />
                         <xsl:with-param name="replace" select="'.00'" />
                         <xsl:with-param name="by" select="''" />
                       </xsl:call-template>
				    </xsl:when>
				    <xsl:otherwise>
					     <xsl:call-template name="string-replace-all">
                           <xsl:with-param name="text" select="translate($kumulierte_ahk,',','.')" />
                           <xsl:with-param name="replace" select="'.00'" />
                           <xsl:with-param name="by" select="''" />
                       </xsl:call-template>
					</xsl:otherwise>
				  </xsl:choose>
				</field>
											
			</doc>
		</add>
	</xsl:template>	
	
		
	<xsl:template name="normDate">
		<xsl:param name="datum"/>
		<xsl:if test="string-length($datum) != 0"> 
		    <xsl:value-of select="concat(substring($datum,7,4),substring($datum,4,2),substring($datum,1,2))" />
		</xsl:if>
		<xsl:if test="string-length($datum) = 0">
			<xsl:value-of select="java:bsz.swbtrafo.util.XsltUtil.todayDate()" /> 
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="string-replace-all">
    <xsl:param name="text" />
    <xsl:param name="replace" />
    <xsl:param name="by" />
    <xsl:choose>
      <xsl:when test="contains($text, $replace)">
        <xsl:value-of select="substring-before($text,$replace)" />
        <xsl:value-of select="$by" />
        <xsl:call-template name="string-replace-all">
          <xsl:with-param name="text"
          select="substring-after($text,$replace)" />
          <xsl:with-param name="replace" select="$replace" />
          <xsl:with-param name="by" select="$by" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$text" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

	
	
</xsl:stylesheet>