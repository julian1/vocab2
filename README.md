vocab2
======

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
  * need to explain how changeset is explicit and managed and versioned on git - in julian1/vocab.
  * Make a view metadata for select fields  self-describing table explicit - so it can be viewed in pgadmin. using the objects from 
     call it _schema_meta or just _meta 
  * Update on dbprod
  * New user for Kim
  * person organisation affiliation is not correct
  * need fields description added against the fields - would like on the db changeset - to make schema versioned in git.

