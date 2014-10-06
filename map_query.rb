
# Usage: ruby map_query.rb

# map a function over a query
# take the code, to the data.
# this would be better as a fold, from which we can create a map if we want. 

# actually would be better if it was a fold operation - it's not as clean as a real fold

require 'erb'
require 'pg'


conn = PG::Connection.open(
	:host => "127.0.0.1", 
	:dbname => "vocab",   
	:user => "contr_vocab_db", 
	:password => "contr_vocab_db" 
)



def map_query( conn, query, args, &code )
	xs = []
	conn.exec( query, args ).each do |row|
		# puts "-> #{row['subject']}"
		xs << code.call( row ) 	
	end
	xs
end


def fold_query( conn, query, args, xs, &code )

	conn.exec( query, args ).each do |row|
		# puts "-> #{row['subject']}"
		code.call( row, xs ) 	
	end
	xs
end



# 
# j = map_query( conn, 'select * from _rdf where predicate = $$rdf:type$$ and object = $1 ', ['skos:ConceptScheme']) do |x|
# 	x['subject']
# end 
# 

j = fold_query( conn, 'select * from _rdf where predicate = $$rdf:type$$ and object = $1 ', ['skos:ConceptScheme'], []) do |row, xs|
	xs << row['subject']
end 



puts j

