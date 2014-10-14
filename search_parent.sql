

create or replace view fuck_view as

select 
	vt.uid as child, 
	iat_vt.uid as parent
from vocabulary_term vt 
-- left join term_category_classification tcc on tcc.vocabulary_term_id = vt.id 
left join internal_associated_terms  iat on iat.subject_vocabulary_term_id = vt.id 
left join vocabulary_term iat_vt on iat.object_vocabulary_term_id = iat_vt.id  and iat.association_type_name = 'isInstanceOf' 
;

-- drop table fuck_viewx; 
-- create table fuck_viewx (parent varchar, child varchar) ;
-- insert into fuck_viewx( parent, child) values (('a', 'b' ) ); 

-- *****
-- find everything that exists in the tree above where we are. 
-- then perform a filter task on that for just those nodes that don't have parents. 

-- should the thing be recursive? 

-- IMPORTANT Note, we should 

-- this would be easier to write as a series of joins and if else statements.  to test all the values that are at the root.

-- not sure - it ought to be possible to do the first bit with the function easily.


WITH RECURSIVE t( child, parent ) AS (

	-- with an initial condition. it assumes that there's always something further to go ? 

	-- this is not a terminating condition . it's an initial condition.  
	select v1.child, v1.parent  
		from fuck_view v1 where v1.child = child and v1.parent is not null


	union all

--	SELECT at.old_email, at.new_email
--	FROM audit_trail at
--	JOIN all_emails a
--	ON (at.old_email = a.new_email)


	select fv.child, fv.parent  
		from fuck_view fv join t on (fv.parent = t.child )


	-- but is this actually self-referential here ? 
	-- select child, parent from t where parent is not null
	--  this doesn't seem to be used.	
)

	select  * from t where child = 'http://vocab.aodn.org.au/def/platform/271'; 
	-- select  * from t where child = 'http://vocab.nerc.ac.uk/collection/L06/current/32'; 




--  this doesn't seem to be used.	



