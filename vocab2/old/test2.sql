
-- view should be called _term_classification_scheme_category   ? 

-- and then the second one should be called _term_classification_scheme ? 

create or replace function f( vid integer ) 
returns table ( x integer )
as $$ 
begin 
return query 
  select id from vocabulary_term ; 
end 
$$ language plpgsql;

-- we don't use functions because the projection might return multiple values. it's not one to one 

drop view _term_classification_scheme_category;

create view _term_classification_scheme_category as
  select
    vt1.id as vocabulary_term_id,
    case when csc1.id is not null
      then csc1.id
      else csc2.id
    end as classification_scheme_category_id --,
  -- join directly through tcc
  from vocabulary_term vt1
  left join term_category_classification tcc1 on tcc1.vocabulary_term_id = vt1.id
  left join classification_scheme_category csc1 on tcc1.classification_scheme_category_id = csc1.id
  -- join through tcc and one level of the iat
  left join internal_associated_terms iat on iat.subject_vocabulary_term_id = vt1.id
  and iat.association_type_name = 'isInstanceOf'
  left join term_category_classification tcc2 on tcc2.vocabulary_term_id = iat.object_vocabulary_term_id
  left join classification_scheme_category csc2 on tcc2.classification_scheme_category_id = csc2.id
;


create view _term_classification_scheme as
  select 
    mv.vocabulary_term_id as vocabulary_term_id, 
    csc.classification_scheme_id as classification_scheme_id
  from _term_classification_scheme_category mv 
  join classification_scheme_category csc on csc.id =  mv.classification_scheme_category_id
  join classification_scheme cs on cs.id = csc.classification_scheme_id
;


create view _get_term_classification_scheme as
select 
  trim(vt.uid) as uid,
  trim( cs.name) as classification_scheme_name  
from _term_classification_scheme  tcs
join vocabulary_term vt on vt.id = tcs.vocabulary_term_id 
join classification_scheme cs on cs.id = tcs.classification_scheme_id; 


-- select * from _get_term_classification_scheme where uid = 'http://vocab.nerc.ac.uk/collection/L06/current/32'
select * from _get_term_classification_scheme where uid = 'http://vocab.aodn.org.au/def/platform/271'


-- 'http://vocab.aodn.org.au/def/platform/271'


 --  where vt.uid = 'http://vocab.nerc.ac.uk/collection/L06/current/32'

-- on mv.vocabulary_term_id = vt.id


-- ok, we actually don't want the names - we want the internal id's so we can join more easily.
-- ok, now we have to use id's

-- select * from classification_scheme_category_from_term where uid = 'http://vocab.nerc.ac.uk/collection/L06/current/32';
--select * from classification_scheme_category_from_term where uid = 'http://vocab.nerc.ac.uk/collection/L06/current/32';
--join classification_scheme cs on cs.id = myview.classification_scheme_category_id


