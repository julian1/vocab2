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

render skos 

    ./render.rb -t AODNParameterVocabulary.erb 
    ./render.rb -t parameterClassificationScheme.erb

