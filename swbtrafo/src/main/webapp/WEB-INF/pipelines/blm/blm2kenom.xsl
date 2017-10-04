<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : blm2kenom.xsl
    Created on : 2016-08-18
    Modiefied on: 2017-03-14
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
            <lido:lidoRecID lido:source="Badisches Landesmuseum Karlsruhe" lido:type="local"><xsl:text>record_DE-MUS-072119_imdaspro_</xsl:text><xsl:value-of select="./imdasid" /></lido:lidoRecID>
            <lido:objectPublishedID lido:type="URI"><xsl:text>http://www.kenom.de/id/record_DE-MUS-072119_imdaspro_</xsl:text><xsl:value-of select="./imdasid"/></lido:objectPublishedID>
			<lido:category>
	        	<lido:conceptID lido:type="URI"><xsl:text>http://www.cidoc-crm.org/crm-concepts/E22</xsl:text></lido:conceptID>
	            <lido:term xml:lang="en"><xsl:text>Man-Made Object</xsl:text></lido:term>
	       	</lido:category>
            <lido:descriptiveMetadata xml:lang="de">
		        <lido:objectClassificationWrap>
		        	<lido:objectWorkTypeWrap>
				        <lido:objectWorkType>
							<lido:conceptID lido:type="URI"><xsl:text>http://d-nb.info/gnd/</xsl:text><xsl:value-of select="./objektbezeichnung/normdata"/></lido:conceptID>
				            <lido:term><xsl:value-of select="./objektbezeichnung/term"/></lido:term>
				        </lido:objectWorkType>
				    </lido:objectWorkTypeWrap>
				    <lido:classificationWrap>
						<lido:classification lido:type="nominal">
							<lido:term><xsl:value-of select="./objektbezeichnung/term"/></lido:term>
						</lido:classification>
					</lido:classificationWrap>          
		        </lido:objectClassificationWrap>
		        
				<lido:objectIdentificationWrap>
		            <lido:titleWrap>			        	
				        <lido:titleSet lido:type="generated_short" lido:sortorder="1">
				            <lido:appellationValue>
				            	<xsl:value-of select="./objektbezeichnung/term"/>
								<xsl:if test="./datierung"><xsl:text>, </xsl:text><xsl:value-of select="./datierung"/></xsl:if>
							</lido:appellationValue>
				        </lido:titleSet>
				        <lido:titleSet lido:type="given" lido:sortorder="2">
				            <lido:appellationValue><xsl:value-of select="./titel" /></lido:appellationValue>
				        </lido:titleSet>
				        <lido:titleSet lido:type="generated_long" lido:sortorder="3">
      						<lido:appellationValue>
         						<xsl:value-of select="./objektbezeichnung/term"/>
         						<xsl:if test="./orte/term"><xsl:text>, </xsl:text><xsl:value-of select="./orte/term"/></xsl:if>
								<xsl:if test="./datierung"><xsl:text>, </xsl:text><xsl:value-of select="./datierung"/></xsl:if>		
      						</lido:appellationValue>
   						</lido:titleSet>		           
			        </lido:titleWrap>
			        <lido:inscriptionsWrap>
				        <xsl:if test="./vorderseite/darstellung != ''">
				                <lido:inscriptions lido:type="front">
				                	<lido:inscriptionTranscription />
					                	<lido:inscriptionDescription>
					                		<lido:descriptiveNoteValue>
					                			<xsl:value-of select="./vorderseite/darstellung" />
					                		</lido:descriptiveNoteValue>
					                	</lido:inscriptionDescription>
				                </lido:inscriptions>
			             </xsl:if>
			             <xsl:if test="./rueckseite/darstellung != ''">
				                <lido:inscriptions lido:type="back">
					                	<lido:inscriptionDescription>
					                		<lido:descriptiveNoteValue>
				                				<xsl:value-of select="./rueckseite/darstellung" />
											</lido:descriptiveNoteValue>
					                	</lido:inscriptionDescription>
				                </lido:inscriptions>
			             </xsl:if>
					</lido:inscriptionsWrap>		            
			        <lido:repositoryWrap>
			        	<lido:repositorySet lido:type="current">
			                <lido:repositoryName>
			                	<lido:legalBodyID lido:type="URI"><xsl:text>http://ld.zdb-services.de/resource/organisations/DE-MUS-072119</xsl:text></lido:legalBodyID>
			                    <lido:legalBodyName>
			                        <lido:appellationValue><xsl:text>Badisches Landesmuseum</xsl:text></lido:appellationValue>
			                    </lido:legalBodyName>
								<lido:legalBodyWeblink><xsl:text>http://www.landesmuseum.de/</xsl:text></lido:legalBodyWeblink>
			                </lido:repositoryName>
			                <xsl:if test="./inventarnummer">
								<lido:workID lido:type="inventory number"><xsl:value-of select="./inventarnummer" /></lido:workID>
							</xsl:if>
			            </lido:repositorySet>			            
			        </lido:repositoryWrap>
			        <xsl:if test="./kurzbeschreibung">
			            <lido:objectDescriptionWrap>		            	
					            <lido:objectDescriptionSet lido:type="annotation">
					            	<lido:descriptiveNoteValue>
					            		<xsl:value-of select="./kurzbeschreibung"/>
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
		        	<xsl:if test="./persons/person[role='Münzherr']/nachname">
		        		<lido:eventSet>
							<lido:event>
								<lido:eventType>
                					<lido:conceptID lido:type="URI"><xsl:text>http://terminology.lido-schema.org/lido00226</xsl:text></lido:conceptID>
                    				<lido:term xml:lang="en"><xsl:text>Commissioning</xsl:text></lido:term>
                    				<lido:term><xsl:text>Auftrag</xsl:text></lido:term>
                				</lido:eventType>
								<xsl:for-each select="persons/person[role='Münzherr']">
	                            	<lido:eventActor>
										<lido:displayActorInRole><xsl:value-of select="./name"/></lido:displayActorInRole>
										<lido:actorInRole>
											<lido:actor lido:type="personal">
												<lido:nameActorSet>
													<lido:appellationValue><xsl:value-of select="./name" /></lido:appellationValue>
												</lido:nameActorSet>
											</lido:actor>
											<lido:roleActor>
												<lido:conceptID lido:type="URI" />
												<lido:term><xsl:value-of select="./role"/></lido:term>
											</lido:roleActor>	
										</lido:actorInRole>
	                    			</lido:eventActor>
                    			</xsl:for-each>
							</lido:event>
        				</lido:eventSet>
        			</xsl:if>
		        	<xsl:if test="./material/materialvalue">
		        		<lido:eventSet>
            				<lido:event>
                				<lido:eventType>
                					<lido:conceptID lido:type="URI"><xsl:text>http://terminology.lido-schema.org/lido00007</xsl:text></lido:conceptID>
                    				<lido:term xml:lang="en"><xsl:text>Production</xsl:text></lido:term>
                    				<lido:term><xsl:text>Herstellung</xsl:text></lido:term>
                				</lido:eventType>
								<xsl:if test="./persons/person[role='Medailleur']/nachname">
									<lido:eventActor>
										<lido:displayActorInRole><xsl:value-of select="./persons/person/name"/></lido:displayActorInRole>
										<lido:actorInRole>
											<lido:actor lido:type="personal">
												<lido:nameActorSet>
													<lido:appellationValue><xsl:value-of select="./persons/person/nachname"/>, <xsl:value-of select="./persons/person/vorname"/></lido:appellationValue>
												</lido:nameActorSet>
											</lido:actor>
											<lido:roleActor>
												<lido:conceptID lido:type="URI"><xsl:text>http://d-nb.info/gnd/4306105-9</xsl:text></lido:conceptID>
												<lido:term><xsl:value-of select="./persons/person/role"/></lido:term>
											</lido:roleActor>
										</lido:actorInRole>
									</lido:eventActor>
								</xsl:if>
								<xsl:if test="./persons/person[role='Stempelschneider']/nachname">
									<lido:eventActor>
										<lido:displayActorInRole><xsl:value-of select="./persons/person/name"/></lido:displayActorInRole>
										<lido:actorInRole>
											<lido:actor lido:type="personal">
												<lido:nameActorSet>
													<lido:appellationValue><xsl:value-of select="./persons/person/nachname"/>, <xsl:value-of select="./persons/person/vorname"/></lido:appellationValue>
												</lido:nameActorSet>
											</lido:actor>
											<lido:roleActor>
												<lido:conceptID lido:type="URI"><xsl:text>http://d-nb.info/gnd/4398822-2</xsl:text></lido:conceptID>
												<lido:term><xsl:value-of select="./persons/person/role"/></lido:term>
											</lido:roleActor>
										</lido:actorInRole>
									</lido:eventActor>
								</xsl:if>
                    			<xsl:if test="./datierung">
									<lido:eventDate>
										<lido:displayDate><xsl:value-of select="./datierung"/></lido:displayDate>
											<lido:date>
												<lido:earliestDate />
												<lido:latestDate />
											</lido:date>
									</lido:eventDate>
								</xsl:if>
								<xsl:if test="./persons/person/role='Münzherrschaft'">
									<lido:eventPlace>
   									<lido:displayPlace><xsl:value-of select="./persons/person[role='Münzherrschaft']/nachname"/></lido:displayPlace>
   										<lido:place lido:politicalEntity="minting_authority">
   											<lido:placeID lido:type="URI"/>
      										<lido:namePlaceSet>
         										<lido:appellationValue><xsl:value-of select="./persons/person[role='Münzherrschaft']/nachname"/></lido:appellationValue>
      										</lido:namePlaceSet>
   										</lido:place>
									</lido:eventPlace>
								</xsl:if>
								<xsl:if test="./orte/orttyp = 'Münzstätte'">
									<lido:eventPlace>
   									<lido:displayPlace><xsl:value-of select="./orte/term"/></lido:displayPlace>
   										<lido:place lido:politicalEntity="minting_place">
   											<lido:placeID lido:type="URI"><xsl:text>http://d-nb.info/gnd/</xsl:text><xsl:value-of select="./orte/normdata"/></lido:placeID>
      										<lido:namePlaceSet>
         										<lido:appellationValue><xsl:value-of select="./orte/term"/></lido:appellationValue>
      										</lido:namePlaceSet>
   										</lido:place>
									</lido:eventPlace>
								</xsl:if>
								<xsl:if test="./orte/orttyp = 'Herstellungsort'">
									<lido:eventPlace>
   										<lido:displayPlace><xsl:value-of select="./orte/term"/></lido:displayPlace>
   										<lido:place lido:politicalEntity="minting_place">
   											<lido:placeID lido:type="URI"><xsl:text>http://d-nb.info/gnd/</xsl:text><xsl:value-of select="./orte/normdata"/></lido:placeID>
      										<lido:namePlaceSet>
         										<lido:appellationValue><xsl:value-of select="./orte/term"/></lido:appellationValue>
      										</lido:namePlaceSet>
   										</lido:place>
									</lido:eventPlace>
								</xsl:if>
								<lido:eventMaterialsTech>	                            	
			                    	<lido:displayMaterialsTech>
			                    		<xsl:for-each select="./material/materialvalue">
			                    			<xsl:value-of select="."/><xsl:if test="position()!=last()">, </xsl:if>
			                    		</xsl:for-each>
			                    	</lido:displayMaterialsTech>
									<lido:materialsTech>
										<xsl:for-each select="./material/materialvalue">
											<lido:termMaterialsTech lido:type="material">
												<lido:term><xsl:value-of select="."/></lido:term>
											</lido:termMaterialsTech>
										</xsl:for-each>
			                    	</lido:materialsTech>
			                	</lido:eventMaterialsTech>
								<xsl:if test="./technik/technikvalue">
									<lido:eventMaterialsTech>	                            	
			                 	       <lido:displayMaterialsTech>
			                 	       		<xsl:for-each select="./technik/technikvalue">
			                    				<xsl:value-of select="."/><xsl:if test="position()!=last()">, </xsl:if>
			                    			</xsl:for-each>
			                    		</lido:displayMaterialsTech>
											<lido:materialsTech>
												<xsl:for-each select="./technik/technikvalue">
													<lido:termMaterialsTech lido:type="technique">
														<lido:term><xsl:value-of select="."/></lido:term>
													</lido:termMaterialsTech>
												</xsl:for-each>
			                        		</lido:materialsTech>
			                    	</lido:eventMaterialsTech>
		                    	</xsl:if>
							</lido:event>
						</lido:eventSet>
					</xsl:if>
					<xsl:if test="./persons/person[role='Entwerfer']/nachname">
						<lido:eventSet>
							<lido:event>
								<lido:eventType>
                					<lido:conceptID lido:type="URI"><xsl:text>http://id.loc.gov/vocabulary/relators/dsr</xsl:text></lido:conceptID>
                					<lido:conceptID lido:type="URI"><xsl:text>http://d-nb.info/gnd/4149173-7</xsl:text></lido:conceptID>
                    				<lido:term xml:lang="en"><xsl:text>Creation</xsl:text></lido:term>
                    				<lido:term><xsl:text>Entwurf</xsl:text></lido:term>
                				</lido:eventType>
								<xsl:for-each select="persons/person[role='Entwerfer']">
	                            	<lido:eventActor>
										<lido:displayActorInRole><xsl:value-of select="./name"/></lido:displayActorInRole>
										<lido:actorInRole>
											<lido:actor lido:type="personal">
												<lido:nameActorSet>
													<lido:appellationValue><xsl:value-of select="./name" /></lido:appellationValue>
												</lido:nameActorSet>
											</lido:actor>
											<lido:roleActor>
												<lido:conceptID lido:type="URI"><xsl:text>http://terminology.lido-schema.org/lido00012</xsl:text></lido:conceptID>
												<lido:term><xsl:value-of select="./role"/></lido:term>
											</lido:roleActor>	
										</lido:actorInRole>
	                    			</lido:eventActor>
                    			</xsl:for-each>
							</lido:event>
        				</lido:eventSet>
        			</xsl:if>
        			<xsl:if test="./orte[orttyp='Fundort/Herkunft']/term">
        				<lido:eventSet>
							<lido:event>
								<lido:eventType>
         							<lido:conceptID lido:type="URI">http://terminology.lido-schema.org/lido00002</lido:conceptID>
         							<lido:term xml:lang="en">Finding</lido:term>
         							<lido:term>Fund</lido:term>
     							</lido:eventType>
								<lido:eventDescriptionSet>
         							<lido:descriptiveNoteValue><xsl:value-of select="./orte[orttyp='Fundort/Herkunft']/term" /></lido:descriptiveNoteValue>
      							</lido:eventDescriptionSet>
							</lido:event>
        				</lido:eventSet>
        			</xsl:if>        			
		        </lido:eventWrap>
				<lido:objectRelationWrap>
					<lido:subjectWrap>
						<xsl:if test="./schlagwoerter">
							<lido:subjectSet>
							<lido:displaySubject>
								<xsl:for-each select="./schlagwoerter/term">
									<xsl:value-of select="." /><xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
							</lido:displaySubject>
							<lido:subject>
								<xsl:for-each select="./schlagwoerter/term">
									<lido:subjectConcept>
										<lido:conceptID lido:type="URI"/>
										<lido:term><xsl:value-of select="." /></lido:term>
									</lido:subjectConcept>
								</xsl:for-each>
							</lido:subject>
							</lido:subjectSet>
						</xsl:if>
						<xsl:if test="./ikonographie">
							<lido:subjectSet>
								<lido:displaySubject>
									<xsl:for-each select="./ikonographie/term">
										<xsl:value-of select="." /><xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</lido:displaySubject>
								<lido:subject>
									<xsl:for-each select="./ikonographie/term">
										<lido:subjectConcept>
											<lido:conceptID lido:type="URI"><xsl:text>http://d-nb.info/gnd/</xsl:text><xsl:value-of select="./termid" /></lido:conceptID>
											<lido:term><xsl:value-of select="." /></lido:term>
										</lido:subjectConcept>
									</xsl:for-each>
								</lido:subject>
							</lido:subjectSet>
						</xsl:if>
						<xsl:if test="./darstellung">
							<lido:subjectSet>
								<lido:displaySubject>
									<xsl:for-each select="./darstellung/term">
										<xsl:value-of select="." /><xsl:if test="position()!=last()">, </xsl:if>
									</xsl:for-each>
								</lido:displaySubject>
								<lido:subject>
									<xsl:for-each select="./darstellung/term">
										<lido:subjectConcept>
											<lido:conceptID lido:type="URI"><xsl:text>http://d-nb.info/gnd/</xsl:text><xsl:value-of select="../termid" /></lido:conceptID>
											<lido:term><xsl:value-of select="." /></lido:term>
										</lido:subjectConcept>
									</xsl:for-each>
								</lido:subject>
							</lido:subjectSet>
						</xsl:if>
					</lido:subjectWrap>
 					<xsl:if test="./literatur/lit/littitle">
 						<lido:relatedWorksWrap>
 							<xsl:for-each select="./literatur/lit">
								<lido:relatedWorkSet>
									<lido:relatedWork>
										<lido:object>
											<lido:objectNote>
												<xsl:if test="./litauthor !=''"><xsl:value-of select="./litauthor" /><xsl:text>: </xsl:text></xsl:if>
												<xsl:choose>
													<xsl:when test="./littitle !=''"><xsl:value-of select="./littitle" /><xsl:text>, </xsl:text></xsl:when>
													<xsl:otherwise><xsl:value-of select="./litshorttitle" /></xsl:otherwise>
												</xsl:choose>
												<xsl:value-of select="./litplace" /><xsl:text> </xsl:text>
												<xsl:value-of select="./lityear" />
												<xsl:if test="./litpage !=''">
													<xsl:text>, S. </xsl:text><xsl:value-of select="./litpage" />
												</xsl:if>
											</lido:objectNote>
											<lido:objectNote lido:type="type"><xsl:text>Literatur</xsl:text></lido:objectNote>
										</lido:object>
									</lido:relatedWork>
									<lido:relatedWorkRelType>
										<lido:term><xsl:text>Literatur</xsl:text></lido:term>
									</lido:relatedWorkRelType>
								</lido:relatedWorkSet>
							</xsl:for-each>
						</lido:relatedWorksWrap>
					</xsl:if>
				</lido:objectRelationWrap>
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
			                <lido:appellationValue><xsl:text>Badisches Landesmuseum</xsl:text></lido:appellationValue>
			            </lido:legalBodyName>
						<lido:legalBodyWeblink><xsl:text>http://www.landesmuseum.de/</xsl:text></lido:legalBodyWeblink>
			        </lido:recordSource>
                    <lido:recordRights>
						<lido:rightsType>
							<lido:term>Verwertungsrecht</lido:term>
						</lido:rightsType>
					<lido:rightsHolder>
						<lido:legalBodyID lido:type="URI"><xsl:text>http://ld.zdb-services.de/resource/organisations/DE-MUS-072119</xsl:text></lido:legalBodyID>
						<lido:legalBodyName>
							<lido:appellationValue><xsl:text>Badisches Landesmuseum</xsl:text></lido:appellationValue>
						</lido:legalBodyName>
						<lido:legalBodyWeblink><xsl:text>http://www.landesmuseum.de/</xsl:text></lido:legalBodyWeblink>
					</lido:rightsHolder>
					</lido:recordRights>
					<lido:recordInfoSet>
						<lido:recordMetadataDate lido:type="created"><xsl:value-of select="./exportdate"/></lido:recordMetadataDate>
						<lido:recordMetadataDate lido:type="last_modified"><xsl:value-of select="./lastdate"/></lido:recordMetadataDate>
					</lido:recordInfoSet>
		        </lido:recordWrap>
		        <lido:resourceWrap>
	                <lido:resourceSet lido:sortorder="1">                        
			            <lido:resourceID lido:type="local"><xsl:value-of select="./imdasid"/><xsl:text>_media/</xsl:text><xsl:value-of select="./datei1/name"/></lido:resourceID>
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
               									<xsl:when test="./datei1/fotograf">
               										<xsl:value-of select="./datei1/fotograf"/>
               									</xsl:when>
               									<xsl:otherwise>
   													<xsl:text>(c) Badisches Landesmuseum</xsl:text>
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
            						<lido:legalBodyID lido:type="URI"><xsl:text>http://ld.zdb-services.de/resource/organisations/DE-MUS-072119</xsl:text></lido:legalBodyID>
            						<lido:legalBodyName>
               							<lido:appellationValue><xsl:text>(c) Badisches Landesmuseum</xsl:text></lido:appellationValue>
             						</lido:legalBodyName>
             						<lido:legalBodyWeblink>http://www.landesmuseum.de/</lido:legalBodyWeblink>
         						</lido:rightsHolder>
      						</lido:rightsResource>
		             </lido:resourceSet>
					 <lido:resourceSet lido:sortorder="2">                        
			            <lido:resourceID lido:type="local"><xsl:value-of select="./imdasid"/><xsl:text>_media/</xsl:text><xsl:value-of select="./datei2/name"/></lido:resourceID>
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
               								<xsl:when test="./datei2/fotograf">
               									<xsl:value-of select="./datei2/fotograf"/>
               								</xsl:when>
               								<xsl:otherwise>
   												<xsl:text>(c) Badisches Landesmuseum</xsl:text>
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
            					<lido:legalBodyID lido:type="URI"><xsl:text>http://ld.zdb-services.de/resource/organisations/DE-MUS-072119</xsl:text></lido:legalBodyID>
            					<lido:legalBodyName>
               						<lido:appellationValue><xsl:text>(c) Badisches Landesmuseum</xsl:text></lido:appellationValue>
             					</lido:legalBodyName>
             					<lido:legalBodyWeblink>http://www.landesmuseum.de/</lido:legalBodyWeblink>
         					</lido:rightsHolder>
      					</lido:rightsResource>
		             </lido:resourceSet>
	            </lido:resourceWrap>
            </lido:administrativeMetadata>        
        </lido:lido>
    </xsl:template>   
   
</xsl:stylesheet>
