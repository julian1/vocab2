
-- join from term -> term_category_classification -> classification_scheme
-- doesn't have

-- this is a pretty useful general view. 
-- question is do we need to look through second tier.
-- no because there are no values in the 

drop view myplatform ; 

create view myplatform as

select 
	trim( vt.uid) as uid, 
--	trim( vt2.uid) as uid_parent,
	trim( cs.name) as cs_name, 
	trim( vr.uid) as vr_uid, 
	trim( iat_vt.uid) as iat_vt 

--  this doesn't seem to be used.	
from vocabulary_term vt 
left join term_category_classification tcc on tcc.vocabulary_term_id = vt.id 
--left join classification_scheme_association csa on tcc.classification_scheme_category_id = csa.classification_scheme_category_id 
--left join term_category_classification tcc2 on tcc2.classification_scheme_category_id  = csa.parent_classification_scheme_category_id 
--left join vocabulary_term vt2 on vt2.id = tcc2.vocabulary_term_id 

left join classification_scheme cs on tcc.classification_scheme_id = cs.id

left join vocabulary_register vr on vt.vocabulary_register_id = vr.id 

left join internal_associated_terms  iat on iat.subject_vocabulary_term_id = vt.id 
left join vocabulary_term iat_vt on iat.object_vocabulary_term_id = iat_vt.id  and iat.association_type_name = 'isInstanceOf' 

;




