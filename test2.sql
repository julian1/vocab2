

drop view myview;

create view myview as
select
  -- trim(vt1.uid) as uid,
  vt1.id as vocabulary_term_id,

  case when csc1.id is not null
    then csc1.id
    else csc2.id
  end as classification_scheme_category_id --,

  -- trim( csc1.name) as csc1_name,
  -- trim( csc2.name) as csc2_name
-- join directly
from vocabulary_term vt1
left join term_category_classification tcc1 on tcc1.vocabulary_term_id = vt1.id
left join classification_scheme_category csc1 on tcc1.classification_scheme_category_id = csc1.id
-- join through one level of the iat
left join internal_associated_terms iat on iat.subject_vocabulary_term_id = vt1.id
and iat.association_type_name = 'isInstanceOf'
left join term_category_classification tcc2 on tcc2.vocabulary_term_id = iat.object_vocabulary_term_id
left join classification_scheme_category csc2 on tcc2.classification_scheme_category_id = csc2.id
;


select vt.uid, cs.name

from vocabulary_term vt

join myview mv on mv.vocabulary_term_id = vt.id



join classification_scheme_category csc on csc.id =  mv.classification_scheme_category_id
join classification_scheme cs on cs.id = csc.classification_scheme_id

where vt.uid = 'http://vocab.nerc.ac.uk/collection/L06/current/32';




-- ok, we actually don't want the names - we want the internal id's so we can join more easily.
-- ok, now we have to use id's

-- select * from classification_scheme_category_from_term where uid = 'http://vocab.nerc.ac.uk/collection/L06/current/32';
--select * from classification_scheme_category_from_term where uid = 'http://vocab.nerc.ac.uk/collection/L06/current/32';
--join classification_scheme cs on cs.id = myview.classification_scheme_category_id


