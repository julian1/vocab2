#
# Ruby example to dump xml coded skos Concept from contr_vocab_db
# 
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


# 
# Probably all of the sql to extract rdf triples should be hooked together with 'union all'. 
# 
# It really should be easy to implement sparql ontop of the relational db, - 
#  once the object,predicate,subject triples are hooked together  
#
# Who/what implements the sparql interface in sissvoc. 
#


# prefLabel is wrong in this...

require 'pg'


def make_prepared_statements(conn)

  # return all tuples with useful fields
  conn.prepare('all_terms', <<-EOS
    select 
    vocabulary_term_name, 
    vocabulary_term_code, 
    trim(trailing from v.vocabulary_term_uid) as vocabulary_term_uid
    from contr_vocab_db.vocabulary_term_table v
  EOS
  )

  # change name to label
  # lookup term and return rdf resource
  conn.prepare('term', <<-EOS
    -- select v.vocabulary_term_uid
    select trim(trailing from v.vocabulary_term_uid) as term
    from contr_vocab_db.vocabulary_term_table v
    where v.vocabulary_term_name = $1
  EOS
  )

  # concept prefLabel definition
  conn.prepare('prefLabel', <<-EOS
    select v.vocabulary_term_name as preflabel
    from contr_vocab_db.vocabulary_term_table v
    where v.vocabulary_term_uid = $1
  EOS
  )

  # concept definition
  conn.prepare('definition', <<-EOS
    select v.vocabulary_term_definition as definition
    from contr_vocab_db.vocabulary_term_table v
    where v.vocabulary_term_uid = $1
  EOS
  )

  # concept citation/source
  conn.prepare('source', <<-EOS
    -- needs more case/ handling
    select
    r.citation_string as source
    from contr_vocab_db.vocabulary_term_table v
    left join contr_vocab_db.reference_source_table r on r.reference_id = v.reference_source_id
    where v.vocabulary_term_uid = $1
  EOS
  )

  # concept narrower
  conn.prepare('narrower', <<-EOS
    -- narrower
    select 
    trim(trailing from v.vocabulary_term_uid) as term,
    trim(trailing from v2.vocabulary_term_uid) as narrower

    from contr_vocab_db.vocabulary_term_table v
    left join contr_vocab_db.reference_source_table r on r.reference_id = v.reference_source_id
    left join contr_vocab_db.subject_term_table s on s.vocabulary_term_name = v.vocabulary_term_name
    left join contr_vocab_db.internal_associated_terms_table a on a.subject_term_id = s.subject_term_id
    -- left join contr_vocab_db.object_term_table o on a.object_term_id = o.object_term_id
    left join contr_vocab_db.vocabulary_term_table v2 on a.object_term_id = v2.vocabulary_term_code

    where a.association_type_name = 'isInstanceOf'
    and v.vocabulary_term_uid = $1
  EOS
  )
end


def test_dump_concepts(conn)
  puts "dumping all_terms"
  conn.exec_prepared('all_terms').each { |row|
    puts row
  }
end


def test_dump_concept_fields(conn, concept)
  puts "concept #{ concept }"
  puts "source #{ conn.exec_prepared('source', [concept])[0] } "
  puts "about #{ conn.exec_prepared('about', [concept])[0] } "
  puts "narrower"
  conn.exec_prepared('narrower', [concept]).each { |row|
    puts row
  }
end


def encode_skos_concept_as_xml(conn, concept)

  ## all this stuff should probably be unionized, to be able to be 
  ## queries by sparql?
  ## but with a view 

  definition = conn.exec_prepared('definition', [concept])[0]['definition']
  prefLabel = conn.exec_prepared('prefLabel', [concept])[0]['preflabel']
  source = conn.exec_prepared('source', [concept])[0]['source']

  <<-EOS
    <skos:Concept rdf:about="#{ concept }">
      <skos:prefLabel xml:lang="en">#{ prefLabel }</skos:prefLabel>
      <skos:definition>#{ definition }</skos:definition>
      <dc:source>#{ source }</dc:source> #{ s = ""
        conn.exec_prepared('narrower', [concept]).each { |row|
          s += <<-EOS
      <skos:narrower rdf:resource="#{row['narrower']}"/>
          EOS
        }
        s }
    </skos:Concept>

  EOS
end


# create connection
conn = PG::Connection.open(:host => "localhost", :dbname => "vocab", :user => "contr_vocab_db", :password => "a" )
make_prepared_statements(conn)


conn.exec_prepared('all_terms').each { |row|
    term = row['vocabulary_term_uid']
    puts encode_skos_concept_as_xml(conn, term)
}


# 
# # lookup concept by label 
# rdf_term = conn.exec_prepared('term', ["L'Astrolabe"])[0]['term']
# 
# # dump skos concept for resource
# puts encode_skos_concept_as_xml(conn, rdf_term)
# 

