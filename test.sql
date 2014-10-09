
select


	vt.uid as subject,
	'skos:broader' as predicate,
	csc.name as object,
	csc2.name as parent_object

from vocabulary_term vt
left join term_category_classification tcc on tcc.vocabulary_term_id = vt.id
left join classification_scheme_category csc on tcc.classification_scheme_category_id = csc.id



left join classification_scheme_association csa on csa.classification_scheme_category_id = csc.id
left join classification_scheme_category csc2 on csa.parent_classification_scheme_category_id = csc2.id
