<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
		
	<!--
		XSL zur Verarbeitung von XML-Exporten aus IMDAS-Pro der SGS (Staatsgalerie Stuttgart)
		
		@version: 2
		@created: 2011-07-18
		@modified: 2016-03-02 
		@author: Christof Mainberger, christof.mainberger@bsz-bw.de  
	-->

	<xsl:import href="../swbexpo.xsl"/> 
	
	<xsl:template match="/">	 
		<add>
			<xsl:apply-templates select="OBJECTS/OBJECT" />
		</add>
	</xsl:template>

	<xsl:template match="OBJECT">
			<doc>
				<field name="id">
					<xsl:value-of select="./IMDAS_ID" />
				</field>
				<field name="coll">
					<xsl:choose>
						<xsl:when test="SAVED_NAMES/OBJEKTAUSWAHL = 'onlinekat-swb-direktlink_2015-Poesie'" >
							<xsl:text>sgs.poesie2015</xsl:text>
						</xsl:when>
						<xsl:when test="SAVED_NAMES/OBJEKTAUSWAHL = 'Ausstellung_2015_Dürer-Leyden'" >
							<xsl:text>sgs.duerer-leyden_2015</xsl:text>
						</xsl:when>
						<xsl:when test="SAVED_NAMES/OBJEKTAUSWAHL = 'onlinekat-swb-direktlink_2016-Stenner'" >
							<xsl:text>sgs.stenner_2016</xsl:text>
						</xsl:when>
						<xsl:when test="SAVED_NAMES/OBJEKTAUSWAHL = 'onlinekat-swb-direktlink_2016-Impressionen'" >
							<xsl:text>sgs.impressionen_2016</xsl:text>
						</xsl:when>
						<xsl:when test="SAVED_NAMES/OBJEKTAUSWAHL = 'onlinekat-swb-direktlink_2016-Schmit'" >
							<xsl:text>sgs.schmit_2016</xsl:text>
						</xsl:when>
						<xsl:when test="SAVED_NAMES/OBJEKTAUSWAHL = 'onlinekat-swb-direktlink_2016-Künstler-Ich'" >
							<xsl:text>sgs.kunstler-ich_2016</xsl:text>
						</xsl:when>
						<xsl:when test="SAVED_NAMES/OBJEKTAUSWAHL = 'onlinekat-swb-direktlink_2016-Rembrandt'" >
							<xsl:text>sgs.rembrandt_2016</xsl:text>
						</xsl:when>
						<xsl:when test="SAVED_NAMES/OBJEKTAUSWAHL = 'Ausstellung_2017_The_Great_Graphic_Boom'" >
							<xsl:text>sgs.graphic_2017</xsl:text>
						</xsl:when>
						<xsl:when test="SAVED_NAMES/OBJEKTAUSWAHL = 'Ausstellung_2017_Pop_Unlimited'" >
							<xsl:text>sgs.pop_2017</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>sgs</xsl:text>
						</xsl:otherwise>
					</xsl:choose>				
				</field>
				<field name="display">browse</field>
				<field name="a_kuenstler">
					<xsl:if test="count(./PERSON/ROLLE_FUNKTION) = 0 and count(./PERSON/WEITEREPERSONEN[contains(ROLLE_FUNKTION, 'Adressat')]) = 0 and ./PERSON/WEITEREPERSONEN/ROLLE_FUNKTION = 'Verfasser'">
						<xsl:value-of select="./PERSON/WEITEREPERSONEN[ROLLE_FUNKTION = 'Verfasser']/ANZEIGENAME" />				
					</xsl:if>
					<xsl:if test="./PERSON/ROLLE_FUNKTION = 'Künstler/in' and ./PERSON/WEITEREPERSONEN/ROLLE_FUNKTION = 'Adressat' and count(./PERSON/WEITEREPERSONEN[contains(ROLLE_FUNKTION, 'Verfasser')]) = 0">
						<xsl:value-of select="./PERSON[contains(ROLLE_FUNKTION, 'Künstler/in')]/ANZEIGENAME" />
							<xsl:text> an </xsl:text>
						<xsl:value-of select="./PERSON/WEITEREPERSONEN[contains(ROLLE_FUNKTION, 'Adressat')]/ANZEIGENAME" />
					</xsl:if>
					<xsl:if test="./PERSON/WEITEREPERSONEN[contains(ROLLE_FUNKTION, 'Verfasser')] and ./PERSON/WEITEREPERSONEN[contains(ROLLE_FUNKTION, 'Adressat')]">
						<xsl:value-of select="./PERSON/WEITEREPERSONEN[contains(ROLLE_FUNKTION, 'Verfasser')]/ANZEIGENAME" />
							<xsl:text> an </xsl:text>
						<xsl:value-of select="./PERSON/WEITEREPERSONEN[contains(ROLLE_FUNKTION, 'Adressat')]/ANZEIGENAME" />
					</xsl:if>
					<xsl:if test="count(./PERSON/NACHNAME) &gt; 0">
						<xsl:call-template name="kuenstler" >
							<xsl:with-param name="personen" select="PERSON[count(NACHNAME) = 1]" />
						</xsl:call-template>
					</xsl:if>
				</field>
				<field name="a_lebensdaten">
					<xsl:call-template name="seperatedList">
						<xsl:with-param name="content" select="./OBJ_USER_FIELDS/LEBENSDATEN_KUENSTLER" />
					</xsl:call-template>
				</field>
				<field name="a_verfasser">
					<xsl:if test="./PERSON/WEITEREPERSONEN/ROLLE_FUNKTION = 'Verfasser'">
						<xsl:value-of select="./PERSON/WEITEREPERSONEN[contains(ROLLE_FUNKTION, 'Verfasser')]/ANZEIGENAME" />
					</xsl:if>
				</field>
				<field name="a_herausgeber">
					<xsl:if test="./PERSON/WEITEREPERSONEN/ROLLE_FUNKTION = 'Herausgeber'">
						<xsl:value-of select="./PERSON/WEITEREPERSONEN[contains(ROLLE_FUNKTION, 'Herausgeber')]/ANZEIGENAME" />
					</xsl:if>
				</field>
				<field name="a_adressat">
					<xsl:if test="./PERSON/WEITEREPERSONEN/ROLLE_FUNKTION = 'Adressat'">
						<xsl:value-of select="./PERSON/WEITEREPERSONEN[contains(ROLLE_FUNKTION, 'Adressat')]/ANZEIGENAME" />
					</xsl:if>
				</field>
				<field name="a_titel">
					<xsl:if test="count(./OBJ_USER_FIELDS/ARCHIVALIENART) = 0">
						<xsl:value-of select="./REAL_OBJ/OBJEKTTITEL" />			
					</xsl:if>
				</field>
				<field name="a_entstehungszeit">
					<xsl:value-of select="./OBJ_SPECIALS/ENTSTEHUNGSZEIT"/>
				</field>	
				<field name="a_technik">
					<xsl:call-template name="seperatedList">
						<xsl:with-param name="content" select="./TERM/TECHNIK" />
					</xsl:call-template>
				</field>
				<field name="a_material">
					<xsl:call-template name="seperatedList">
						<xsl:with-param name="content" select="./TERM/MATERIAL" />
					</xsl:call-template>
				</field>
				<field name="a_masse">						
					<xsl:call-template name="masse" />
				</field>
				<field name="a_standort">
					<xsl:value-of select="./OBJ_USER_FIELDS/STANDORT_KURZFORM" />
				</field>
				<field name="a_hinweis">
					<xsl:value-of select="./OBJ_USER_FIELDS/OBLIGATORISCHER_HINWEIS"/>
				</field>
				<field name="a_inventarnummer">
					<xsl:value-of select="./INVENTARNUMMER" />
				</field>
				<field name="a_textde">
					<xsl:call-template name="cleanKatalogtext">
						<xsl:with-param name="katalogtext" select="./OBJ_USER_FIELDS/TEXTDIGITALERKATALOGDE" />
					</xsl:call-template>
				</field>
				<field name="a_titelen">
					<xsl:value-of select="./OBJ_USER_FIELDS/TITELDIGITALERKATALOGEN" />
				</field>
				<field name="a_texten">
					<xsl:value-of select="./OBJ_USER_FIELDS/TEXTDIGITALERKATALOGEN" />
				</field>
				<field name="a_status">
					<xsl:value-of select="./OBJ_STATUS/STATUS" />
				</field>
				<field name="a_artarchivalie">
					<xsl:value-of select="./OBJ_USER_FIELDS/ARCHIVALIENART" />
				</field>
				<field name="a_zuschreibung">
					<xsl:value-of select="./PERSON[./ROLLE_FUNKTION = 'Künstler/in (ehemalige Zuschreibung)']/ANZEIGENAME" />
				</field>

				<field name="a_eingangsjahr">
					<xsl:choose>
						<xsl:when test="starts-with(./EINGANGSART, 'Leihgabe')"></xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, '/')">
							<xsl:value-of select="substring-before(./EINGANGSDATUM,'/')" />
						</xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, 'vor ')">
							<xsl:value-of select="substring-after(./EINGANGSDATUM,'vor ')" />
						</xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, 'nach ')">
							<xsl:value-of select="substring-after(./EINGANGSDATUM,'nach ')" />
						</xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, 'um ')">
							<xsl:value-of select="substring-after(./EINGANGSDATUM,'um ')" />
						</xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, '[')">
							<xsl:value-of select="substring-before(substring-after(./EINGANGSDATUM,'['),']') " />
						</xsl:when>
						<xsl:when test="./EINGANGSDATUM = 'Anfg.1920er'">1920</xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, 'unbek.')"></xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="extractYear">
								<xsl:with-param name="datum" select="EINGANGSDATUM" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
                                </field>		
				
				<field name="a_copyright"><xsl:value-of select="./OBJ_USER_FIELDS/URHEBERRECHT" /></field>				
				
				<field name="a_sammlung"><xsl:value-of select="./COLL_OBJ/SAMMLUNG" /></field>
				
				<xsl:apply-templates select="./OBJ_WIS_DOK/WISSDOK_INTERN[DOK_ART='Lieblingsstücke dt.']" />
				<xsl:apply-templates select="./OBJ_WIS_DOK/WISSDOK_EXTERN[DOK_ART='Lieblingsstücke dt.']" />	
				
				<xsl:apply-templates select="./OBJ_LITERATURE[contains(NOTIZ_LIT, '[Okat=')]" >
					<xsl:sort data-type="number" select="substring-before(substring-after(NOTIZ_LIT, '[Okat='), ']')" />
				</xsl:apply-templates>
												 
				<xsl:apply-templates select="./STOR_LOC[contains(DATEINAME,'.jpg') or contains(DATEINAME, '.tif')]" >
					<xsl:sort data-type="number" select="substring-before(substring-after(BILDBEZEICHNUNG, '[Okat='), ']')" />
				</xsl:apply-templates>
				
				<xsl:apply-templates select="./STOR_LOC[contains(DATEINAME,'.pdf')]" >
					<xsl:sort data-type="number" select="substring-before(substring-after(BILDBEZEICHNUNG, '[Okat='), ']')" />
				</xsl:apply-templates>
				
				<field name="s_kuenstler">
					<xsl:call-template name="s_kuenstler" >
						<xsl:with-param name="personen" select="PERSON" />
					</xsl:call-template>
				</field>								
				<field name="s_titel">
					<xsl:value-of select="./REAL_OBJ/OBJEKTTITEL" />
				</field>				
				<field name="s_material">
					<xsl:call-template name="seperatedList">
						<xsl:with-param name="content" select="./TERM/MATERIAL" />
					</xsl:call-template>
				</field>				
				<field name="s_standort">
					<xsl:value-of select="./OBJ_USER_FIELDS/STANDORT_KURZFORM" />
				</field>				
				<field name="s_inventarnummer">
					<xsl:value-of select="./INVENTARNUMMER" />
				</field>				
				<field name="s_sammlung">
					<xsl:value-of select="./COLL_OBJ/SAMMLUNG" />
				</field>
				
				<field name="r_eingang">					
					<xsl:choose>
						<xsl:when test="starts-with(./EINGANGSART, 'Leihgabe')"></xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, '/')">
							<xsl:value-of select="substring-before(./EINGANGSDATUM,'/')" />
						</xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, 'vor ')">
							<xsl:value-of select="substring-after(./EINGANGSDATUM,'vor ')" />
						</xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, 'nach ')">
							<xsl:value-of select="substring-after(./EINGANGSDATUM,'nach ')" />
						</xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, 'um ')">
							<xsl:value-of select="substring-after(./EINGANGSDATUM,'um ')" />
						</xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, '[')">
							<xsl:value-of select="substring-before(substring-after(./EINGANGSDATUM,'['),']') " />
						</xsl:when>
						<xsl:when test="./EINGANGSDATUM = 'Anfg.1920er'">1920</xsl:when>
						<xsl:when test="contains(./EINGANGSDATUM, 'unbek.')"></xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="extractYear">
								<xsl:with-param name="datum" select="EINGANGSDATUM" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>				
				</field>			
				
				<xsl:apply-templates select="./PERSON" mode="index"/>
				<xsl:apply-templates select="./REAL_OBJ/OBJEKTTITEL" mode="index" />				
				<xsl:apply-templates select="./TERM/MATERIAL" mode="index" />
				<xsl:apply-templates select="./TERM/TECHNIK" mode="index" />
				<xsl:apply-templates select="./OBJ_USER_FIELDS/STANDORT_KURZFORM" mode="index" />	
				<xsl:apply-templates select="./COLL_OBJ/SAMMLUNG" mode="index" />
				<field name="x_inventarnummer"><xsl:value-of select="./INVENTARNUMMER" /></field>
				<field name="x_status"><xsl:value-of select="./OBJ_STATUS/STATUS" /></field>
				
				
				
				<field name="x_isfavourite"><xsl:if test="./OBJ_WIS_DOK//ANZEIGENAME != ''">true</xsl:if></field>				
		</doc>
	</xsl:template>
	
	<xsl:template match="WISSDOK_INTERN|WISSDOK_EXTERN" >
		<xsl:variable name="verfasser">
			<xsl:choose>
				<xsl:when test="./VERFASSER_INTERN">
					<xsl:value-of select="./VERFASSER_INTERN" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="exName">
			            <xsl:with-param name="anzeigename" select="./ANZEIGENAME" />
			        </xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>			
		</xsl:variable>
		<field name="x_favourite"><xsl:value-of select="$verfasser" /></field>
		<field name="m_testimonial"><xsl:value-of select="$verfasser" /><xsl:text> : </xsl:text><xsl:value-of select="./ANZEIGENAME" /><xsl:text> : </xsl:text><xsl:value-of select="./PERS_NOTIZ" /><xsl:text> : </xsl:text><xsl:value-of select="./DOK_TEXT" /></field>
	</xsl:template>
	
	<xsl:template name="kuenstler">
		<xsl:param name="personen" />		
		<xsl:choose>
			<xsl:when test="count($personen) = 1">
				<xsl:value-of select="$personen/ANZEIGENAME" />
			</xsl:when>
			<xsl:when test="$personen[./ROLLE_FUNKTION = 'Zeichner']">
				<xsl:value-of select="$personen[./ROLLE_FUNKTION = 'Zeichner']/ANZEIGENAME" />
				<xsl:choose>
					<xsl:when test="count($personen[./ROLLE_FUNKTION = 'Erfinder']) = 2">
						<xsl:text> nach </xsl:text><xsl:value-of select="$personen[./ROLLE_FUNKTION = 'Erfinder'][1]/ANZEIGENAME" />
						<xsl:text> und </xsl:text><xsl:value-of select="$personen[./ROLLE_FUNKTION = 'Erfinder'][2]/ANZEIGENAME" />
					</xsl:when>
					<xsl:when test="count($personen[./ROLLE_FUNKTION = 'Erfinder']) = 1">
						<xsl:text> nach </xsl:text><xsl:value-of select="$personen[./ROLLE_FUNKTION = 'Erfinder'][1]/ANZEIGENAME" />
					</xsl:when>
					<xsl:when test="$personen[./ROLLE_FUNKTION = 'Stecher']">
						<xsl:text> und </xsl:text><xsl:value-of select="$personen[./ROLLE_FUNKTION = 'Stecher'][1]/ANZEIGENAME" />
					</xsl:when>
				</xsl:choose>
			</xsl:when>
			<xsl:when test="$personen[./ROLLE_FUNKTION = 'Stecher'] and $personen[./ROLLE_FUNKTION = 'Erfinder']">
				<xsl:value-of select="$personen[./ROLLE_FUNKTION = 'Stecher'][1]/ANZEIGENAME" />
				<xsl:text> nach </xsl:text><xsl:value-of select="$personen[./ROLLE_FUNKTION = 'Erfinder'][1]/ANZEIGENAME" />
			</xsl:when> 
			<xsl:when test="$personen[./ROLLE_FUNKTION = 'Stecher'] and $personen[./ROLLE_FUNKTION = 'Autor']">
				<xsl:value-of select="$personen[./ROLLE_FUNKTION = 'Stecher'][1]/ANZEIGENAME" />
				<xsl:text> mit </xsl:text><xsl:value-of select="$personen[./ROLLE_FUNKTION = 'Autor'][1]/ANZEIGENAME" />
			</xsl:when>

			<xsl:when test="$personen[./ROLLE_FUNKTION = 'Künstler/in'] and $personen[./ROLLE_FUNKTION = 'Erfinder']">
				<xsl:value-of select="$personen[./ROLLE_FUNKTION = 'Künstler/in'][1]/ANZEIGENAME" />
				<xsl:text> nach </xsl:text><xsl:value-of select="$personen[./ROLLE_FUNKTION = 'Erfinder'][1]/ANZEIGENAME" />
			</xsl:when>
			<xsl:when test="count($personen) &gt; 1">
				<xsl:value-of select="$personen[1]/ANZEIGENAME" />
				<xsl:call-template name="weitere"><xsl:with-param name="ws" select="$personen[position() &gt; 1]" /></xsl:call-template>					
			</xsl:when>
		</xsl:choose>			
	</xsl:template>
	
	<xsl:template name="weitere">
		<xsl:param name="ws" />
		<xsl:text>; </xsl:text><xsl:value-of select="$ws[1]/ANZEIGENAME" />
		<xsl:if test="count($ws[1]/NAME) &gt; 1">
			<xsl:call-template name="weitere" >
				<xsl:with-param name="ws" select="$ws[position &gt; 1]" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="s_kuenstler">
		<xsl:param name="personen" />		
			<xsl:value-of select="$personen/NACHNAME" /> <xsl:value-of select="$personen/VORNAME" />
	</xsl:template>
	
	<xsl:template name="SNAME">
		<xsl:param name="person" />
		<xsl:value-of select="$person/NACHNAME" /><xsl:text>, </xsl:text><xsl:value-of select="$person[1]/VORNAME" />
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
	
	<xsl:template match="PERSON" mode="index" >		
		<field name="x_person">
			<xsl:value-of select="./NACHNAME" />
			<xsl:if test="./VORNAME">
				<xsl:text>, </xsl:text>
				<xsl:value-of select="./VORNAME" />
			</xsl:if>
		</field>		
	</xsl:template>
	
	<xsl:template match="OBJEKTTITEL" mode="index" >		
		<field name="x_titel"><xsl:value-of select="." /></field>
	</xsl:template>		
			
	<xsl:template match="TECHNIK"  mode="index">
		<field name="x_technik"><xsl:value-of select="."/></field>
	</xsl:template>
	
	<xsl:template match="MATERIAL" mode="index">
		<field name="x_material"><xsl:value-of select="." /></field>
	</xsl:template>
	
	<xsl:template match="STANDORT_KURZFORM" mode="index" >		
		<field name="x_standort"><xsl:value-of select="." /></field>
	</xsl:template>
	
	<xsl:template match="SAMMLUNG" mode="index" >		
		<field name="x_sammlung"><xsl:value-of select="." /></field>
	</xsl:template>
		
	<xsl:template name="masse" >
		<xsl:choose>
			<xsl:when test="count(./OBJ_VALUE)=1"> 
				<xsl:value-of select="./OBJ_VALUE/UNIT_NAME"/><xsl:text>: </xsl:text><xsl:value-of select="./OBJ_VALUE/VALUE"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./OBJ_VALUE/UNIT" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="./OBJ_VALUE"/>
			</xsl:otherwise>
		</xsl:choose>		
	</xsl:template>
	
	<xsl:template match="OBJ_VALUE" >
		<xsl:value-of select="UNIT_NAME"/><xsl:apply-templates select="OBJEKTTEIL" /><xsl:text>: </xsl:text><xsl:value-of select="VALUE"/><xsl:text>&#160;</xsl:text><xsl:value-of select="UNIT" /><xsl:text>; </xsl:text> 
	</xsl:template>	
	
	<xsl:template match="OBJEKTTEIL">
		<xsl:text>-</xsl:text><xsl:value-of select="." />
	</xsl:template>
		
	<xsl:template match="STOR_LOC[contains(BILDPFAD, 'jpg') or contains(BILDPFAD, '.tif')]" >
		<xsl:if test="contains(BILDBEZEICHNUNG, '[Okat=')">
			<field name="image"><xsl:value-of select="substring(BILDPFAD, 4)"/></field>
		</xsl:if>		
	</xsl:template>
	
	<xsl:template match="STOR_LOC[contains(BILDPFAD, 'pdf')]" >
		<xsl:if test="contains(BILDBEZEICHNUNG, '[Okat=')">
			<field name="pdf"><xsl:value-of select="substring(BILDPFAD, 4)"/></field>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="OBJ_LITERATURE">
		<field name="lit">		
			<xsl:value-of select="AUTOR" /><xsl:text>: </xsl:text><xsl:value-of select="BUCHTITEL" />
			<xsl:if test="ZUSATZ">
				<xsl:text>. </xsl:text><xsl:value-of select="ZUSATZ" />
			</xsl:if>
			<xsl:if test="INBUCH">
				<xsl:text>, In: </xsl:text><xsl:value-of select="INBUCH" />
			</xsl:if>
			<xsl:if test="INZEITSCHRIFT">
				<xsl:text>, In: </xsl:text><xsl:value-of select="INZEITSCHRIFT" />
			</xsl:if>
			<xsl:if test="BAND">
				<xsl:text>, Bd. </xsl:text><xsl:value-of select="BAND" />
			</xsl:if>
			<xsl:if test="ORT">
				<xsl:text>, </xsl:text><xsl:value-of select="ORT" />
			</xsl:if>
			<xsl:if test="JAHR">
				<xsl:text> </xsl:text><xsl:value-of select="JAHR" />
			</xsl:if>
			<xsl:if test="SEITE">
				<xsl:text>, S. </xsl:text><xsl:value-of select="SEITE" />
			</xsl:if>
			<xsl:if test="count(SEITE) = 0 and count(ABB) &gt; 0">
				<xsl:text>, </xsl:text><xsl:value-of select="ABB" />
			</xsl:if>
			<xsl:if test="NR">
				<xsl:text>, Nr. </xsl:text><xsl:value-of select="NR" />
				<xsl:text>. </xsl:text>
			</xsl:if>
			<xsl:if test="count(ABB) = 0 and count(NR) = 0">
				<xsl:text>.</xsl:text>
			</xsl:if>
			<xsl:if test="count(SEITE) &gt; 0 and count(ABB) &gt; 0 and count(NR) = 0">
				<xsl:text>.</xsl:text>
			</xsl:if>
		</field>		
	</xsl:template>
	

</xsl:stylesheet>