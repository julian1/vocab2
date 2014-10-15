

drop view myview; 

create view myview as  
select 
	trim(vt1.uid) as uid, 
	trim( csc1.name) as csc1_name,
	trim( csc2.name) as csc2_name
-- join directly
from vocabulary_term vt1 
left join term_category_classification tcc1 on tcc1.vocabulary_term_id = vt1.id
left join classification_scheme_category csc1 on tcc1.classification_scheme_category_id = csc1.id
-- join through the iat
left join internal_associated_terms iat on iat.subject_vocabulary_term_id = vt1.id
left join term_category_classification tcc2 on tcc2.vocabulary_term_id = iat.object_vocabulary_term_id
left join classification_scheme_category csc2 on tcc2.classification_scheme_category_id = csc2.id
; 

-- select * from myview where uid = 'http://vocab.nerc.ac.uk/collection/L06/current/32'; 
select * from myview where uid = 'http://vocab.aodn.org.au/def/platform/271';
