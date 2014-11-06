# create the db - only do once - to avoid having to disconnect 

sudo -u postgres psql -c 'drop database if exists vocab' || exit
sudo -u postgres psql -c 'drop user if exists contr_vocab_db' || exit
sudo -u postgres psql -c 'create user contr_vocab_db with password $$contr_vocab_db$$ createdb' || exit
echo '127.0.0.1:5432:*:contr_vocab_db:contr_vocab_db' > ~/.pgpass 

# create db
psql -h 127.0.0.1 -U contr_vocab_db -d postgres -c 'create database vocab' || exit


# import into public schema
psql -h 127.0.0.1 -U contr_vocab_db -d vocab -f misc/admin93.sql

echo done 


