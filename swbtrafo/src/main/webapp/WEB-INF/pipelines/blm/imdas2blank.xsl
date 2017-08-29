<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : blm2blank.xsl
    Created on : 2016-08-17
    Modiefied on: 2017-03-14
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
    	<!-- xsl:variable name="avrv" select="./REAL_OBJ/KURZBESCHREIBUNG"></xsl:variable -->
		<record>
			<imdasid><xsl:value-of select="./IMDAS_ID"/></imdasid>
			<institution><xsl:value-of select="./COLL_OBJ/INSTITUTION"/></institution>
			<bereich><xsl:value-of select="./COLL_OBJ/BEREICH"/></bereich>
			<sammlung><xsl:value-of select="./COLL_OBJ/SAMMLUNG"/></sammlung>
    		<objektbezeichnung>
    			<term><xsl:value-of select="./TERM/OBJEKTBEZEICHNUNG_THESAURI"/></term>
				<normdata><xsl:value-of select="./TERM/THESAURUSVERWEISE/VERWEIS[NAME='SWD Identnummer']/VALUE"/></normdata>
			</objektbezeichnung>
    		<xsl:if test="./OBJ_USER_FIELDS/STANDORT_KURZFORM">
				<standort><xsl:value-of select="./OBJ_USER_FIELDS/STANDORT_KURZFORM"/></standort>
			</xsl:if>
    		<xsl:if test="./INVENTARNUMMER">
				<inventarnummer><xsl:value-of select="./INVENTARNUMMER"/></inventarnummer>
			</xsl:if>
			<xsl:if test="./REAL_OBJ/OBJEKTTITEL">
				<titel><xsl:value-of select="./REAL_OBJ/OBJEKTTITEL"/></titel>
			</xsl:if>
			<xsl:if test="contains(./REAL_OBJ/KURZBESCHREIBUNG,'AV: ')">
				<kurzbeschreibung><xsl:value-of select="substring-before(./REAL_OBJ/KURZBESCHREIBUNG,'AV: ')"/></kurzbeschreibung>
			</xsl:if>
			<xsl:if test="contains(./REAL_OBJ/KURZBESCHREIBUNG,'AV: ')">
				<vorderseite>
					<darstellung><xsl:value-of select="substring-after(substring-before(./REAL_OBJ/KURZBESCHREIBUNG, 'RV: '), 'AV: ')" /></darstellung>
				</vorderseite>
				<rueckseite>
					<darstellung><xsl:value-of select="substring-after(./REAL_OBJ/KURZBESCHREIBUNG,'RV: ')" /></darstellung>
				</rueckseite>
			</xsl:if>
			<!-- xsl:if test="./REAL_OBJ/KURZBESCHREIBUNG">
				<vorderseite>
					<darstellung><xsl:value-of select="java:bsz.swbtrafo.util.KenomUtil.descvorderseite($rtf)"/></darstellung>
				</vorderseite>
				<rueckseite>
					<darstellung><xsl:value-of select="java:bsz.swbtrafo.util.KenomUtil.descrueckseite($rtf)"/></darstellung>
				</rueckseite>
			</xsl:if -->
			<xsl:if test="./BESCHREIBUNG">
				<beschreibung><xsl:value-of select="./BESCHREIBUNG"/></beschreibung>
			</xsl:if>
    		<xsl:if test="./REAL_OBJ/ZUSTAND">
				<zustand><xsl:value-of select="./REAL_OBJ/ZUSTAND"/></zustand>
			</xsl:if>
			<xsl:if test="./PERSON/NACHNAME">
				<persons>
					<xsl:for-each select="./PERSON">
						<person>
							<vorname><xsl:value-of select="./VORNAME"/></vorname>
							<nachname><xsl:value-of select="./NACHNAME"/></nachname>
							<role><xsl:value-of select="./ROLLE_FUNKTION"/></role>
							<name><xsl:value-of select="./ANZEIGENAME"/></name>
						</person>
					</xsl:for-each>
				</persons>
			</xsl:if>
     		<xsl:if test="./TERM/DATIERUNG">
				<datierung><xsl:value-of select="./TERM/DATIERUNG"/></datierung>
			</xsl:if>
			<xsl:if test="./OBJ_SPECIALS/ENTSTEHUNGSZEIT">
				<entstehungszeit><xsl:value-of select="./OBJ_SPECIALS/ENTSTEHUNGSZEIT"/></entstehungszeit>
			</xsl:if>
			<xsl:if test="./TERM/MATERIAL">
				<material>
					<xsl:for-each select="./TERM/MATERIAL">
						<materialvalue><xsl:value-of select="."/>
							<sort><xsl:value-of select="./REIHUNG"/></sort>
						</materialvalue>
					</xsl:for-each>
				</material>
			</xsl:if>
			<xsl:if test="./TERM/TECHNIK">
				<technik>
					<xsl:for-each select="./TERM/TECHNIK">
						<technikvalue><xsl:value-of select="."/>
							<sort><xsl:value-of select="./REIHUNG"/></sort>
						</technikvalue>
					</xsl:for-each>
				</technik>
			</xsl:if>
			<dimensions>
				<xsl:apply-templates select="./OBJ_VALUE" />
				<xsl:if test="./STEMPELSTELLUNG">
					<dimension>
						<dimensionname><xsl:text>Stempelstellung</xsl:text></dimensionname>
						<dimensionname_en><xsl:text>orientation</xsl:text></dimensionname_en>
						<dimensionvalue><xsl:value-of select="./STEMPELSTELLUNG"/></dimensionvalue>
						<dimensionunit><xsl:text>clock</xsl:text></dimensionunit>
					</dimension>
				</xsl:if>
			</dimensions>
			<xsl:if test="./TERM_OBJ/DARSTELLUNG">
				<darstellung>
					<xsl:for-each select="./TERM_OBJ/DARSTELLUNG">
						<term><xsl:value-of select="."/></term>
						<termid><xsl:value-of select="./TERM_OBJ[DARSTELLUNG='']/THESAURUSVERWEISE/VERWEIS[NAME='SWD Identnummer']/VALUE"/></termid>
					</xsl:for-each>
				</darstellung>
			</xsl:if>
			<xsl:if test="./TERM_OBJ/IKONOGRAPHIE">
				<ikonographie>
					<xsl:for-each select="./TERM_OBJ/IKONOGRAPHIE">
						<term><xsl:value-of select="."/></term>
						<termid><xsl:value-of select="./TERM_OBJ[IKONOGRAPHIE='']/THESAURUSVERWEISE/VERWEIS[NAME='SWD Identnummer']/VALUE"/></termid>
					</xsl:for-each>
				</ikonographie>
			</xsl:if>
			<xsl:if test="./TERM_OBJ/SCHLAGWORT">
				<schlagwoerter>
					<xsl:for-each select="./TERM_OBJ/SCHLAGWORT">
						<term><xsl:value-of select="."/></term>
						<termid><xsl:value-of select="./TERM_OBJ[SCHLAGWORT='']/THESAURUSVERWEISE/VERWEIS[NAME='SWD Identnummer']/VALUE"/></termid>
					</xsl:for-each>
				</schlagwoerter>
			</xsl:if>
			<xsl:if test="./TERM/ORTE_ZUM_OBJEKT">
				<orte>
					<xsl:for-each select="./TERM/ORTE_ZUM_OBJEKT">
						<term><xsl:value-of select="."/></term>
						<orttyp><xsl:value-of select="../ORTE_TYP"/></orttyp>
						<normdata><xsl:value-of select="../THESAURUSVERWEISE/VERWEIS[NAME='SWD Identnummer']/VALUE"/></normdata>
					</xsl:for-each>
				</orte>
			</xsl:if>
			<xsl:if test="./OBJ_LITERATURE">
				<literatur>
					<xsl:for-each select="./OBJ_LITERATURE">
						<lit>
							<littitle><xsl:value-of select="./TITLE"/></littitle>
							<litshorttitle><xsl:value-of select="./SHORT_TITLE"/></litshorttitle>
							<litauthor><xsl:value-of select="./AUTOR"/></litauthor>
							<lityear><xsl:value-of select="./YEAR_NUMBER"/></lityear>
							<litplace><xsl:value-of select="./PLACE"/></litplace>
							<litpage><xsl:value-of select="./PAGE_NUMBER"/></litpage>
						</lit>
					</xsl:for-each>
				</literatur>
			</xsl:if>
			<exportdate><xsl:value-of select="substring-before(../@export_date,'+01:00')"/></exportdate>
			<lastdate><xsl:value-of select="translate(translate(./LASTDATE,'.','-'),' ','T')"/></lastdate>
			<frontimage>
				<xsl:if test="./STOR_LOC/MEDIENOBJEKT/REIHUNG=1">
					<xsl:value-of select="translate(substring-after(./STOR_LOC[1]/MEDIENOBJEKT/BILDPFAD,'Z:'),'\','/')"/>
				</xsl:if>
			</frontimage>
			<backimage>
				<xsl:if test="./STOR_LOC/MEDIENOBJEKT/REIHUNG=2">
					<xsl:value-of select="translate(substring-after(./STOR_LOC[2]/MEDIENOBJEKT/BILDPFAD,'Z:'),'\','/')"/>
				</xsl:if>
			</backimage>
			<datei1>
				<xsl:if test="./STOR_LOC/MEDIENOBJEKT/REIHUNG=1">
					<name><xsl:value-of select="translate(./STOR_LOC[1]/MEDIENOBJEKT/DATEINAME,' ','_')"/></name>
				</xsl:if>
				<xsl:if test="./STOR_LOC[1]/MEDIENOBJEKT/ANZEIGENAME">
					<fotograf><xsl:value-of select="./STOR_LOC[1]/MEDIENOBJEKT/ANZEIGENAME"/></fotograf>
				</xsl:if>
    		</datei1>
    		<datei2>
    			<xsl:if test="./STOR_LOC/MEDIENOBJEKT/REIHUNG=2">
					<name><xsl:value-of select="translate(./STOR_LOC[2]/MEDIENOBJEKT/DATEINAME,' ','_')"/></name>
				</xsl:if>
				<xsl:if test="./STOR_LOC[2]/MEDIENOBJEKT/ANZEIGENAME">
					<fotograf><xsl:value-of select="./STOR_LOC[2]/MEDIENOBJEKT/ANZEIGENAME"/></fotograf>
				</xsl:if>
    		</datei2>
    	</record>
    </xsl:template>
    
	<xsl:template match="OBJ_VALUE">
		<xsl:for-each select=".">
			<dimension>
				<dimensionname><xsl:value-of select="UNIT_NAME"/></dimensionname>
				<dimensionname_en>
					<xsl:if test="UNIT_NAME='Höhe'"><xsl:text>height</xsl:text></xsl:if>
					<xsl:if test="UNIT_NAME='Breite'"><xsl:text>width</xsl:text></xsl:if>
					<xsl:if test="UNIT_NAME='Tiefe'"><xsl:text>depth</xsl:text></xsl:if>
					<xsl:if test="UNIT_NAME='Durchmesser'"><xsl:text>diameter</xsl:text></xsl:if>
					<xsl:if test="UNIT_NAME='Gewicht'"><xsl:text>weight</xsl:text></xsl:if>
				</dimensionname_en>
				<dimensionvalue>
					<xsl:value-of select="translate(VALUE,',','.')">
						<xsl:value-of select="VALUE"/>
					</xsl:value-of>
				</dimensionvalue>
				<dimensionunit><xsl:value-of select="UNIT"/></dimensionunit>
			</dimension>
		</xsl:for-each>
	</xsl:template>
   
</xsl:stylesheet>
