#!/usr/bin/ruby

require 'optparse'
require 'nokogiri'
  
	# decode root 
#root = Nokogiri::XML(File.open( 'skos_files12/platformClassificationScheme.xml' ))

# puts root
# root.xpath('/rdf:RDF/skos:Concept/skos:narrower').each do |path|
# now we want to pull out the resource attribute
# needs to be topConcept as well.
# we need to index the uris not the concepts.

def check_stuff( root)

	concepts = { }

	root.xpath('/rdf:RDF/skos:Concept').each do |path|
	#	puts "path --> #{path}"
		uri = path.attr('rdf:about')
	#	puts "uri --> #{uri}" 
		concepts[uri] = true	
	end


	root.xpath('/rdf:RDF/skos:Concept').each do |concept|

		concept_uri = concept.attr('rdf:about')
		puts "concept uri #{ concept_uri }"

		concept.xpath('./skos:narrower').each  do |narrower|
			# puts "  narrower #{ narrower }" 
			narrower_uri = narrower.attr('rdf:resource') 
			puts "  narrower resource uri #{ narrower_uri }  #{ concepts[narrower_uri]  ? "found" : "*not found" }"
		end
		
		concept.xpath('./skos:broader').each  do |broader|
			# puts "  broader #{ broader }" 
			broader_uri = broader.attr('rdf:resource') 
			puts "  broader resource uri #{ broader_uri }  #{ concepts[broader_uri]  ? "found" : "*not found" }"
		end
	end
end

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"
  opts.on('-f', '--filename NAME', 'filename') { |v| options[:filename] = v }
end.parse!

if options[:filename]
	root = Nokogiri::XML(File.open( options[:filename]  ))
	check_stuff(root)
else
  puts 'no file specified!'
end




# 	# puts "resource #{resource}"
# 	if concepts[resource].nil?
# 		puts "narrower resource #{resource} not found!"
# 	end

# 
# xml.xpath('/rdf:RDF/skos:Concept/skos:narrower').each do |narrower|
# 	resource = narrower.attr('rdf:resource')
# 	# puts "resource #{resource}"
# 	if concepts[resource].nil?
# 		puts "narrower resource #{resource} not found!"
# 	end
# end
# 
# xml.xpath('/rdf:RDF/skos:Concept/skos:broader').each do |broader|
# 	resource = broader.attr('rdf:resource')
# 	# puts "resource #{resource}"
# 	if concepts[resource].nil?
# 		puts "broader resource #{resource} not found!"
# 	end
# end
# 


# 
# 	 xml.xpath('/rdf:RDF/skos:Concept/skos:narrower[@rdf:resource]').each do |path|
# 		puts "path is #{path}"
# 		resource_path = path.attr('rdf:resource')
# 		puts "resource_path #{resource_path}" 
# #		test = xml.path( resource_path )
# #		puts "test"
# 	end
#
