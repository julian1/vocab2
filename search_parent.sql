

create or replace view fuck_view as

select 
	vt.uid as child, 
	iat_vt.uid as parent
from vocabulary_term vt 
left join term_category_classification tcc on tcc.vocabulary_term_id = vt.id 
left join internal_associated_terms  iat on iat.subject_vocabulary_term_id = vt.id 
left join vocabulary_term iat_vt on iat.object_vocabulary_term_id = iat_vt.id  and iat.association_type_name = 'isInstanceOf' 
;





WITH RECURSIVE t( child, parent ) AS (

	select  v.child, v.parent from fuck_view v where v.child = child

	union all

	select child, parent from t where t.parent = child 

	--  this doesn't seem to be used.	
)

	select  parent from t where child = 'http://vocab.aodn.org.au/def/platform/271'; 




--  this doesn't seem to be used.	



