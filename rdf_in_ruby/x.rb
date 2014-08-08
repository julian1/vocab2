
#
# sudo gem install rdf
# sudo gem install linkeddata
#

# http://ruby-rdf.github.io/linkeddata/
# http://ruby-rdf.github.io/rdf/


#require 'rdf/ntriples'
# require 'linkeddata'

require 'rdf/turtle'
# 

RDF::Reader.open("http://ruby-rdf.github.com/rdf-turtle/etc/doap.ttl") do |reader|
  reader.each_statement do |statement|
    puts statement.inspect
  end
end

abort('finished')

require 'rdf'
require 'linkeddata'

graph = RDF::Graph.load("http://dbpedia.org/resource/Elvis_Presley")

puts graph.size

query = RDF::Query.new({
  :person => {
    RDF::URI("http://dbpedia.org/ontology/birthDate") => :birthDate,
    RDF::URI("http://dbpedia.org/ontology/deathDate") => :deathDate
  }
})

results = query.execute(graph)

query.execute(graph).each {|i| puts i[:person] + " -- born: " + i[:birthDate].to_s }

# results.each { |elt|
# 	puts elt[:birthDate].to_s
# }
# 

