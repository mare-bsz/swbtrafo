<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : lmw2leo.xsl
    Created on : 2017-01-09
    Author     : sophie.roelle@bsz-bw.de
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				>
    
 
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    
	<xsl:template match="/">
		<xsl:apply-templates select="root" />
	</xsl:template>  
    
    <xsl:template match="root">    
    	<multimedia>
			<idInPartnersystem><xsl:value-of select="./objekt_id"/></idInPartnersystem>
			<xsl:if test="./objekt_name">
				<titelName><xsl:value-of select="normalize-space(./objekt_name)"/></titelName>
			</xsl:if>
			<kurzbeschreibung>
				<xsl:value-of select="normalize-space(./objekt_beschreibung)"/>
			</kurzbeschreibung>
			<quelleSammlung>
				<xsl:for-each select="./collectionSet/sammlung_name">
					<xsl:value-of select="." />
					<xsl:if test="position()!=last()"><br /></xsl:if>
				</xsl:for-each>
			</quelleSammlung>
			<identifikatoren>
				<xsl:value-of select="concat(normalize-space(./objekt_inventarnr),' [Inv.Nr.]')" />
			</identifikatoren>
			<xsl:if test="./tagSet/tag_name !=''">
				<schlagwoerter>
					<xsl:for-each select="./tagSet/tag_name">
						<xsl:value-of select="." /><xsl:if test="position()!=last()">, </xsl:if>
					</xsl:for-each>	
				</schlagwoerter>
			</xsl:if>
			<weiterImPartnersystemUrl><xsl:text>https://www.museum-digital.de/bawue/index.php?t=institution&amp;instnr=1</xsl:text></weiterImPartnersystemUrl>
    		<mediumListe>
				<xsl:apply-templates select="resourceSet" />
			</mediumListe>
			<xsl:if test="./eventSet[ereignistyp_name='Hergestellt']">
				<datierungListe>
					<datierung>
						<start>
							<beschreibend>
								<xsl:value-of select="./eventSet/zeit_name"/>
							</beschreibend>
						</start>
						<rolle>[Herstellung]</rolle>
					</datierung>
				</datierungListe>
				<autorListe>
					<autor>
						<name>
							<xsl:value-of select="./eventSet/persinst_anzeigename"/>
						</name>
						<xsl:if test="./eventSet/persinst_anzeigename">
							<typ>DOKUMENT_AUTOR</typ>
						</xsl:if>
						<rolle>
							<xsl:text> [Hersteller]</xsl:text>
						</rolle>
						<xsl:if test="contains(./eventSet/nodaSet/noda_source,'gnd')">
							<externeId>
								<extId>
									<xsl:value-of select="./eventSet/nodaSet/noda_nrinsource"/>
								</extId>
								<typ>PND_ID</typ>
							</externeId>
						</xsl:if>
					</autor>
				</autorListe>
			</xsl:if>
			<xsl:if test="./eventSet[ereignistyp_name='Hergestellt']/ort_name != ''">
				<ortsbezugWerkListe>
					<ortsbezugWerk>
						<ortsname><xsl:value-of select="./eventSet/ort_name"/></ortsname>
						<xsl:if test="./eventSet/ort_name">
							<typ>DOKUMENT_MULTIMEDIA_WERK</typ>
						</xsl:if>
						<rolle><xsl:text> [Herstellungsort]</xsl:text></rolle>
						<xsl:if test="contains(./eventSet/noda_ort_Set/noda_source,'gnd')">
							<externeId>
								<extId><xsl:value-of select="./eventSet/noda_ort_Set/noda_nrinsource"/></extId>
								<typ>SWD_ID</typ>
							</externeId>
						</xsl:if>
					</ortsbezugWerk>
				</ortsbezugWerkListe>
			</xsl:if>
			<objekttyp>
				<xsl:value-of select="./objektart"/>
			</objekttyp>
    		<weitereAngabenWerk>
				<xsl:value-of select="concat(./objekt_material_technik, ' [Material/Technik]; ', ./objekt_masse, ' [Maße]')"/>
			</weitereAngabenWerk>
			<xsl:if test="./tagSet/tag_name !=''">
				<schlagwortDefinitionListe>
					<xsl:for-each select="./tagSet/tag_name">
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
    
    <xsl:template match="resourceSet">
		<xsl:for-each select=".">
			<medium>
				<mime><xsl:text>image/jpeg</xsl:text></mime>
				<urlVoll>
					<xsl:value-of select="./resource_location" />
				</urlVoll>
				<altText><xsl:value-of select="./resource_name"/></altText>
				<beschreibung><xsl:value-of select="./resource_description"/></beschreibung>
				<copyright><xsl:text>[Copyright: Landesmuseum Würrtemberg Stuttgart]</xsl:text></copyright>
				<typ><xsl:text>BILD</xsl:text></typ>
			</medium>
		</xsl:for-each>
	</xsl:template>
	

	
	<!-- Weitere Personen im Element PERSON/WEITEREPERSONEN, ggf. mit Normnummer -->
	
	<xsl:template match="PERSON/WEITEREPERSONEN">
		<beteiligtePersonWerk>
			<name><xsl:value-of select="./ANZEIGENAME"/></name>
			<xsl:if test="./ANZEIGENAME">
				<typ>DOKUMENT_BETEILIGT</typ>
			</xsl:if>
			<rolle><xsl:value-of select="./ROLLE_FUNKTION"/></rolle>
			<xsl:if test="contains(./NORMTYP,'O-GND')">
				<externeId>
					<extId><xsl:value-of select="./LINK"/></extId>
					<typ>PND_ID</typ>
				</externeId>
			</xsl:if>
		</beteiligtePersonWerk>
	</xsl:template>
	
   
</xsl:stylesheet>
