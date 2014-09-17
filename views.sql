
-- Eg. psql -h 127.0.0.1 -U meteo -d vocab -f views.sql

set search_path = contr_vocab_db, public;

select classification_scheme_name as subject,'dc:publisher' as predicate, person_name as object from contr_vocab_db.classification_scheme_table c join contr_vocab_db.person_table p on c.person_id = p.person_id;

