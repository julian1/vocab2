
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

# psql -U contr_vocab_db -h localhost -d vocab  -c 'select * from contr_vocab_db.internal_associated_terms_table '

# conn = PG::Connection.open(:host => "dbprod.emii.org.au", :dbname => "harvest", :user => "jfca", :password => "fredfred" )
conn = PG::Connection.open(:host => "localhost", :dbname => "vocab", :user => "contr_vocab_db", :password => "a" )

# conn2 = PG::Connection.open(:host => "localhost", :dbname => "vocab", :user => "contr_vocab_db", :password => "a" )

# we really want to create a view.
# conn = PG.connect(:dbname => 'db1')

#



# res = conn.exec( <<-EOS
#   -- concept
#   create temporary view concept as
#   select 
#     trim(trailing from v.vocabulary_term_uid) as about,
#     v.vocabulary_term_name as prefLabel,
#     v.vocabulary_term_definition as definition,
#     r.citation_string as source
#   from contr_vocab_db.vocabulary_term_table v 
#   left join contr_vocab_db.reference_source_table r on r.reference_id = v.reference_source_id 
#   ;
# 
#   select about from concept ; 
# EOS
# )
# 
# res.each { |row|
#     puts row # 
# } 
# 
# abort( 'finish' )

# how should we piece this stuff together...
# pass in connection and term??? 


def func1( conn, x)

  res = conn.exec( <<-EOS
    -- concept

    create temporary view concept as
    select 
      trim(trailing from v.vocabulary_term_uid) as about,
      v.vocabulary_term_name as prefLabel,
      v.vocabulary_term_definition as definition,
      r.citation_string as source
    from contr_vocab_db.vocabulary_term_table v 
    left join contr_vocab_db.reference_source_table r on r.reference_id = v.reference_source_id 
    ;

    select * from concept where preflabel = 'research vessel'; 
  EOS
  )

  res.each { |row|
      puts row # 
      #puts row['vocabulary_term_name']
      puts <<-EOS
      <skos:Concept rdf:about= #{row['about']} >  
        <skos:prefLabel xml:lang="en">#{row['prefLabel']}</skos:prefLabel>
        <skos:definition>#{row['definition']}</skos:definition>
        <dc:source>#{row['source']}</dc:source>
      
  EOS
    } 
end



def func2( conn, x)


# conn.prepare('statement1', 'select $1::Int as result')
# conn.exec_prepared('statement1', [ 123 ] ) .each { |row|
#     puts row # 
# } 
# #

  conn.prepare('statement1', <<-EOS

    -- narrower

    -- create temporary view narrower as
    select
      v.vocabulary_term_name, 
      o.vocabulary_term_name as child
    from contr_vocab_db.vocabulary_term_table v 
    left join contr_vocab_db.reference_source_table r on r.reference_id = v.reference_source_id 
    left join contr_vocab_db.subject_term_table s on s.vocabulary_term_name = v.vocabulary_term_name
    left join contr_vocab_db.internal_associated_terms_table a on a.subject_term_id = s.subject_term_id 
    left join contr_vocab_db.object_term_table o on a.object_term_id = o.object_term_id
    where a.association_type_name = 'isInstanceOf'
  and v.vocabulary_term_name = $1
        ; 
  --  select * from narrower --   
  EOS
  )


  conn.exec_prepared('statement1', [ x ] ) .each { |row|
      puts row # 
  } 
  abort( 'abort')
end


func2( conn, "L'Astrolabe" )

