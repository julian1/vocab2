
# Example,
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

conn = PG::Connection.open(:host => "localhost", :dbname => "vocab", :user => "contr_vocab_db", :password => "a" )


def prepare_statements( conn)

  conn.prepare('all_terms', <<-EOS
    select v.vocabulary_term_name
    ,v.vocabulary_term_uid
    from contr_vocab_db.vocabulary_term_table v
  EOS
  )


#   conn.prepare('term', <<-EOS
#     select *
#     from contr_vocab_db.vocabulary_term_table v
#     where v.vocabulary_term_name = $1
#   EOS
#   )


  conn.prepare('definition', <<-EOS
    select
    v.vocabulary_term_definition as definition
    from contr_vocab_db.vocabulary_term_table v
    where v.vocabulary_term_name = $1
  EOS
  )

  conn.prepare('source', <<-EOS
    select
    r.citation_string as source
    from contr_vocab_db.vocabulary_term_table v
    left join contr_vocab_db.reference_source_table r on r.reference_id = v.reference_source_id
    where v.vocabulary_term_name = $1
  EOS
  )

  conn.prepare('about', <<-EOS
    select
    trim(trailing from v.vocabulary_term_uid) as about
    from contr_vocab_db.vocabulary_term_table v
    where v.vocabulary_term_name = $1
  EOS
  )

  conn.prepare('narrower', <<-EOS
    -- narrower
    select
    v.vocabulary_term_uid,
    trim( trailing from v2.vocabulary_term_uid) as narrower

    from contr_vocab_db.vocabulary_term_table v
    left join contr_vocab_db.reference_source_table r on r.reference_id = v.reference_source_id
    left join contr_vocab_db.subject_term_table s on s.vocabulary_term_name = v.vocabulary_term_name
    left join contr_vocab_db.internal_associated_terms_table a on a.subject_term_id = s.subject_term_id
    -- left join contr_vocab_db.object_term_table o on a.object_term_id = o.object_term_id
    left join contr_vocab_db.vocabulary_term_table v2 on a.object_term_id = v2.vocabulary_term_code

    where a.association_type_name = 'isInstanceOf'
    and v.vocabulary_term_name = $1
  EOS
  )

end

prepare_statements( conn)


def dump_all_terms(conn)
  puts "dumping all_terms" 
  conn.exec_prepared('all_terms').each { |row| 
    puts row
  }
end


def dump_fields(conn, term)
  puts "definition #{ conn.exec_prepared('definition', [term])[0] } "  
  puts "source #{ conn.exec_prepared('source', [term])[0] } "  
  puts "about #{ conn.exec_prepared('about', [term])[0] } "  
  puts "narrower" 
  conn.exec_prepared('narrower', [term]).each { |row| 
    puts row
  } 
end


def dump_skos(conn, term)
  puts "dumping skos"
  ## the narrower resource isn't correct. It should be a uri. 
  puts <<-EOS
    <skos:Concept rdf:about="#{ conn.exec_prepared('about', [term])[0]['about'] }">
      <skos:prefLabel xml:lang="en">#{term}</skos:prefLabel>
      <skos:definition>#{ conn.exec_prepared('definition', [term])[0]['definition']}</skos:definition>
      <dc:source>#{ conn.exec_prepared('source', [term])[0]['source'] }</dc:source>

      #{ s = ""
        conn.exec_prepared('narrower', [term]).each { |row|
          s += <<-EOS
      <skos:narrower rdf:resource="#{row['narrower']}"/>
          EOS
        }
        s }
    </skos:Concept>
  EOS
end


# dump_all_terms( conn)
term = "L'Astrolabe"

# dump_fields(conn, term)

dump_skos( conn, term)



 
