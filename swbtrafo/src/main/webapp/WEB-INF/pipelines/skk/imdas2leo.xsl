<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : skk2leo.xsl
    Created on : 2017-01-05
    Author     : sophie.roelle@bsz-bw.de
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
             	xmlns:xs="http://www.leo-bw.de/xsd/leobw-1.0.0" 
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          		xmlns:java="http://xml.apache.org/xalan/java"
    			exclude-result-prefixes="java">
    
 
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    
	<xsl:template match="/">
		<leobwMetaData xmlns="http://www.leo-bw.de/xsd/leobw-1.0.0">
			<dokumentListe>
				<xsl:apply-templates select="OBJECTS" />
			</dokumentListe>
		</leobwMetaData>
	</xsl:template>  
    
    <xsl:template match="OBJECTS/OBJECT">    
    	<multimedia>
			<idInPartnersystem><xsl:value-of select="./IMDAS_ID"/></idInPartnersystem>
			<xsl:if test="./REAL_OBJ/OBJEKTTITEL">
				<titelName><xsl:value-of select="normalize-space(./REAL_OBJ/OBJEKTTITEL)"/></titelName>
			</xsl:if>
			<xsl:if test="./KATALOGTEXT">
				<kurzbeschreibung>
					<xsl:value-of select="normalize-space(./KATALOGTEXT)"/>
				</kurzbeschreibung>
			</xsl:if>
			<quelleSammlung><xsl:value-of select="./COLL_OBJ/SAMMLUNG"/></quelleSammlung>
    		<xsl:if test="./INVENTARNUMMER">
				<identifikatoren>
					<xsl:value-of select="concat(normalize-space(./INVENTARNUMMER),' [Inv.Nr.]')" />
				</identifikatoren>
			</xsl:if>
			<xsl:for-each select="./TERM_OBJ/SCHLAGWORT">
				<schlagwoerter><xsl:value-of select="." /><xsl:if test="position()!=last()">, </xsl:if></schlagwoerter>
			</xsl:for-each>
    		<weiterImPartnersystemUrl><xsl:text>http://www.kunsthalle-karlsruhe.de/de/sammlung/sammlung-online.html</xsl:text></weiterImPartnersystemUrl>
    		<mediumListe>
				<xsl:apply-templates select="STOR_LOC" />
			</mediumListe>
			<xsl:if test="./OBJ_SPECIALS/ENTSTEHUNGSZEIT">
				<datierungListe>
					<xsl:apply-templates select="OBJ_SPECIALS/ENTSTEHUNGSZEIT" />
				</datierungListe>
			</xsl:if>
			<xsl:if test="./PERSON/ROLLE_FUNKTION">
				<autorListe>
					<xsl:apply-templates select="PERSON" />
				</autorListe>
			</xsl:if>
			<objekttyp>
				<xsl:if test="contains(OBJEKTBEZEICHNUNG,':')">
					<xsl:value-of select="substring-after(OBJEKTBEZEICHNUNG,': ')" />
				</xsl:if>
				<xsl:if test="not(contains(OBJEKTBEZEICHNUNG,':'))">
					<xsl:value-of select="OBJEKTBEZEICHNUNG" />
				</xsl:if>
			</objekttyp>
    		<weitereAngabenObjekt>
				<xsl:if test="TERM/MATERIAL">
					<xsl:apply-templates select="TERM/MATERIAL" />
					<xsl:text> [Material]</xsl:text><br />
				</xsl:if>
				<xsl:if test="TERM/TECHNIK">
					<xsl:apply-templates select="TERM/TECHNIK" />
					<xsl:text> [Technik]</xsl:text><br />
				</xsl:if>
				<xsl:apply-templates select="OBJ_VALUE" />
			</weitereAngabenObjekt>
			<xsl:if test="./TERM_OBJ/SCHLAGWORT">
				<schlagwortDefinitionListe>
					<xsl:for-each select="./TERM_OBJ/SCHLAGWORT">
						<schlagwortDefinition>
							<schlagwort>
								<xsl:value-of select="."/>
							</schlagwort>
						</schlagwortDefinition>
					</xsl:for-each>
				</schlagwortDefinitionListe>
			</xsl:if>
		</multimedia>
    </xsl:template>
    
    <xsl:template match="STOR_LOC">
		<xsl:if test="contains(./BILDBEZEICHNUNG,'[DK BSZ=')">
			<medium>
				<mime><xsl:text>image/jpeg</xsl:text></mime>
				<urlVoll>
					<xsl:text>http://swbexpo.bsz-bw.de/image/skk?id=</xsl:text><xsl:value-of select="concat(../IMDAS_ID,'&amp;img=',substring-after(substring-before(./BILDBEZEICHNUNG,']'),'[DK BSZ='))" />
					<!--  xsl:value-of select="concat('https://swbexpo.bsz-bw.de/image/sgs?id=',../IMAS_ID,'img=1')" /> -->
				</urlVoll>
				<altText><xsl:value-of select="concat(../OBJEKTBEZEICHNUNG,': ',../REAL_OBJ/OBJEKTTITEL)"/></altText>
				<beschreibung><xsl:value-of select="concat(../OBJEKTBEZEICHNUNG,': ',../REAL_OBJ/OBJEKTTITEL)"/></beschreibung>
				<copyright><xsl:text> [Copyright: Staatliche Kunsthalle Karlsruhe]</xsl:text></copyright>
				<typ><xsl:text>BILD</xsl:text></typ>
			</medium>
		</xsl:if>
	</xsl:template>
	
	<!-- Textbasierte Zeitangabe (kein Datierungsthesaurus mit definierten Start- und Endpunkten) -->
	
	<xsl:template match="OBJ_SPECIALS/ENTSTEHUNGSZEIT">
		<datierung>
			<start>
				<beschreibend>
					<xsl:value-of select="."/>
				</beschreibend>
			</start>
			<rolle><xsl:text> [Herstellung]</xsl:text></rolle>
		</datierung>
	</xsl:template>
	
	<!-- Autoren-Personen mit Künstlerhaken in imdas pro: direkt im Element PERSON, ggf. mit Normnummer  -->
	
	<xsl:template match="PERSON">
		<autor>
			<name><xsl:value-of select="./ANZEIGENAME"/></name>
			<xsl:if test="./ANZEIGENAME">
				<typ>DOKUMENT_AUTOR</typ>
			</xsl:if>
			<rolle><xsl:text> [</xsl:text><xsl:value-of select="./ROLLE_FUNKTION"/><xsl:text>]</xsl:text></rolle>
			<xsl:if test="contains(./NORMTYP,'O-GND')">
				<externeId>
					<extId><xsl:value-of select="./LINK"/></extId>
					<typ>PND_ID</typ>
				</externeId>
			</xsl:if>
		</autor>
	</xsl:template>
	
	<!-- Weitere Personen im Element PERSON/WEITEREPERSONEN, ggf. mit Normnummer -->
	
	<xsl:template match="PERSON/WEITEREPERSONEN">
		<beteiligtePersonWerk>
			<name><xsl:value-of select="./ANZEIGENAME"/></name>
			<xsl:if test="./ANZEIGENAME">
				<typ>DOKUMENT_BETEILIGT</typ>
			</xsl:if>
			<rolle><xsl:text>[</xsl:text><xsl:value-of select="./ROLLE_FUNKTION"/><xsl:text>]</xsl:text></rolle>
			<xsl:if test="contains(./NORMTYP,'O-GND')">
				<externeId>
					<extId><xsl:value-of select="./LINK"/></extId>
					<typ>PND_ID</typ>
				</externeId>
			</xsl:if>
		</beteiligtePersonWerk>
	</xsl:template>
	
	<!-- Zusammensetzung der Literaturangabe -->
	
	<xsl:template match="OBJ_LITERATURE">
		<xsl:for-each select="." >
			<xsl:if test="contains(NOTIZ_LIT,'[Okat=')">
				<xsl:value-of select="AUTOR" /><xsl:text>: </xsl:text><xsl:value-of select="BUCHTITEL" /><xsl:text>, </xsl:text><xsl:value-of select="ORT" /><xsl:text> </xsl:text><xsl:value-of select="JAHR" />
			</xsl:if>
		</xsl:for-each>
	</xsl:template> 

	<!-- Teil für Sammelfeld: Material, Mehrfacheinträge / falls vorhanden -->
	
	<xsl:template match="TERM/MATERIAL">
		<xsl:value-of select="."/><xsl:if test="position()!=last()">, </xsl:if>
	</xsl:template>
	
	<!-- Teil für Sammelfeld: Technik, Mehrfacheinträge / falls vorhanden -->
	
	<xsl:template match="TERM/TECHNIK">
		<xsl:value-of select="."/><xsl:if test="position()!=last()">, </xsl:if>
	</xsl:template> 
	
	<!-- Teil für Sammelfeld: Maße, Mehrfacheinträge / falls vorhanden -->
	
	<xsl:template match="OBJ_VALUE">
		<xsl:value-of select="./UNIT_NAME"/><xsl:text>: </xsl:text>
		<xsl:value-of select="./VALUE"/><xsl:text> </xsl:text>
		<xsl:value-of select="./UNIT"/>
		<xsl:if test="OBJEKTTEIL">
			<xsl:text> (</xsl:text><xsl:value-of select="./OBJEKTTEIL"/><xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="position()!=last()">, </xsl:if>
	</xsl:template>  
   
</xsl:stylesheet>
