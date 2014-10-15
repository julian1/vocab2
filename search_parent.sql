

create or replace view helper_view as

select 
	vt.uid as child, 
	iat_vt.uid as parent
from vocabulary_term vt 
-- left join term_category_classification tcc on tcc.vocabulary_term_id = vt.id 
left join internal_associated_terms  iat on iat.subject_vocabulary_term_id = vt.id 
left join vocabulary_term iat_vt on iat.object_vocabulary_term_id = iat_vt.id  and iat.association_type_name = 'isInstanceOf' 
;


-- Strategy is to return all child, parent relationships via the recursion .
-- then filter for where there's no parent and the start leaf is matched.

-- note that it may return multiple roots,

-- see example here, http://practiceovertheory.com/blog/2013/07/12/recursive-query-is-recursive/
-- it's complicated because we want to maintain the starting position

-- ok in fact we want this to be another view
create or replace view myview2
as 
WITH RECURSIVE t( start, child, parent ) AS (
	-- intitial state - find initial child,parent tuple and record with start leaf
	select h.child, h.child, h.parent 
		from helper_view h 
	union all
	-- recurse - trace new child, parent tuples and record against leaf
	select t.child, h.child, h.parent  
		from helper_view h 
		join t on (h.child = t.parent )
)

	select  start, child from t
	-- from t where start = 'http://vocab.aodn.org.au/def/platform/271' -- 'http://vocab.nerc.ac.uk/collection/L06/current/32' -- 'http://vocab.aodn.org.au/def/platform/271' -- and parent is not null  
	where parent is null
;





--	 select  * from t where child = 'http://vocab.nerc.ac.uk/collection/L06/current/32'; 
-- maybe we don't specify - the root - and this thing just iterates everything. 


	-- but is this actually self-referential here ? 
	-- select child, parent from t where parent is not null
	--  this doesn't seem to be used.	

		-- from helper_view fv join t on (fv.parent = t.child  )
		-- this won't actually return anything if there's no parent ... but it doesn't mean we've found the root 
		-- from helper_view fv join t on (fv.child = t.parent )


--	SELECT at.old_email, at.new_email
--	FROM audit_trail at  -- table
--	JOIN all_emails a	-- the recursion
--	ON (at.old_email = a.new_email)


	-- we s


-- drop table helper_viewx; 
-- create table helper_viewx (parent varchar, child varchar) ;
-- insert into helper_viewx( parent, child) values (('a', 'b' ) ); 

-- *****
-- find everything that exists in the tree above where we are. 
-- then perform a filter task on that for just those nodes that don't have parents. 

-- should the thing be recursive? 

-- IMPORTANT Note, we should 

-- this would be easier to write as a series of joins and if else statements.  to test all the values that are at the root.

-- not sure - it ought to be possible to do the first bit with the function easily.

	-- with an initial condition. it assumes that there's always something further to go ? 

	-- this is not a terminating condition . it's an initial condition.  
	-- just add the intial condition - which is needed if we call this on a top node 



--	 select  * from t where child = 'http://vocab.nerc.ac.uk/collection/L06/current/32'; 




--  this doesn't seem to be used.	



