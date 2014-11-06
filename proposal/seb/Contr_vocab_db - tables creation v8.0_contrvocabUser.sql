DROP TABLE IF EXISTS contr_vocab_db.vocabulary_register_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.person_table CASCADE;
-- DROP TABLE IF EXISTS contr_vocab_db.vocabulary_owner_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.register_owner_table CASCADE;
-- DROP TABLE IF EXISTS contr_vocab_db.vocabulary_manager_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.register_manager_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.term_proposer_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.vocabulary_type_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.organisation_name_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.organisation_synonym_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.affiliation_type_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.person_organisational_affiliation_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.reference_source_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.association_type_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.classification_scheme_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.classification_scheme_category_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.vocabulary_term_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.subject_term_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.object_term_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.internal_associated_terms_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.external_associated_terms_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.classification_scheme_association_table CASCADE;
DROP TABLE IF EXISTS contr_vocab_db.amendment_table CASCADE;

-----------------------------------------------------------------------------------------------------------------------------------------
-- Vocabulary_Register table
CREATE TABLE contr_vocab_db.vocabulary_register_table 
(
register_uid character varying (1010),
register_name character varying (110),
register_content_summary character varying (1010),
register_language_name character varying (50),
register_language_code character varying (10),
register_language_country character varying (10),
register_language_encoding character varying (50),
register_version character (110),
register_date timestamp (6) without time zone,
date_of_last_change timestamp (6) without time zone,
CONSTRAINT vocabulary_register_table_pkey PRIMARY KEY (register_name)
);
ALTER TABLE contr_vocab_db.vocabulary_register_table 
  OWNER TO contr_vocab_db;
----------------------------------------------------------------------------------------------------------------------------------------
-- Person table
CREATE TABLE contr_vocab_db.person_table 
(
person_id integer,
person_name character varying (110),
person_salutation character (6),
alternate_person_name_expression character varying (110),
contact_email character varying (110),
contact_phone_number character varying (20),
contact_mobile_number character varying (20),
CONSTRAINT person_table_pkey PRIMARY KEY (person_id) 
);
ALTER TABLE contr_vocab_db.person_table
  OWNER TO contr_vocab_db;

-----------------------------------------------------------------------------------------------------------------------------------------
-- Organisation Name table
CREATE TABLE contr_vocab_db.organisation_name_table 
(
organisation_name_id integer,
organisation_name character varying (110),
organisation_name_description character varying (1000),
organisation_acronym character (10),
organisation_address character varying (110),
organisation_name_status character (10),
organisation_synonym boolean,
organisation_notes character varying (1010),
CONSTRAINT organisation_name_table_pkey PRIMARY KEY (organisation_name_id)
);
ALTER TABLE contr_vocab_db.organisation_name_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Organisation Synonym table
CREATE TABLE contr_vocab_db.organisation_synonym_table 
(
organisation_synonym_id integer,
organisation_name_id integer,
organisation_name character varying (110),
CONSTRAINT organisation_synonym_table_pkey PRIMARY KEY (organisation_synonym_id),
CONSTRAINT organisation_synonym_table_fkey FOREIGN KEY (organisation_name_id) REFERENCES contr_vocab_db.organisation_name_table (organisation_name_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
ALTER TABLE contr_vocab_db.organisation_synonym_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Affiliation Type table
CREATE TABLE contr_vocab_db.affiliation_type_table 
(
affiliation_type_name character varying (20),
affiliation_description character varying (110),
CONSTRAINT affiliation_type_table_pkey PRIMARY KEY (affiliation_type_name) 
);
ALTER TABLE contr_vocab_db.affiliation_type_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Person Organisation Affiliation table
CREATE TABLE contr_vocab_db.person_organisational_affiliation_table 
(
person_id integer,
organisation_name_id integer,
affiliation_type_name character varying (20),
CONSTRAINT person_organisational_affiliation_table_pkey PRIMARY KEY (person_id,organisation_name_id,affiliation_type_name),
CONSTRAINT person_organisational_affiliation_table_fkey FOREIGN KEY (person_id) REFERENCES contr_vocab_db.person_table (person_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT person_organisational_affiliation_table_fkey2 FOREIGN KEY (affiliation_type_name) REFERENCES contr_vocab_db.affiliation_type_table (affiliation_type_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT person_organisational_affiliation_table_fkey3 FOREIGN KEY (organisation_name_id) REFERENCES contr_vocab_db.organisation_name_table (organisation_name_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
ALTER TABLE contr_vocab_db.person_organisational_affiliation_table
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Register Owner table
CREATE TABLE contr_vocab_db.register_owner_table
(
register_owner_id character varying (110),
person_id integer,
organisation_name_id integer,
register_name character varying (110),
CONSTRAINT register_owner_table_pkey PRIMARY KEY (register_owner_id),
CONSTRAINT register_owner_table_fkey FOREIGN KEY (person_id) REFERENCES contr_vocab_db.person_table (person_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT register_owner_table_fkey2 FOREIGN KEY (organisation_name_id) REFERENCES contr_vocab_db.organisation_name_table (organisation_name_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT register_owner_table_fkey3 FOREIGN KEY (register_name) REFERENCES contr_vocab_db.vocabulary_register_table (register_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
ALTER TABLE contr_vocab_db.register_owner_table
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Register_Manager table
CREATE TABLE contr_vocab_db.register_manager_table
(
register_manager_id character varying (110),
person_id integer,
organisation_name_id integer,
register_name character varying (110),
CONSTRAINT register_manager_table_pkey PRIMARY KEY (register_manager_id),
CONSTRAINT register_manager_table_fkey FOREIGN KEY (person_id) REFERENCES contr_vocab_db.person_table (person_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT register_manager_table_fkey2 FOREIGN KEY (organisation_name_id) REFERENCES contr_vocab_db.organisation_name_table (organisation_name_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT register_manager_table_fkey3 FOREIGN KEY (register_name) REFERENCES contr_vocab_db.vocabulary_register_table (register_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
ALTER TABLE contr_vocab_db.register_manager_table
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Term proposer table
CREATE TABLE contr_vocab_db.term_proposer_table
(
term_proposer_id integer,
person_id integer,
organisation_name_id integer,
CONSTRAINT term_proposer_table_pkey PRIMARY KEY (term_proposer_id),
CONSTRAINT term_proposer_table_fkey FOREIGN KEY (person_id) REFERENCES contr_vocab_db.person_table (person_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT term_proposer_table_fkey2 FOREIGN KEY (organisation_name_id) REFERENCES contr_vocab_db.organisation_name_table (organisation_name_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
ALTER TABLE contr_vocab_db.term_proposer_table
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Vocabulary_Type table
CREATE TABLE contr_vocab_db.vocabulary_type_table 
(
vocabulary_type_name character varying (20),
vocabulary_type_definition character varying (1010),
CONSTRAINT vocabulary_type_table_pkey PRIMARY KEY (vocabulary_type_name)
);
ALTER TABLE contr_vocab_db.vocabulary_type_table
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Reference Source table
CREATE TABLE contr_vocab_db.reference_source_table 
(
reference_id integer,
citation_string character varying (110),
online_reference_resource character varying (200),
organisation_name_id integer,
online_term_resource character varying (110),
CONSTRAINT reference_source_table_pkey PRIMARY KEY (reference_id) 
);
ALTER TABLE contr_vocab_db.reference_source_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Association Type table
CREATE TABLE contr_vocab_db.association_type_table 
(
association_type_name character varying (20),
association_type_name_description character varying (1010),
CONSTRAINT association_type_table_pkey PRIMARY KEY (association_type_name) 
);
ALTER TABLE contr_vocab_db.association_type_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Classification Scheme table
CREATE TABLE contr_vocab_db.classification_scheme_table 
(
classification_scheme_id integer,
classification_scheme_name character varying (1010),
classification_scheme_description character varying (1010),
classification_scheme_title character varying (1010),
organisation_name_id integer,
person_id integer,
date_added date,
CONSTRAINT classification_scheme_table_pkey PRIMARY KEY (classification_scheme_id) 
);
ALTER TABLE contr_vocab_db.classification_scheme_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Classification Scheme Category table
CREATE TABLE contr_vocab_db.classification_scheme_category_table 
(
classification_scheme_category_id integer,
classification_scheme_category_name character varying (1010),
classification_scheme_category_description character varying (1010),
classification_scheme_id integer,
classification_scheme_category_label character varying (1010),
date_added date,
CONSTRAINT classification_scheme_category_table_pkey PRIMARY KEY (classification_scheme_category_id),
CONSTRAINT classification_scheme_category_table_fkey FOREIGN KEY (classification_scheme_id) REFERENCES contr_vocab_db.classification_scheme_table (classification_scheme_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION 
);
ALTER TABLE contr_vocab_db.classification_scheme_category_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Vocabulary_Term table
CREATE TABLE contr_vocab_db.vocabulary_term_table 
(
vocabulary_term_name character varying (110),
vocabulary_type_name character (20),
vocabulary_term_code integer,
vocabulary_term_uid character (110),
vocabulary_instance_of boolean,
vocabulary_term_short_name character (110),
vocabulary_term_ancillary_information character varying (110),
vocabulary_term_definition character varying (4000),
alternative_term_expression character varying (110),
date_added date,
added_by character varying (110),
term_proposer_id integer,
proposal_term_status character (20),
term_status character (20),
date_status_amended date,
reference_source_id integer,
term_notes character varying (1010),
register_name character varying (110),
internal_relationship boolean,
external_relationship boolean,
CONSTRAINT vocabular_term_table_pkey PRIMARY KEY (vocabulary_term_name),
CONSTRAINT vocabular_term_table_fkey FOREIGN KEY (reference_source_id) REFERENCES contr_vocab_db.reference_source_table (reference_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT vocabular_term_table_fkey2 FOREIGN KEY (vocabulary_type_name) REFERENCES contr_vocab_db.vocabulary_type_table (vocabulary_type_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT vocabular_term_table_fkey3 FOREIGN KEY (term_proposer_id) REFERENCES contr_vocab_db.term_proposer_table (term_proposer_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT vocabular_term_table_fkey4 FOREIGN KEY (register_name) REFERENCES contr_vocab_db.vocabulary_register_table (register_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
ALTER TABLE contr_vocab_db.vocabulary_term_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Subject Term table
CREATE TABLE contr_vocab_db.subject_term_table 
(
subject_term_id integer,
vocabulary_term_name character varying (110),
CONSTRAINT subject_term_table_pkey PRIMARY KEY (subject_term_id),
CONSTRAINT subject_term_table_fkey FOREIGN KEY (vocabulary_term_name) REFERENCES contr_vocab_db.vocabulary_term_table (vocabulary_term_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
ALTER TABLE contr_vocab_db.subject_term_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Object Term table
CREATE TABLE contr_vocab_db.object_term_table 
(
object_term_id integer,
vocabulary_term_name character varying (110),
CONSTRAINT object_term_table_pkey PRIMARY KEY (object_term_id),
CONSTRAINT object_term_table_fkey FOREIGN KEY (vocabulary_term_name) REFERENCES contr_vocab_db.vocabulary_term_table (vocabulary_term_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
ALTER TABLE contr_vocab_db.object_term_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Internal Associated Terms table
CREATE TABLE contr_vocab_db.internal_associated_terms_table 
(
association_type_name character varying (20),
subject_term_id integer,
object_term_id integer,
CONSTRAINT internal_associated_terms_table_pkey PRIMARY KEY (association_type_name,subject_term_id,object_term_id),
CONSTRAINT internal_associated_terms_table_fkey FOREIGN KEY (association_type_name) REFERENCES contr_vocab_db.association_type_table (association_type_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT internal_associated_terms_table_fkey2 FOREIGN KEY (subject_term_id) REFERENCES contr_vocab_db.subject_term_table (subject_term_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT internal_associated_terms_table_fkey3 FOREIGN KEY (object_term_id) REFERENCES contr_vocab_db.object_term_table (object_term_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
ALTER TABLE contr_vocab_db.internal_associated_terms_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- External Associated Terms table
CREATE TABLE contr_vocab_db.external_associated_terms_table 
(
association_type_name character varying (20),
vocabulary_term_name character varying (110),
external_term_uid character varying (510),
CONSTRAINT external_associated_terms_table_pkey PRIMARY KEY (association_type_name,vocabulary_term_name,external_term_uid),
CONSTRAINT external_associated_terms_table_fkey FOREIGN KEY (association_type_name) REFERENCES contr_vocab_db.association_type_table (association_type_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT external_associated_terms_table_fkey2 FOREIGN KEY (vocabulary_term_name) REFERENCES contr_vocab_db.vocabulary_term_table (vocabulary_term_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
ALTER TABLE contr_vocab_db.external_associated_terms_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Classification Scheme Association table
CREATE TABLE contr_vocab_db.classification_scheme_association_table 
(
classification_scheme_id integer,
classification_scheme_category_id integer,
vocabulary_term_name character varying (110),
CONSTRAINT classification_scheme_association_table_pkey PRIMARY KEY (classification_scheme_id,classification_scheme_category_id,vocabulary_term_name),
CONSTRAINT classification_scheme_association_table_fkey FOREIGN KEY (vocabulary_term_name) REFERENCES contr_vocab_db.vocabulary_term_table (vocabulary_term_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT classification_scheme_association_table_fkey2 FOREIGN KEY (classification_scheme_category_id) REFERENCES contr_vocab_db.classification_scheme_category_table (classification_scheme_category_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT classification_scheme_association_table_fkey3 FOREIGN KEY (classification_scheme_id) REFERENCES contr_vocab_db.classification_scheme_table (classification_scheme_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION 
);
ALTER TABLE contr_vocab_db.classification_scheme_association_table 
  OWNER TO contr_vocab_db;
-----------------------------------------------------------------------------------------------------------------------------------------
-- Vocabulary_Term table
CREATE TABLE contr_vocab_db.amendment_table 
(
amendment_id integer,
vocabulary_term_name character varying (110),
vocabulary_term_code integer,
person_id integer,
organisation_name_id integer,
register_name character varying (110),
amendment_type character varying (50),
amendment_request_date date,
amendment_approval_date date,
CONSTRAINT amendment_table_pkey PRIMARY KEY (amendment_id),
CONSTRAINT amendment_table_fkey FOREIGN KEY (vocabulary_term_name) REFERENCES contr_vocab_db.vocabulary_term_table (vocabulary_term_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT amendment_table_fkey2 FOREIGN KEY (person_id) REFERENCES contr_vocab_db.person_table (person_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT amendment_table_fkey3 FOREIGN KEY (organisation_name_id) REFERENCES contr_vocab_db.organisation_name_table (organisation_name_id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT amendment_table_fkey4 FOREIGN KEY (register_name) REFERENCES contr_vocab_db.vocabulary_register_table (register_name) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
ALTER TABLE contr_vocab_db.amendment_table 
  OWNER TO contr_vocab_db;

GRANT SELECT ON TABLE contr_vocab_db.affiliation_type_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.amendment_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.association_type_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.classification_scheme_association_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.classification_scheme_category_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.classification_scheme_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.external_associated_terms_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.internal_associated_terms_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.object_term_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.organisation_name_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.organisation_synonym_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.person_organisational_affiliation_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.person_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.reference_source_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.register_manager_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.register_owner_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.subject_term_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.term_proposer_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.vocabulary_register_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.vocabulary_term_table TO GROUP maplayers_vocab_read;
GRANT SELECT ON TABLE contr_vocab_db.vocabulary_type_table TO GROUP maplayers_vocab_read;

SET DATESTYLE TO PostgreSQL,European;
