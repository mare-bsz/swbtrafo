<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:java="http://xml.apache.org/xalan/java"
    exclude-result-prefixes="java">	

	<!--
	Dieses Stylesheet sammelt templates, die von mehreren Umsetzungsstyles verwendet werden
	@author Christof Mainberger (chrisotf.mainberger@bsz-bw.de)
	@version 1.0
	@created 2011-07-21  
	-->
	
	<xsl:template match="PERSON" >
		<xsl:variable name="label">
			<xsl:call-template name="label">
					<xsl:with-param name="nachname" select="normalize-space(./*/NACHNAME)" />
					<xsl:with-param name="vorname" select="normalize-space(./*/VORNAME)" />
			</xsl:call-template>
		</xsl:variable>
		<kuenstler>
			<xsl:attribute name="name"><xsl:value-of select="./*/ANZEIGENAME" /></xsl:attribute>
			<xsl:attribute name="role"><xsl:value-of select="./*/ROLLE_FUNKTION" /></xsl:attribute>			
			<xsl:attribute name="order">
				<xsl:value-of select="java:bsz.swbtrafo.util.SWBexpoUtil.extendUml($label)" />
			</xsl:attribute>
			<xsl:attribute name="label"><xsl:value-of select="$label" /></xsl:attribute>
		</kuenstler>
	</xsl:template>
	
	<xsl:template name="label">
		<xsl:param name="vorname" />
		<xsl:param name="nachname" />
		<xsl:if test="$nachname">
			<xsl:value-of select="$nachname"/>
			<xsl:if test="$vorname">
				<xsl:text>, </xsl:text><xsl:value-of select="$vorname" />
			</xsl:if>
		</xsl:if>		
	</xsl:template>
	
	<xsl:template name="ordered" >
		<xsl:param name="content"/>
		<xsl:choose>
			<xsl:when test="$content">
				<xsl:attribute name="order">
					<xsl:call-template name="expandUml">
						<xsl:with-param name="content" select="$content" />
					</xsl:call-template>
				</xsl:attribute>
				<xsl:attribute name="label"><xsl:value-of select="$content"/></xsl:attribute>
				<xsl:value-of select="$content"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:attribute name="order">nicht angegeben</xsl:attribute>
				<xsl:text>nicht angegeben</xsl:text>
			</xsl:otherwise>			
		</xsl:choose>	
	</xsl:template>
		
	<xsl:template name="expandUml">
		<xsl:param name="content"/>
		<xsl:value-of select="java:bsz.swbtrafo.util.SWBexpoUtil.extendUml($content)" />		
	</xsl:template>
	
	<xsl:template name="extractYear">
		<xsl:param name="datum"/>
		<xsl:value-of select="java:bsz.swbtrafo.util.SWBexpoUtil.extractYear($datum)" />
	</xsl:template>
	
	<xsl:template name="cleanKatalogtext">
		<xsl:param name="katalogtext"/>
		<xsl:value-of select="java:bsz.swbtrafo.util.SWBexpoUtil.replaceReverseQuestionmark($katalogtext)" />
	</xsl:template>
	
	<xsl:template name="exName">
		<xsl:param name="anzeigename"/>
		<xsl:value-of select="java:bsz.swbtrafo.util.SWBexpoUtil.exName($anzeigename)" />
	</xsl:template>
	
	
	<xsl:template name="seperatedList">
		<xsl:param name="content" />
		<xsl:if test="$content" >
			<xsl:value-of select="$content[1]" />
			<xsl:if test="count($content) &gt; 1">
				<xsl:text>; </xsl:text>
				<xsl:call-template name="seperatedList" >
					<xsl:with-param name="content" select="$content[position() &gt; 1]" />
				</xsl:call-template>
		    </xsl:if>
		</xsl:if>
	</xsl:template>
	
</xsl:stylesheet>