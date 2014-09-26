-- they're all a one-to-one mapping
-- select vocabulary_term_name, v.id,s.subject_term_id  from subject_term s left join vocabulary_term v on s.vocabulary_term_name = v.name;
-- select vocabulary_term_name, v.id,o.object_term_id  from object_term o left join vocabulary_term v on o.vocabulary_term_name = v.name;

update internal_associated_terms ia 
	set subject_vocabulary_term_id = vs.id, 
	object_vocabulary_term_id = vo.id
--select ia.association_type_name,
--		vs.name as vs, vs.id as subject_vocabulary_term_id, 
--		vo.name as vo, vo.id as object_vocabulary_term_id 
--	from internal_associated_terms ia 

	from subject_term s, object_term o, vocabulary_term vs, vocabulary_term vo

	where ia.subject_term_id = s.subject_term_id 
	 and vs.name = s.vocabulary_term_name 
	 and ia.object_term_id = o.object_term_id 
	 and vo.name = o.vocabulary_term_name ;

