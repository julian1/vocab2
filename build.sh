
# create the db - only do once - to avoid having to disconnect 
if false ; then
	sudo -u postgres psql -c 'drop database if exists vocab' || exit
	sudo -u postgres psql -c 'drop user if exists contr_vocab_db' || exit
	sudo -u postgres psql -c 'create user contr_vocab_db with password $$contr_vocab_db$$ createdb' || exit
	echo '127.0.0.1:5432:*:contr_vocab_db:contr_vocab_db' > ~/.pgpass 

	# create db
	psql -h 127.0.0.1 -U contr_vocab_db -d postgres -c 'create database vocab' || exit
	

	# import into public schema
	psql -h 127.0.0.1 -U contr_vocab_db -d vocab -f misc/admin93.sql

	echo done 

fi

# connect as correct user, since this is a property of the session which cannot be changed
psql -h 127.0.0.1 -U contr_vocab_db -d vocab -f build.sql


# psql -h 127.0.0.1 -U contr_vocab_db -d vocab -c 'select 1;' 

