-- psql -U jfca -h dbprod.emii.org.au -d harvest  -f dump_fields.sql

-- select  relation, field from admin.fields where schema = 'contr_vocab_db' and kind = 'r' order by relation,field;

select  field, relation, type 
	from admin.fields 
	where schema = 'contr_vocab_db' and kind = 'r' 
	order by field,relation;
-- select  *  from admin.fields where schema = 'contr_vocab_db' and kind = 'r';

