vocab2
======

build db

    ./build.sh

run migrations

    cd migration/
    ./run_migrations.sh 

Sql query examples for rdf view, 

    ./connect.sh
    select * from _rdf ;
    select * from _rdf where predicate = 'skos:inScheme' order by subject;
    select * from _rdf where predicate = 'rdf:type' order by object;

render skos 

	./render.rb  -t AODNParameterVocabulary.erb 
	./render.rb  -t parameterClassificationScheme.erb

