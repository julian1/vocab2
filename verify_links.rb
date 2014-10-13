
 require 'nokogiri'
  
	# decode xml 
xml = Nokogiri::XML(File.open( 'skos_files12/AODNPlatformVocabulary.xml' ))

# puts xml
# xml.xpath('/rdf:RDF/skos:Concept/skos:narrower').each do |path|
# now we want to pull out the resource attribute
# needs to be topConcept as well.
# we need to index the uris not the concepts.

concepts = { }

xml.xpath('/rdf:RDF/skos:Concept').each do |path|
	puts "path --> #{path}"


	uri = path.attr('rdf:about')

	puts "uri --> #{uri}" 
	

# 	path.xpath( '/skos:Concept[@rdf:about]').each do |uri|
# 		puts "uri #{uri}"
# 	end

	#.attr('rdf:about') 
# 	uri = path.xpath('/skos:Concept[@rdf:about]')[0].attr('rdf:about') 


# 	puts "uri -> #{uri}"
# 	concepts[uri] = true
end


puts concepts

# 
# 	 xml.xpath('/rdf:RDF/skos:Concept/skos:narrower[@rdf:resource]').each do |path|
# 		puts "path is #{path}"
# 		resource_path = path.attr('rdf:resource')
# 		puts "resource_path #{resource_path}" 
# #		test = xml.path( resource_path )
# #		puts "test"
# 	end
#
