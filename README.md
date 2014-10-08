vocab2
======

build db

    ./build.sh

run migrations

    cd migration/
    ./run_migrations.sh 

example show rdf 

    ./connect
    select * from _rdf ;

render skos 

	./render.rb  -t AODNParameterVocabulary.erb 
	./render.rb  -t parameterClassificationScheme.erb

