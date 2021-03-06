<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : sgs2leo.xsl
    Created on : 2016-12-20
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
			<xsl:if test="./OBJ_USER_FIELDS/TEXTDIGITALERKATALOGDE">
				<kurzbeschreibung>
					<xsl:value-of select="normalize-space(./OBJ_USER_FIELDS/TEXTDIGITALERKATALOGDE)"/>
				</kurzbeschreibung>
			</xsl:if>
			<xsl:if test="not(contains(OBJ_LITERATURE/BUCHTITEL,'Online-Katalog'))">
				<literatur>
					<xsl:apply-templates select="OBJ_LITERATURE[contains(NOTIZ_LIT,'[Okat=')]">
						<xsl:sort select="JAHR" order="descending"/>
					</xsl:apply-templates>
				</literatur>
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
    		<weiterImPartnersystemUrl><xsl:text>https://www.staatsgalerie.de/sammlung/sammlung-digital/nc.html</xsl:text></weiterImPartnersystemUrl>
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
			<xsl:if test="./PERSON/WEITEREPERSONEN/ROLLE_FUNKTION">
				<beteiligtePersonWerkListe>
					<xsl:apply-templates select="PERSON/WEITEREPERSONEN" />
				</beteiligtePersonWerkListe>
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
    
    <xsl:template match="STOR_LOC">
		<xsl:if test="contains(./BILDBEZEICHNUNG,'[Okat=')">
			<medium>
				<mime><xsl:text>image/jpeg</xsl:text></mime>
				<urlVoll>
					<xsl:text>https://swbexpo.bsz-bw.de/image/sgs?id=</xsl:text><xsl:value-of select="concat(../IMDAS_ID,'&amp;img=',substring-after(substring-before(./BILDBEZEICHNUNG,']'),'[Okat='))" />
					<!--  xsl:value-of select="concat('https://swbexpo.bsz-bw.de/image/sgs?id=',../IMAS_ID,'img=1')" /> -->
				</urlVoll>
				<altText><xsl:value-of select="concat(../TERM/OBJEKTBEZEICHNUNG_THESAURI,': ',../REAL_OBJ/OBJEKTTITEL)"/></altText>
				<beschreibung><xsl:value-of select="concat(../TERM/OBJEKTBEZEICHNUNG_THESAURI,': ',../REAL_OBJ/OBJEKTTITEL)"/></beschreibung>
				<!-- copyright>
					<xsl:if test="string(../OBJ_USER_FIELDS/URHEBERRECHT) != 'gemeinfrei'">
						<xsl:value-of select="concat(' [Copyright: ',../OBJ_USER_FIELDS/URHEBERRECHT,']')"/>
					</xsl:if>
				</copyright -->
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
			<rolle><xsl:value-of select="concat(' [',./ROLLE_FUNKTION,']')"/></rolle>
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
			<rolle><xsl:value-of select="concat(' [',./ROLLE_FUNKTION,']')"/></rolle>
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
		<xsl:if test="position() != 1">
		 	<xsl:text>&lt;br/&gt;</xsl:text>
		</xsl:if>
		<xsl:value-of select="AUTOR" /><xsl:text>: </xsl:text><xsl:value-of select="BUCHTITEL" /><xsl:text>, </xsl:text><xsl:value-of select="ORT" /><xsl:text> </xsl:text><xsl:value-of select="JAHR" />		
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
