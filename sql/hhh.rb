
# <skos:Concept rdf:about="http://vocab.nerc.ac.uk/collection/L06/current/31/"> 
#   <skos:inScheme rdf:resource="http://environment.data.gov.au/aodn//def/Platform"/>
#   <skos:prefLabel xml:lang="en">Research Vessel</skos:prefLabel>
#   <skos:definition>A platform of any size operating on the surface of the water column in unpredictable locations that is specifically equipped manned and operated for scientific purposes, usually oceanographic research.</skos:definition>
#   <dc:source>L06 SeaVox Platform Categories</dc:source>
#   <dc:publisher>(BODC) NERC Vocabulary Server</dc:publisher>
#   <skos:narrower rdf:resource="http://vocab.aodn.org.au/aodn/def/Platform/Instance/64"/>
#   <skos:narrower rdf:resource="http://vocab.aodn.org.au/aodn/def/Platform/Instance/65"/>
#   <skos:narrower rdf:resource="http://vocab.aodn.org.au/aodn/def/Platform/Instance/71"/>
# </skos:Concept>
# 


require 'pg'

conn = PG::Connection.open(:host => "dbprod.emii.org.au", :dbname => "harvest", :user => "jfca", :password => "fredfred" )

# we really want to create a view.

res = conn.exec( <<-EOS
  -- whoot
  -- select vocabulary_term_name from contr_vocab_db.vocabulary_term_table 

  select -- vocabulary_term_uid,
    v.vocabulary_term_name, 
 -- v.vocabulary_term_definition,
 -- r.reference_id,
 -- r.citation_string,
  a.*

  from contr_vocab_db.vocabulary_term_table v 
  left join contr_vocab_db.reference_source_table r on r.reference_id = v.reference_source_id 


  left join contr_vocab_db.subject_term_table s on s.vocabulary_term_name = v.vocabulary_term_name
  left join contr_vocab_db.internal_associated_terms_table a on a.subject_term_id = s.subject_term_id 

  -- where v.vocabulary_term_name = 'research vessel'

EOS
)

res.each { |row|
    puts row # 
} 

abort( 'abort')

#
# res.each { |row|
#     puts row # 
#     #puts row['vocabulary_term_name']
# 
#     puts <<-EOS
# 
#     <skos:Concept rdf:about= #{row['vocabulary_term_uid']} >  
#       <skos:prefLabel xml:lang="en">#{row['vocabulary_term_name']}</skos:prefLabel>
#       <skos:definition>#{row['vocabulary_term_definition']}</skos:definition>
#       <dc:source>#{row['citation_string']}</dc:source>
#     
# EOS
#   } 
# 



