
 select
trim(trailing from v.uid) as term,
trim(trailing from v2.uid) as narrower
from contr_vocab_db.vocabulary_term v
left join contr_vocab_db.reference_source r on r.reference_id = v.reference_source_id
left join contr_vocab_db.subject_term s on s.vocabulary_term_name = v.name
left join contr_vocab_db.internal_associated_terms a on a.subject_term_id = s.subject_term_id
-- left join contr_vocab_db.object_term_table o on a.object_term_id = o.object_term_id
left join contr_vocab_db.vocabulary_term v2 on a.object_term_id = v2.id --vocabulary_term_code
where a.association_type_name = 'isInstanceOf'
--and v.vocabulary_term_uid = $1
;
