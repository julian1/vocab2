
 select
v.id,
trim(trailing from v.uid) as term, v.name,
trim(trailing from v2.uid) as narrower, v2.name
from vocabulary_term v
-- left join contr_vocab_db.reference_source r on r.id = v.reference_source_id
left join subject_term s on s.vocabulary_term_name = v.name
left join internal_associated_terms a on a.subject_term_id = s.subject_term_id
-- left join contr_vocab_db.object_term_table o on a.object_term_id = o.object_term_id
left join vocabulary_term v2 on a.object_term_id = v2.id --vocabulary_term_code
where a.association_type_name = 'isInstanceOf'

order by term,v.name,narrower,v2.name

--and v.vocabulary_term_uid = $1
;


a.subject_term_id -> subject_term.id 

