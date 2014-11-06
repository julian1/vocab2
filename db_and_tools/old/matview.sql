
create materialized view _rdf_m as select * from _rdf;
create index on _rdf_m( object ); 
create index on _rdf_m( subject ); 
create index on _rdf_m( predicate ); 


