
-- Usage, psql -h 127.0.0.1 -U meteo -f build.sql  2>&1 | tee log.txt

-- Usage psql -h 127.0.0.1 -U meteo -f build.sql

-- role changes must be done as postgres
-- sudo -u postgres psql -c 'create user contr_vocab_db password $$contr_vocab_db$$' 
-- sudo -u postgres psql -c 'grant contr_vocab_db to meteo '


drop database if exists vocab; 
create database vocab; 

\c vocab;

create schema contr_vocab_db ; 
alter schema contr_vocab_db owner to contr_vocab_db ; 
set search_path = contr_vocab_db, public;

\i docs_seb/Vocab_db_table_creation_10092014.sql; 

\i docs_seb/test_seb_vocab_v5.txt; 

\i misc/admin93.sql

