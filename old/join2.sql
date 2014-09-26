

select ia.association_type_name,
		vs.name as vs, vs.id as subject_vocabulary_term_id,   ia.subject_vocabulary_term_id as x ,
		vo.name as vo, vo.id as object_vocabulary_term_id,  ia.object_vocabulary_term_id as y
	from internal_associated_terms ia 
	left join subject_term s on ia.subject_term_id = s.subject_term_id 
	left join vocabulary_term vs on vs.name = s.vocabulary_term_name 

	left join object_term o on ia.object_term_id = o.object_term_id 
	left join vocabulary_term vo on vo.name = o.vocabulary_term_name ;

