

create or replace fuck_view as

select 
	vt.uid as child, 
	iat_vt.uid as parent
from vocabulary_term vt 
left join term_category_classification tcc on tcc.vocabulary_term_id = vt.id 
left join internal_associated_terms  iat on iat.subject_vocabulary_term_id = vt.id 
left join vocabulary_term iat_vt on iat.object_vocabulary_term_id = iat_vt.id  and iat.association_type_name = 'isInstanceOf' 
;





WITH RECURSIVE t( fuck ) AS (

	select  1 as fuck

	union all

	select fuck + 1 from t where fuck < 10 

	--  this doesn't seem to be used.	
)

	select  fuck from t; 




--  this doesn't seem to be used.	



