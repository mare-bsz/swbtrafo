<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:my="http://swbexpo.bsz-bw.de"
	exclude-result-prefixes="my">

	<xsl:import href="../swbexpo.xsl" />

	<!-- XSL zur Verarbeitung von XML-Exporten aus IMDAS-Pro der SKK (Staatliche 
		Kunsthalle Karlsruhe @version: 1.0.04 @created: 18.07.2011 @modified: 20.11.2013 
		@author: christof.mainberger@bsz-bw.de -->

	
	<xsl:template match="/">
		<xsl:apply-templates select="records/record" />
	</xsl:template>

	<xsl:template match="record">
	<xsl:variable name="adab_id" select="substring-before(./titel,' ')" />
		<add>
			<doc>
				<field name="id">
					<xsl:value-of select="$adab_id" />
				</field>
				<field name="coll"><xsl:text>alm</xsl:text></field>
				<field name="display">browse</field>								
				<field name="a_titel">
					<xsl:value-of select="./titel" />
				</field>
				<field name="a_fundnummer">
					<xsl:value-of select="./fundnummer" />
				</field>
				<field name="a_inventarnummer">
					<xsl:value-of select="./inventarnummer" />
				</field>
				<field name="a_alteinventarnummer">
					<xsl:value-of select="./alteinventarnummer" />
				</field>
				<field name="a_fundtyp">
					<xsl:value-of select="./fundtyp" />
				</field>
				<field name="a_wisstyp">
					<xsl:value-of select="./wisstyp" />
				</field>
				<field name="a_farbe">
					<xsl:value-of select="./farbe" />
				</field>
				<field name="a_funktion">
					<xsl:value-of select="./funktion" />
				</field>
				<field name="a_funktionzusammenhang">
					<xsl:value-of select="./funktionzusammenhang" />
				</field>
				<field name="a_erhaltung">
					<xsl:value-of select="./erhaltungl" />
				</field>
				<field name="a_fragment">
					<xsl:value-of select="./fragment" />
				</field>
				<field name="a_datierung">
					<xsl:value-of select="./datierung" />
				</field>
				<field name="a_gehoertzu">
					<xsl:value-of select="./gehoertzu" />
				</field>
				<field name="a_anzahl">
					<xsl:value-of select="./anzahl" />
				</field>
				<field name="a_fundbuchnr">
					<xsl:value-of select="./fundbuchnr" />
				</field>				
				<field name="a_foto">
					<xsl:value-of select="./foto" />
				</field>
				<field name="a_gereinigt">
					<xsl:value-of select="./gereinigt" />
				</field>
				<xsl:if test="./laenge">
					<field name="a_laenge">
						<xsl:value-of select="./laenge" /><xsl:text> </xsl:text><xsl:value-of select="./laengeeinheit" />
					</field>
				</xsl:if>				
				<xsl:if test="./breite">
					<field name="a_breite">
						<xsl:value-of select="./breite" /><xsl:text> </xsl:text><xsl:value-of select="./breiteeinheit" />
					</field>
				</xsl:if>
				<xsl:if test="./tiefe">
					<field name="a_tiefe">
						<xsl:value-of select="./tiefe" /><xsl:text> </xsl:text><xsl:value-of select="./tiefeeinheit" />
					</field>
				</xsl:if>
				<xsl:if test="./gewicht">
				<field name="a_gewicht">
					<xsl:value-of select="./gewicht" /><xsl:text> </xsl:text><xsl:value-of select="./gewichteinheit" />
				</field>
				</xsl:if>
				<field name="a_zeichnung">
					<xsl:value-of select="./zeichnung" />
				</field>
				<field name="a_restauriert">
					<xsl:value-of select="./restauriert" />
				</field>
				<field name="a_beschriftet">
					<xsl:value-of select="./beschriftet" />
				</field>
				
				<field name="s_titel">
					<xsl:value-of select="./titel" />
				</field>
				
				<field name="s_inventarnummer">
					<xsl:value-of select="./inventarnummer" />
				</field>
				
				<field name="image">
					<xsl:text>/</xsl:text><xsl:value-of select="$adab_id" /><xsl:text>.jpg</xsl:text>
				</field>

				<field name="x_titel">
					<xsl:value-of select="./titel" />
				</field>
				<field name="x_inventarnummer">
					<xsl:value-of select="./inventarnummer" />
				</field>
				<field name="x_fundtyp">
					<xsl:value-of select="./fundtyp" />
				</field>
				<field name="x_wisstyp">
					<xsl:value-of select="./wisstyp" />
				</field>
				<field name="x_gehoertzu">
					<xsl:value-of select="./gehoertzu" />
				</field>
			</doc>
		</add>

	</xsl:template>

</xsl:stylesheet>