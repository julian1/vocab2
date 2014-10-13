
 require 'nokogiri'
  
	# decode xml 
    xml = Nokogiri::XML(File.open( 'skos_files12/AODNPlatformVocabulary.xml' ))

#	puts xml

    # extract geoserver objects
#    xml.at_xpath('/rdf:RDF/skos:Concept/').each do |row|
#    xml.at_xpath('/rdf:Rdf//').each do |row|
#     xml.at_xpath('//skos:Concept/').each do |row|
# 		puts row	
# 	end
# 
#	 puts xml.xpath('/rdf:RDF')   # works


	 xml.xpath('/rdf:RDF/skos:Concept/skos:narrower[@rdf:resource]').each do |path|


#	 xml.xpath('/rdf:RDF/skos:Concept/skos:narrower').each do |path|

		puts "path is #{path}"
		# now we want to pull out the resource attribute

	#	path elems[0].attr('messageId')

	end
