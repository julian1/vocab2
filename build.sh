
# make sure we have the necessary user
if false; then
	sudo -u postgres psql -c 'drop database if exists vocab' || exit
	sudo -u postgres psql -c 'drop user if exists contr_vocab_db' || exit
	sudo -u postgres psql -c 'create user contr_vocab_db with password $$contr_vocab_db$$ createdb' || exit
	echo '127.0.0.1:5432:*:contr_vocab_db:contr_vocab_db' > ~/.pgpass 
fi

# connect as correct user, since this is a property of the session which cannot be changed
psql -h 127.0.0.1 -U contr_vocab_db -d postgres -f build.sql

