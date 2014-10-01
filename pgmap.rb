
require 'erb'
require 'pg'


conn = PG::Connection.open(
	:host => "127.0.0.1", 
	:dbname => "vocab",   
	:user => "contr_vocab_db", 
	:password => "contr_vocab_db" )

# we want a map like function


def mapquery( conn, query, args, &code )
	result = conn.exec( query, args )
	ia = []
	result.each do |row|
		# puts "-> #{row['subject']}"
		ia << code.call( row ) 	
	end
	ia
end


j = mapquery( conn, 'select * from _rdf where predicate = $$rdf:type$$ and object = $1 ', ['skos:ConceptScheme']) do |x|
	x['subject']
end 


puts j

