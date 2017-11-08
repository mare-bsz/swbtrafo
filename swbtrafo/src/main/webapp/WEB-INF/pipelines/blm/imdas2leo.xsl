<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : blm2leo.xsl
    Created on : 2017-01-09
    Author     : sophie.roelle@bsz-bw.de
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
          		xmlns:java="http://xml.apache.org/xalan/java"
    			exclude-result-prefixes="java">
    
 
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    
	<xsl:template match="/">
		<xsl:apply-templates select="OBJECTS" />
	</xsl:template>  
    
    <xsl:template match="OBJECTS/OBJECT">    
    	<multimedia xmlns="http://www.leo-bw.de/xsd/leobw-1.0.0">
			<idInPartnersystem><xsl:value-of select="./IMDAS_ID"/></idInPartnersystem>
			<xsl:if test="./REAL_OBJ/OBJEKTTITEL">
				<titelName><xsl:value-of select="normalize-space(./REAL_OBJ/OBJEKTTITEL)"/></titelName>
			</xsl:if>
			<xsl:for-each select="./STOR_LOC[contains(RTF/RTFPFAD, '.rtf')]">
				<kurzbeschreibung>
					<xsl:value-of select="./RTF/RTFPFAD"/>
				</kurzbeschreibung>
			</xsl:for-each>			
			<quelleSammlung><xsl:value-of select="concat(./COLL_OBJ/BEREICH,' - ',./COLL_OBJ/SAMMLUNG)"/></quelleSammlung>
    		<xsl:if test="./INVENTARNUMMER">
				<identifikatoren>
					<xsl:value-of select="concat(normalize-space(./INVENTARNUMMER),' [Inv.Nr.]')" />
				</identifikatoren>
			</xsl:if>
			<schlagwoerter>
			<xsl:for-each select="./TERM_OBJ/SCHLAGWORT">
				<xsl:value-of select="." /><xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
			</schlagwoerter>
    		<weiterImPartnersystemUrl><xsl:text>http://swbexpo.bsz-bw.de/blm/</xsl:text></weiterImPartnersystemUrl>
    		<mediumListe>
				<xsl:apply-templates select="STOR_LOC[contains(./BILDBEZEICHNUNG,' (Digitaler Katalog')]"  mode="bild">
					<xsl:sort select="./REIHUNG" />
				</xsl:apply-templates>
			</mediumListe>
			<xsl:if test="./OBJ_SPECIALS/ENTSTEHUNGSZEIT">
				<datierungListe>
					<xsl:apply-templates select="OBJ_SPECIALS/ENTSTEHUNGSZEIT" />
				</datierungListe>
			</xsl:if>
			<xsl:if test="./TERM/DATIERUNG">
				<datierungListe>
					<xsl:apply-templates select="TERM/DATIERUNG" />
				</datierungListe>
			</xsl:if>
			<xsl:if test="./PERSON/ROLLE_FUNKTION">
				<autorListe>
					<xsl:apply-templates select="PERSON" />
				</autorListe>
			</xsl:if>
			<xsl:if test="./TERM[ORTSTYP='Herstellungsort']" >
				<ortsbezugWerkListe>
					<xsl:apply-templates select="./TERM[ORTSTYP='Herstellungsort']" />
				</ortsbezugWerkListe>
			</xsl:if>
			<objekttyp>
				<xsl:value-of select="./TERM/OBJEKTBEZEICHNUNG_THESAURI"/>
			</objekttyp>
    		<weitereAngabenWerk>
				<xsl:if test="TERM/MATERIAL">
					<xsl:apply-templates select="TERM/MATERIAL" />
					<xsl:text> [Material]</xsl:text><br />
				</xsl:if>
				<xsl:if test="TERM/TECHNIK">
					<xsl:apply-templates select="TERM/TECHNIK" />
					<xsl:text> [Technik]</xsl:text><br />
				</xsl:if>
				<xsl:apply-templates select="OBJ_VALUE" />
				<xsl:text> [Maße]</xsl:text>
			</weitereAngabenWerk>
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
    
    <xsl:template match="STOR_LOC" mode="bild">
		<medium xmlns="http://www.leo-bw.de/xsd/leobw-1.0.0">
			<mime><xsl:text>image/jpeg</xsl:text></mime>
			<pfadVoll>
				<!-- xsl:text>http://swbexpo.bsz-bw.de/blm/image/zoom?id=</xsl:text><xsl:value-of select="concat(../IMDAS_ID,'&amp;img=')" /><xsl:value-of select="position()"/ -->
				<xsl:text>Bilder/</xsl:text><xsl:value-of select="DATEINAME" />
			</pfadVoll>
			<altText><xsl:value-of select="concat(../TERM/OBJEKTBEZEICHNUNG_THESAURI,': ',../REAL_OBJ/OBJEKTTITEL)"/></altText>
			<beschreibung><xsl:value-of select="concat(../TERM/OBJEKTBEZEICHNUNG_THESAURI,': ',../REAL_OBJ/OBJEKTTITEL)"/></beschreibung>
			<copyright><xsl:text> [Copyright: Badisches Landesmuseum Karlsruhe]</xsl:text></copyright>
			<typ><xsl:text>BILD</xsl:text></typ>
			<imgpath><xsl:value-of select="./BILDPFAD" /></imgpath>
		</medium>
	</xsl:template>
	
	<!-- Textbasierte Zeitangabe (kein Datierungsthesaurus mit definierten Start- und Endpunkten) -->
	
	<xsl:template match="OBJ_SPECIALS/ENTSTEHUNGSZEIT">
		<datierung xmlns="http://www.leo-bw.de/xsd/leobw-1.0.0">
			<start>
				<beschreibend>
					<xsl:value-of select="."/>
				</beschreibend>
			</start>
			<rolle><xsl:text> [Herstellung]</xsl:text></rolle>
		</datierung>
	</xsl:template>
	
	<xsl:template match="TERM/DATIERUNG">
		<datierung xmlns="http://www.leo-bw.de/xsd/leobw-1.0.0">
			<start>
				<beschreibend>
					<xsl:value-of select="."/>
				</beschreibend>
			</start>
			<rolle><xsl:text> [Herstellung]</xsl:text></rolle>
		</datierung>
	</xsl:template>
	
	<!-- Ortsangaben -->
	
	<xsl:template match="TERM[ORTSTYP='Herstellungsort']">
		<ortsbezugWerk xmlns="http://www.leo-bw.de/xsd/leobw-1.0.0">
			<ortsname><xsl:value-of select="./NAME"/></ortsname>
			<xsl:if test="./NAME">
				<typ>DOKUMENT_MULTIMEDIA_WERK</typ>
			</xsl:if>
			<rolle><xsl:text> [</xsl:text><xsl:value-of select="./ORTSTYP"/><xsl:text>]</xsl:text></rolle>
			<xsl:if test="contains(./THESAURUSVERWEISE/VERWEIS/NAME,'Identnummer')">
				<externeId>
					<extId><xsl:value-of select="./THESAURUSVERWEISE/VERWEIS/VALUE"/></extId>
					<typ>SWD_ID</typ>
				</externeId>
			</xsl:if>
		</ortsbezugWerk>
	</xsl:template>
	
	<!-- Autoren-Personen mit Künstlerhaken in imdas pro: direkt im Element PERSON, ggf. mit Normnummer  -->
	
	<xsl:template match="PERSON">
		<autor xmlns="http://www.leo-bw.de/xsd/leobw-1.0.0">
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
		<beteiligtePersonWerk xmlns="http://www.leo-bw.de/xsd/leobw-1.0.0">
			<name><xsl:value-of select="./ANZEIGENAME"/></name>
			<xsl:if test="./ANZEIGENAME">
				<typ>DOKUMENT_BETEILIGT</typ>
			</xsl:if>
			<rolle><xsl:text> [</xsl:text><xsl:value-of select="./ROLLE_FUNKTION"/><xsl:text>]</xsl:text></rolle>
			<xsl:if test="contains(./NORMTYP,'O-GND')">
				<externeId>
					<extId><xsl:value-of select="./LINK"/></extId>
					<typ>PND_ID</typ>
				</externeId>
			</xsl:if>
		</beteiligtePersonWerk>
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
