

WITH RECURSIVE t(n) AS (
    VALUES (1)
  UNION ALL
    SELECT n+1 
	FROM t WHERE n < 100
)
SELECT sum(n) FROM t;



select 
	trim( vt.uid) as uid, 
	trim( iat_vt.uid) as iat_vt 

--  this doesn't seem to be used.	
from vocabulary_term vt 
left join term_category_classification tcc on tcc.vocabulary_term_id = vt.id 
left join internal_associated_terms  iat on iat.subject_vocabulary_term_id = vt.id 
left join vocabulary_term iat_vt on iat.object_vocabulary_term_id = iat_vt.id  
and iat.association_type_name = 'isInstanceOf' 

;



