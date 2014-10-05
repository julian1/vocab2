vocab2
======

# build db
./build.sh

# run migrations
cd migration/
./run_migrations.sh 

# show rdf 
./connect
select * from _rdf ;

# render skos 
ruby render.rb

