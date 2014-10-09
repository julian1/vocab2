
select


	vt.uid as subject,
	'skos:broader' as predicate,
	csc.name as object,
	csc2.name as parent_object

from vocabulary_term vt
-- get second-tier category
join term_category_classification tcc on tcc.vocabulary_term_id = vt.id
join classification_scheme_category csc on tcc.classification_scheme_category_id = csc.id
-- get first-tier category
join classification_scheme_association csa on csa.classification_scheme_category_id = csc.id
join classification_scheme_category csc2 on csa.parent_classification_scheme_category_id = csc2.id
