<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : rem2kenom.xsl
    Created on : 2016-08-08
    Modified on: 2017-03-16
    Author     : christof.mainberger@bsz-bw.de; sophie.roelle@bsz-bw.de
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    			xmlns:lido="http://www.lido-schema.org"
    			xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    			xsi:schemaLocation="http://www.lido-schema.org/schema/v1.0/lido-v1.0.xsd">
                
                <!--
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:str="http://exslt.org/strings"
                xmlns:lido="http://www.lido-schema.org"
                xmlns:date="http://exslt.org/dates-and-times"
                xsi:schemaLocation="http://www.lido-schema.org http://www.lido-schema.org/schema/v1.0/lido-v1.0.xsd"
                extension-element-prefixes="str date"
                exclude-result-prefixes="str date"-->
    
    
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    
	<xsl:strip-space elements="*"/>
    
    <xsl:template match="/">
	    <lido:lidoWrap>
	    	<xsl:apply-templates select="records/record"/>
	    </lido:lidoWrap>
    </xsl:template>   
        
    <xsl:template match="record">
        <lido:lido>
            <lido:lidoRecID lido:source="Reiss-Engelhorn Museen" lido:type="local"><xsl:text>record_DE-MUS-091214_imdaspro_</xsl:text><xsl:value-of select="./imdasid" /></lido:lidoRecID>
            <lido:objectPublishedID lido:type="URI"><xsl:text>http://www.kenom.de/id/record_DE-MUS-091214_imdaspro_</xsl:text><xsl:value-of select="./imdasid" /></lido:objectPublishedID>
			<lido:category>
	        	<lido:conceptID lido:type="URI"><xsl:text>http://www.cidoc-crm.org/crm-concepts/E22</xsl:text></lido:conceptID>
	            <lido:term xml:lang="en"><xsl:text>Man-Made Object</xsl:text></lido:term>
	       	</lido:category>
            <lido:descriptiveMetadata xml:lang="de">
				<lido:objectClassificationWrap>
					<lido:objectWorkTypeWrap>
						<lido:objectWorkType>
							<lido:term><xsl:value-of select="./objektbezeichnung"/></lido:term>
							<xsl:if test="./nominale">
								<lido:term lido:addedSearchTerm="yes"><xsl:value-of select="./nominale"/></lido:term>
							</xsl:if>
						</lido:objectWorkType>
				    </lido:objectWorkTypeWrap>          
					<lido:classificationWrap>
						<lido:classification lido:type="nominal">
							<xsl:if test="./nominale">
								<lido:term><xsl:value-of select="./nominale"/></lido:term>
							</xsl:if>
						</lido:classification>
					</lido:classificationWrap>
				</lido:objectClassificationWrap>
		        <lido:objectIdentificationWrap>
		            <lido:titleWrap>			        	
				    	<lido:titleSet lido:type="given" lido:sortorder="1">
				            <lido:appellationValue>
				            	<xsl:if test="./nominale"><xsl:value-of select="./nominale"/></xsl:if>
				            	<xsl:if test="not(./nominale)"><xsl:value-of select="./objektbezeichnung"/></xsl:if>
				            </lido:appellationValue>
						</lido:titleSet>
						<lido:titleSet lido:type="generated_short" lido:sortorder="2">
							<lido:appellationValue>
								<xsl:value-of select="./objektbezeichnung"/>
								<xsl:if test="./nominale"><xsl:text>, </xsl:text><xsl:value-of select="./nominale"/></xsl:if>
								<xsl:if test="./datierung"><xsl:text>, </xsl:text><xsl:value-of select="./datierung"/></xsl:if>
							</lido:appellationValue>
						</lido:titleSet>
						<lido:titleSet lido:type="generated_long" lido:sortorder="3">
							<lido:appellationValue>
								<xsl:if test="./muenzherr"><xsl:value-of select="./muenzherr"/></xsl:if>
								<xsl:if test="./nominale"><xsl:text>, </xsl:text><xsl:value-of select="./nominale"/></xsl:if>
								<xsl:if test="./datierung"><xsl:text>, </xsl:text><xsl:value-of select="./datierung"/></xsl:if>
							</lido:appellationValue>
						</lido:titleSet>			           
			        </lido:titleWrap>
			        <xsl:if test="./beschreibung">
				        <lido:inscriptionsWrap>
				        	<xsl:if test="./beschreibung/vorderseite">
				                <lido:inscriptions lido:type="front">
				                	<lido:inscriptionTranscription>
				                		<xsl:value-of select="./beschreibung/vorderseite/transskription" />
					                </lido:inscriptionTranscription>
									<lido:inscriptionDescription>
					                	<lido:descriptiveNoteValue>
					                		<xsl:value-of select="./beschreibung/vorderseite/darstellung" />
					                	</lido:descriptiveNoteValue>
					                </lido:inscriptionDescription>
				                </lido:inscriptions>
			                </xsl:if>
			                <xsl:if test="./beschreibung/rueckseite">
				                <lido:inscriptions lido:type="back">
				                	<lido:inscriptionTranscription>
				                		<xsl:value-of select="./beschreibung/rueckseite/transskription" />
					                </lido:inscriptionTranscription>
					                	<lido:inscriptionDescription>
					                		<lido:descriptiveNoteValue>
				                				<xsl:value-of select="./beschreibung/rueckseite/darstellung" />				                				
					                		</lido:descriptiveNoteValue>
					                	</lido:inscriptionDescription>
				                </lido:inscriptions>
			                </xsl:if>		                
			            </lido:inscriptionsWrap>
		           </xsl:if>		            
			        <lido:repositoryWrap>
			        	<lido:repositorySet lido:type="current">
						    <lido:repositoryName>
			                    <lido:legalBodyID lido:type="URI"><xsl:text>http://ld.zdb-services.de/resource/organisations/DE-MUS-091214</xsl:text></lido:legalBodyID>
								<lido:legalBodyName>
			                        <lido:appellationValue><xsl:text>Reiss-Engelhorn-Museen Mannheim</xsl:text></lido:appellationValue>
			                    </lido:legalBodyName>
								<lido:legalBodyWeblink><xsl:text>http://www.reiss-engelhorn-museen@mannheim.de/</xsl:text></lido:legalBodyWeblink>
			                </lido:repositoryName>
			                <xsl:if test="./inventarnummer">
								<lido:workID lido:type="inventory number"><xsl:value-of select="./inventarnummer" /></lido:workID>
							</xsl:if>
			            </lido:repositorySet>			            
			        </lido:repositoryWrap>
			        <xsl:if test="./anmerkung">
			            <lido:objectDescriptionWrap>		            	
					            <lido:objectDescriptionSet lido:type="annotation">
					            	<lido:descriptiveNoteValue>
					            		<xsl:value-of select="./anmerkung"/>
					            	</lido:descriptiveNoteValue>
					            </lido:objectDescriptionSet>
						</lido:objectDescriptionWrap>
			       </xsl:if>
			       <xsl:if test="./dimensions">	
				       <lido:objectMeasurementsWrap>
				        	<lido:objectMeasurementsSet>
								<lido:displayObjectMeasurements>
									<xsl:for-each select="./dimensions/dimension">
									<xsl:value-of select="dimensionname" /><xsl:text>: </xsl:text><xsl:value-of select="dimensionvalue" /><xsl:text> </xsl:text><xsl:value-of select="dimensionunit" /><xsl:if test="position()!=last()">, </xsl:if> 
									</xsl:for-each>
								</lido:displayObjectMeasurements>
							<lido:objectMeasurements>
								<xsl:for-each select="./dimensions/dimension">
				                     <lido:measurementsSet>
				                        <lido:measurementType xml:lang="en"><xsl:value-of select="dimensionname_en" /></lido:measurementType>
				                        <lido:measurementType><xsl:value-of select="dimensionname" /></lido:measurementType>
				                        <lido:measurementUnit><xsl:value-of select="dimensionunit" /></lido:measurementUnit>
				                        <lido:measurementValue><xsl:value-of select="dimensionvalue" /></lido:measurementValue>
				                     </lido:measurementsSet>
								</xsl:for-each>	
							</lido:objectMeasurements> 
			                </lido:objectMeasurementsSet>
	            		</lido:objectMeasurementsWrap>
            		</xsl:if>
		        </lido:objectIdentificationWrap>
		        <lido:eventWrap>
		        	<lido:eventSet>
            			<lido:event>
                			<lido:eventType>
                				<lido:conceptID lido:type="URI"><xsl:text>http://terminology.lido-schema.org/lido00007</xsl:text></lido:conceptID>
                    			<lido:term xml:lang="en"><xsl:text>Production</xsl:text></lido:term>
                    			<lido:term><xsl:text>Herstellung</xsl:text></lido:term>
                			</lido:eventType>							
							<xsl:if test="./datierung">
								<lido:eventDate>
									<lido:displayDate><xsl:value-of select="./datierung"/></lido:displayDate>
										<lido:date>
											<lido:earliestDate><xsl:value-of select="./datierungvon"/></lido:earliestDate>
											<lido:latestDate><xsl:value-of select="./datierungbis"/></lido:latestDate>
										</lido:date>
								</lido:eventDate>
							</xsl:if>
							<xsl:if test="./muenzstaette">
								<lido:eventPlace>
									<lido:displayPlace><xsl:value-of select="./muenzstaette"/></lido:displayPlace>
									<lido:place lido:politicalEntity="minting_place">
										<lido:namePlaceSet>
											<lido:appellationValue><xsl:value-of select="./muenzstaette"/></lido:appellationValue>
										</lido:namePlaceSet>
									</lido:place>
								</lido:eventPlace>
							</xsl:if>
							<xsl:if test="./material/materialvalue">
							    <lido:eventMaterialsTech>	                            	
			                        <lido:displayMaterialsTech><xsl:for-each select="./material/materialvalue"><xsl:value-of select="."/><xsl:if test="position()!=last()">, </xsl:if></xsl:for-each></lido:displayMaterialsTech>
									<lido:materialsTech>
										<xsl:for-each select="./material/materialvalue">
											<lido:termMaterialsTech lido:type="material">
												<lido:term><xsl:value-of select="."/></lido:term>
											</lido:termMaterialsTech>
										</xsl:for-each>
			                        </lido:materialsTech>
			                    </lido:eventMaterialsTech>
							</xsl:if>
            			</lido:event>
					</lido:eventSet>
					<lido:eventSet>
            			<lido:event>
                			<lido:eventType>
                				<lido:conceptID lido:type="URI"><xsl:text>http://terminology.lido-schema.org/lido00226</xsl:text></lido:conceptID>
                    			<lido:term xml:lang="en"><xsl:text>Commissioning</xsl:text></lido:term>
                    			<lido:term><xsl:text>Auftrag</xsl:text></lido:term>
                			</lido:eventType>
							<xsl:if test="./muenzherr">
								<lido:eventActor>
									<lido:displayActorInRole><xsl:value-of select="./muenzherr"/></lido:displayActorInRole>
									<lido:actorInRole>
										<lido:actor lido:type="personal">
											<lido:nameActorSet>
												<lido:appellationValue><xsl:value-of select="./muenzherr"/></lido:appellationValue>
											</lido:nameActorSet>
										</lido:actor>
										<lido:roleActor>
											<lido:conceptID lido:type="URI"><xsl:text>http://id.loc.gov/vocabulary/relators/ctb</xsl:text></lido:conceptID>
											<lido:conceptID lido:type="URI"><xsl:text>http://d-nb.info/gnd/1051614252</xsl:text></lido:conceptID>
											<lido:term>Münzherr</lido:term>
										</lido:roleActor>
									</lido:actorInRole>
								</lido:eventActor>
							</xsl:if>
							<xsl:if test="./regent">
							<lido:eventActor>
								<lido:displayActorInRole><xsl:value-of select="./regent"/></lido:displayActorInRole>
									<lido:actorInRole>
										<lido:actor lido:type="personal">
											<lido:nameActorSet>
												<lido:appellationValue><xsl:value-of select="./regent"/></lido:appellationValue>
											</lido:nameActorSet>
										</lido:actor>
										<lido:roleActor>
											<lido:conceptID lido:type="URI"><xsl:text>http://d-nb.info/gnd/4177396-2</xsl:text></lido:conceptID>
											<lido:term><xsl:text>Regent</xsl:text></lido:term>
										</lido:roleActor>
									</lido:actorInRole>
								</lido:eventActor>
							</xsl:if>
							<xsl:if test="./stifter">
								<lido:eventActor>
									<lido:displayActorInRole><xsl:value-of select="./stifter"/></lido:displayActorInRole>
									<lido:actorInRole>
										<lido:actor lido:type="personal">
											<lido:nameActorSet>
												<lido:appellationValue><xsl:value-of select="./stifter"/></lido:appellationValue>
											</lido:nameActorSet>
										</lido:actor>
										<lido:roleActor>
											<lido:conceptID lido:type="URI"><xsl:text>http://d-nb.info/gnd/4132150-9</xsl:text></lido:conceptID>
											<lido:term><xsl:text>Stifter</xsl:text></lido:term>
										</lido:roleActor>
									</lido:actorInRole>
								</lido:eventActor>
							</xsl:if>
						</lido:event>
					</lido:eventSet>
		        </lido:eventWrap>	        
            </lido:descriptiveMetadata>           
		    <lido:administrativeMetadata xml:lang="de">
	            <lido:recordWrap>
		            <lido:recordID lido:type="local"><xsl:value-of select="./imdasid"/></lido:recordID>
		            <lido:recordType>
						<lido:conceptID lido:type="URI"><xsl:text>http://d-nb.info/gnd/4019715-3</xsl:text></lido:conceptID>
						<lido:term xml:lang="en"><xsl:text>item</xsl:text></lido:term>
		            </lido:recordType>
			        <lido:recordSource>
			            <lido:legalBodyName>
			                <lido:appellationValue><xsl:text>Reiss-Engelhorn-Museen Mannheim</xsl:text></lido:appellationValue>
			            </lido:legalBodyName>
						<lido:legalBodyWeblink><xsl:text>http://www.reiss-engelhorn-museen@mannheim.de/</xsl:text></lido:legalBodyWeblink>
			        </lido:recordSource>
                    <lido:recordRights>
						<lido:rightsType>
							<lido:term><xsl:text>Verwertungsrecht</xsl:text></lido:term>
						</lido:rightsType>
						<lido:rightsHolder>
							<lido:legalBodyID lido:type="URI"><xsl:text>http://ld.zdb-services.de/resource/organisations/DE-MUS-091214</xsl:text></lido:legalBodyID>
							<lido:legalBodyName>
								<lido:appellationValue><xsl:text>Reiss-Engelhorn-Museen Mannheim</xsl:text></lido:appellationValue>
							</lido:legalBodyName>
							<lido:legalBodyWeblink><xsl:text>http://www.reiss-engelhorn-museen@mannheim.de/</xsl:text></lido:legalBodyWeblink>
					</lido:rightsHolder>
					</lido:recordRights>
					<lido:recordInfoSet>
						<lido:recordMetadataDate lido:type="created"><xsl:value-of select="./exportdate"/></lido:recordMetadataDate>
						<lido:recordMetadataDate lido:type="last_modified"><xsl:value-of select="./lastchange"/></lido:recordMetadataDate>
					</lido:recordInfoSet>
		        </lido:recordWrap>
		        <lido:resourceWrap>
	                <lido:resourceSet lido:sortorder="1">                        
			            <lido:resourceID lido:type="local"><xsl:value-of select="./imdasid"/><xsl:text>_media/</xsl:text><xsl:value-of select="./datei[2]"/></lido:resourceID>
			                 <lido:resourceType>
								<lido:term xml:lang="en"><xsl:text>digital image</xsl:text></lido:term>
							</lido:resourceType>
							<lido:resourcePerspective>
         						<lido:conceptID lido:type="URI">http://d-nb.info/gnd/7707654-0</lido:conceptID>
         						<lido:term xml:lang="en">front</lido:term>
      						</lido:resourcePerspective>
      						<lido:rightsResource>
         						<lido:rightsType>
            						<lido:term xml:lang="en">copyright</lido:term>
         						</lido:rightsType>
         						<lido:rightsHolder>
            						<lido:legalBodyName>
               							<lido:appellationValue>
               								<xsl:choose>
               									<xsl:when test="./datei[2]">
               										<xsl:value-of select="./datei[2]/fotograf"/>
               									</xsl:when>
               									<xsl:otherwise>
   													<xsl:text>(c) Reiss-Engelhorn Museen Mannheim</xsl:text>
  												</xsl:otherwise>
               								</xsl:choose>
               								</lido:appellationValue>
            						</lido:legalBodyName>
         						</lido:rightsHolder>
      						</lido:rightsResource>
      						<lido:rightsResource>
         						<lido:rightsType>
            						<lido:term xml:lang="en">publication right</lido:term>
         						</lido:rightsType>
         						<lido:rightsHolder>
            						<lido:legalBodyID lido:type="URI"><xsl:text>http://ld.zdb-services.de/resource/organisations/DE-MUS-091214</xsl:text></lido:legalBodyID>
            						<lido:legalBodyName>
               							<lido:appellationValue><xsl:text>(c) Reiss-Engelhorn Museen Mannheim</xsl:text></lido:appellationValue>
             						</lido:legalBodyName>
             						<lido:legalBodyWeblink>http://www.reiss-engelhorn-museen@mannheim.de/</lido:legalBodyWeblink>
         						</lido:rightsHolder>
      						</lido:rightsResource>
		             </lido:resourceSet>
					 <lido:resourceSet lido:sortorder="2">                        
			            <lido:resourceID lido:type="local"><xsl:value-of select="./imdasid"/><xsl:text>_media/</xsl:text><xsl:value-of select="./datei[1]"/></lido:resourceID>
			                <lido:resourceType>
								<lido:term xml:lang="en"><xsl:text>digital image</xsl:text></lido:term>
							</lido:resourceType>
						<lido:resourcePerspective>
         					<lido:conceptID lido:type="URI">http://d-nb.info/gnd/4468345-5</lido:conceptID>
        					<lido:term xml:lang="en">back</lido:term>
      					</lido:resourcePerspective>
      					<lido:rightsResource>
         					<lido:rightsType>
            					<lido:term xml:lang="en">copyright</lido:term>
         					</lido:rightsType>
         					<lido:rightsHolder>
            					<lido:legalBodyName>
            						<lido:appellationValue>
               							<xsl:choose>
               								<xsl:when test="./datei[1]/fotograf">
               									<xsl:value-of select="./datei[1]/fotograf"/>
               								</xsl:when>
               								<xsl:otherwise>
   												<xsl:text>(c) Reiss-Engelhorn Museen Mannheim</xsl:text>
  											</xsl:otherwise>
               							</xsl:choose>
               						</lido:appellationValue>
            					</lido:legalBodyName>
         					</lido:rightsHolder>
      					</lido:rightsResource>
      					<lido:rightsResource>
         					<lido:rightsType>
            					<lido:term xml:lang="en">publication right</lido:term>
         					</lido:rightsType>
         					<lido:rightsHolder>
            					<lido:legalBodyID lido:type="URI"><xsl:text>http://ld.zdb-services.de/resource/organisations/DE-MUS-091214</xsl:text></lido:legalBodyID>
            					<lido:legalBodyName>
               						<lido:appellationValue><xsl:text>(c) Reiss-Engelhorn Museen Mannheim</xsl:text></lido:appellationValue>
             					</lido:legalBodyName>
             					<lido:legalBodyWeblink>http://www.reiss-engelhorn-museen@mannheim.de/</lido:legalBodyWeblink>
         					</lido:rightsHolder>
      					</lido:rightsResource>
		             </lido:resourceSet>
	            </lido:resourceWrap>
            </lido:administrativeMetadata>        
        </lido:lido>
    </xsl:template>   
</xsl:stylesheet>
