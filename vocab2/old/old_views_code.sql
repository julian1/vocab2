
-- Eg. psql -h 127.0.0.1 -U meteo -d vocab -f views.sql

set search_path = contr_vocab_db, public;


-- Types




drop view if exists rdf;

drop view if exists rdf_types; 
create view rdf_types as
select classification_scheme_name as subject, 
	'rdf:type'::varchar as predicate, 
	'skos:ConceptScheme'::varchar as object 
	from classification_scheme_table
	union all

	-- is this a category, concept or top concept?
	-- how do we identify the topConcept ?  
--	select classification_scheme_category_name as subject,
--	'rdf:type'::varchar as predicate, 
--	'skos:Category ?'::varchar as object 
--	from classification_scheme_category_table

	-- Not convinced we even need the association table.

	select c.classification_scheme_category_name as subject,
	'rdf:type'::varchar as predicate, 
	'skos:TopConcept'::varchar as object 
	from classification_scheme_category_table c 
	join classification_scheme_association_table a 
	on c.classification_scheme_category_id = a.classification_scheme_category_id 
	where a.parent_category_code is null

--	where a.hierarchy_level = '1' 

;


-- CONCEPT SCHEME

DONE
drop view if exists dc_publisher; 
create view dc_publisher as
select 
	c.classification_scheme_name as subject,
	'dc:publisher'::varchar as predicate, 
	p.person_name as object 
	from classification_scheme_table c 
	join person_table p on c.person_id = p.person_id
;


DONE
drop view if exists dc_title; 
create view dc_title as
select 
	classification_scheme_name as subject,
	'dc:title'::varchar as predicate, 
	classification_scheme_title as object
	from classification_scheme_table
;

drop view if exists dc_description; 
create view dc_description as
select 
	classification_scheme_name as subject,
	'dc:description'::varchar as predicate, 
	classification_scheme_description as object
	from classification_scheme_table
;


-- TOP CONCEPT

drop view if exists skos_definition;
create view skos_definition as
select 
	classification_scheme_category_name as subject,
	'skos:definition'::varchar as predicate, 
	classification_scheme_category_description as object
	from classification_scheme_category_table; 
;

drop view if exists dcterms_issued;
create view dcterms_issued as
select 
	classification_scheme_category_name as subject,
	'dcterms:issued'::varchar as predicate, 
	date_added::varchar as object						-- do we really want to do this cast?
	from classification_scheme_category_table; 
;


---- It might be possible to avoid the union, and instead do 
---- left joins ?
--- several ways to do this ...

--- actually using some explain's it looks pretty good 
-- psql -h 127.0.0.1 -U meteo -d vocab -c 'explain select * from contr_vocab_db. rdf where predicate = $$dcterms:issued$$ '

create view rdf as
select * from dc_title 
union all select * from dc_publisher 
union all select * from dc_description
union all select * from skos_definition
union all select * from dcterms_issued
order by predicate; 
;



