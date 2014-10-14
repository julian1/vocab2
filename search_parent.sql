

create or replace view fuck_view as

select 
	vt.uid as child, 
	iat_vt.uid as parent
from vocabulary_term vt 
left join term_category_classification tcc on tcc.vocabulary_term_id = vt.id 
left join internal_associated_terms  iat on iat.subject_vocabulary_term_id = vt.id 
left join vocabulary_term iat_vt on iat.object_vocabulary_term_id = iat_vt.id  and iat.association_type_name = 'isInstanceOf' 
;

-- drop table fuck_viewx; 
-- create table fuck_viewx (parent varchar, child varchar) ;
-- insert into fuck_viewx( parent, child) values (('a', 'b' ) ); 



WITH RECURSIVE t( child, parent ) AS (

	-- with an initial condition. it assumes that there's always something further to go ? 

	-- terminating condition . except it's not ?  it's the first condition.  
	select  child, child from fuck_view v where v.child = child

	union all

	-- but is this actually self-referential here ? 
	select v2.child, v2.parent 
		from fuck_view v1 left join fuck_view v2 on v2.parent = v1.child  where v2.parent is not null

	--  this doesn't seem to be used.	
)

	-- select  * from t where child = 'http://vocab.aodn.org.au/def/platform/271'; 
	select  * from t where child = 'http://vocab.nerc.ac.uk/collection/L06/current/32'; 




--  this doesn't seem to be used.	



