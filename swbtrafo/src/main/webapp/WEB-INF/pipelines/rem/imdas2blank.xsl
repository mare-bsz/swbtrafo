<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : rem2blank.xsl
    Created on : 2016-08-08
    Author     : christof.mainberger@bsz-bw.de; sophie.roelle@bsz-bw.de
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          		xmlns:java="http://xml.apache.org/xalan/java"
    			exclude-result-prefixes="java">

	
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
       
	<xsl:strip-space elements="*"/>
	
	<xsl:template match="/">
		<records>
			<xsl:apply-templates select="OBJECTS" />
		</records>
	</xsl:template>
	    
    <xsl:template match="OBJECTS/OBJECT">
		<record>
			<imdasid><xsl:value-of select="./field[fieldname='IMDAS ID']/fieldvalue"/></imdasid>
    		<objektbezeichnung><xsl:value-of select="./field[fieldname='Objektbezeichnung']/fieldvalue"/></objektbezeichnung>
    		<xsl:if test="./field[fieldname='Inventarnummer']/fieldvalue">
				<inventarnummer><xsl:value-of select="./field[fieldname='Inventarnummer']/fieldvalue"/></inventarnummer>
			</xsl:if>
    		<sammlung><xsl:value-of select="./field[fieldname='Sammlung']/fieldvalue"/></sammlung>
     		<xsl:if test="./field[fieldname='Nominale / Münzen (Numismatik)']/fieldvalue">
				<nominale><xsl:value-of select="./field[fieldname='Nominale / Münzen (Numismatik)']/fieldvalue"/></nominale>
			</xsl:if>
    		<xsl:if test="./field[fieldname='Entstehungszeit']/fieldvalue">
				<datierung><xsl:value-of select="./field[fieldname='Entstehungszeit']/fieldvalue"/></datierung>
			</xsl:if>
			<xsl:if test="./field[fieldname='Datierung von (Numismatik)']/fieldvalue">
				<datierungvon><xsl:value-of select="./field[fieldname='Datierung von (Numismatik)']/fieldvalue"/></datierungvon>
			</xsl:if>
			<xsl:if test="./field[fieldname='Datierung bis (Numismatik)']/fieldvalue">
				<datierungbis><xsl:value-of select="./field[fieldname='Datierung bis (Numismatik)']/fieldvalue"/></datierungbis>
			</xsl:if>
			<xsl:if test="./field[fieldname='Av-Bild (Numismatik)']">
				<beschreibung>
					<vorderseite>
						<transskription><xsl:value-of select="./field[fieldname='Legende Av (Numismatik)']/fieldvalue"/></transskription>
						<darstellung><xsl:value-of select="./field[fieldname='Av-Bild (Numismatik)']/fieldvalue"/></darstellung>
					</vorderseite>
					<rueckseite>
						<transskription><xsl:value-of select="./field[fieldname='Legende Rv (Numismatik)']/fieldvalue"/></transskription>
						<darstellung><xsl:value-of select="./field[fieldname='Rv-Bild (Numismatik)']/fieldvalue"/></darstellung>
					</rueckseite>
					<rand><xsl:value-of select="./field[fieldname='Rand (Numismatik)']/fieldvalue"/>
				</rand>
				</beschreibung>
			</xsl:if>
    		<xsl:if test="./field[fieldname='Anmerkung (Numismatik Beschreibung)']/fieldvalue">
				<anmerkung><xsl:value-of select="./field[fieldname='Anmerkung (Numismatik Beschreibung)']/fieldvalue" /></anmerkung>
			</xsl:if>
			<dimensions>
				<xsl:apply-templates select="./field[@fieldtype='dimensions']" />
			</dimensions>
			<xsl:if test="./field[fieldname='Münzstätte (Numismatik)']/fieldvalue" >
				<muenzstaette><xsl:value-of select="./field[fieldname='Münzstätte (Numismatik)']/fieldvalue" /></muenzstaette>
			</xsl:if>
			<xsl:if test="./field[fieldname='Prägeherr (Numismatik)']/fieldvalue" >
				<muenzherr><xsl:value-of select="./field[fieldname='Prägeherr (Numismatik)']/fieldvalue" /></muenzherr>
			</xsl:if>
			<xsl:for-each select="./field[fieldname='Dateiname']/fieldvalue">
				<datei><xsl:value-of select="substring-after(current(),'Z:\Bilder\Antike Münzen\')" /></datei>
			</xsl:for-each>
			<lastchange>
				<xsl:value-of select="substring(./field[fieldname='Letztes Änderungsdatum']/fieldvalue,7,4)"/><xsl:text>-</xsl:text>
				<xsl:value-of select="substring(./field[fieldname='Letztes Änderungsdatum']/fieldvalue,4,2)"/><xsl:text>-</xsl:text>
				<xsl:value-of select="substring(./field[fieldname='Letztes Änderungsdatum']/fieldvalue,1,2)"/><xsl:text>T12:00:00</xsl:text>
			</lastchange>
			<exportdate><xsl:value-of select="substring-before(../@export_date,'+01:00')"/></exportdate>
			
    	</record>
    </xsl:template>


<xsl:template match="OBJECT/field[@fieldtype='dimensions']">
	<xsl:for-each select=".">
		<dimension>
			<dimensionname><xsl:value-of select="fieldname"/></dimensionname>
			<dimensionname_en>
				<xsl:if test="fieldname='Höhe'"><xsl:text>height</xsl:text></xsl:if>
				<xsl:if test="fieldname='Länge'"><xsl:text>length</xsl:text></xsl:if>
				<xsl:if test="fieldname='Breite'"><xsl:text>width</xsl:text></xsl:if>
				<xsl:if test="fieldname='Tiefe'"><xsl:text>depth</xsl:text></xsl:if>
				<xsl:if test="fieldname='Durchmesser'"><xsl:text>diameter</xsl:text></xsl:if>
				<xsl:if test="fieldname='Gewicht'"><xsl:text>weight</xsl:text></xsl:if>
			</dimensionname_en>
			<dimensionvalue><xsl:value-of select="fieldvalue"/></dimensionvalue>
			<dimensionunit><xsl:value-of select="fieldunit"/></dimensionunit>
		</dimension>
	</xsl:for-each>
</xsl:template>
			
</xsl:stylesheet>
