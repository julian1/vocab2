	select c2.name, c2.label, 'narrower', c.name, c.label --, a.*  
	from classification_scheme_association a 
	join classification_scheme_category c on a.classification_scheme_category_id = c.id 
	join classification_scheme_category c2 on a.parent_category_code = c2.id 
	order by c2.name, c.name	
	;


