
create user contr_vocab_db password 'contr_vocab_db' ;
create database vocab;
\connect vocab
# create schema contr_vocab_db authorization contr_vocab_db ;
alter database vocab owner to contr_vocab_db ;

