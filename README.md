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
  * created migration changeset.
  * rename tables and fields, primary and foreign keys
  * integer primary keys on all tables - except linking tables that are not referenced
  * sequenced, and set to max
  * person and organisation combined when had both
  * subject/object tables removed

  * single rdf view
  * view over all resources


Issues/ todo
  * Need to update on dbprod
  * person organisation affiliation is not correct
  * need fields description added against the fields
  * Make a view for select fields  self-describing table explicit - so it can be viewed in pgadmin.
  * Make user for Kim

