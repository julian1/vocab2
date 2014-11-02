vocab2
======

stored-procs
  - Goals
    - what is purpose - allow Seb to make changes - essentially CRUD actions
    - preserve relational integrity - ( especially the join tables )
    - presenting a logical view of the data - eg. resolve foreign key references in favor of a more useful field.
    - Avoid spending too much time/complxity. 

  - What have done - a set of views that denormalize the state to be human. that kind of surfices for read sps. 

  - difficulty of a simple update stored proc. 
      taking case of updating a table record, possible to organize sp in terms of a { table, id, fields }
      - advantages - capture the changes as a stream of events - Use ES, CQRS patterns
        - but json engine would be more flexible
      - but lose typing - eg. date fields handled as strings horrible.
    - create and delete sp's would be rigid and many of them 20 tables x create,delete,update = 60 stored procs
      majority are wrappers.  for how much value?
  - ORM - will can manage CRUS
    - grails - can annotate the domain objects to be support REST
    - Seb's scripts to perform can 
        - but how does it handle the various many-to-many join tables
    - can export domain model as stand-alone without the other grails cruft.

  - 

  - half and half - create denormalizing views . and to modify use  


TODO
  * change uid to external uid in external terms association
  * map affiliation into responsible party
  * create dummy record for organisation 52
  * clarify topconcept - Simon Piggott picker
  * tighten the metadata to show 'contr_vocab_db' schema and not everything

BUILDING

checkout

    git clone https://github.com/julian1/vocab2

build db

    ./build.sh

run migrations

    cd migration/
    ./run_migrations.sh

sql query examples for rdf view,

    ./connect.sh
    select * from _rdf ;
    select * from _rdf where predicate = 'skos:inScheme' order by subject;
    select * from _rdf where predicate = 'rdf:type' order by object;
    select object from _rdf where predicate = 'skos:inScheme' and subject = 'http://vocab.aodn.org.au/def/parameter/383';

render skos

    ./render.rb -t AODNParameterVocabulary.erb
    ./render.rb -t parameterClassificationScheme.erb

render tree

    ./render.rb -t templates/tree.erb


Summary of changes.
  * created migration changeset - that transforms the schema - versioned on github.
  * rename tables and fields, primary and foreign keys
  * integer primary keys on all tables - except linking tables that are not referenced
  * sequenced, and set to max
  * person and organisation combined when had both
  * subject/object tables removed
  * single rdf view
  * view over all resources

Issues/ todo
  * (done) need to explain how changeset is explicit and managed and versioned on git - in julian1/vocab.
  * (done) Make a view metadata for select fields  self-describing table explicit - so it can be viewed in pgadmin. using the objects from
     call it _schema_meta or just _meta
  * (done) Update on dbprod
  * (done) New user for Kim
  * person organisation affiliation is not correct
  * need fields description added against the fields - would like on the db changeset - to make schema versioned in git.

