
-- all this stuff has to be done in terms of broader

-- ok, we still actually need two different projections to create the two assertions  
-- and some things won't have them ...

drop view mynarrower; 
drop view mybroader; 

create view mybroader as
select

	vt.uid as subject,
	'skos:broader' as predicate,
	t2_csc.name as object

	from vocabulary_term vt
	-- get second-tier category
	join term_category_classification tcc on tcc.vocabulary_term_id = vt.id
	join classification_scheme_category t2_csc on tcc.classification_scheme_category_id = t2_csc.id
	union all select 

	vt.uid as subject,
	'skos:broader' as predicate,
	t1_csc.name as object

	from vocabulary_term vt
	-- get second-tier category
	join term_category_classification tcc on tcc.vocabulary_term_id = vt.id
	join classification_scheme_category t2_csc on tcc.classification_scheme_category_id = t2_csc.id
	-- get first-tier category
	join classification_scheme_association csa on csa.classification_scheme_category_id = t2_csc.id
	join classification_scheme_category t1_csc on csa.parent_classification_scheme_category_id = t1_csc.id


	order by subject
;


create view mynarrower as
 select 
	b.object as subject,
	'skos:narrower'::varchar as predicate,
	b.subject as object 
	from mybroader b order by subject;

