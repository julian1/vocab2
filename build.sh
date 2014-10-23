

# connect as correct user, since this is a property of the session which cannot be changed
psql -h 127.0.0.1 -U contr_vocab_db -d vocab -f build.sql > /dev/null

# only if using admin93.
# psql -h 127.0.0.1 -U contr_vocab_db -d vocab -f ~/imos/projects/db/admin93.sql   

pushd migration/; ./run_migrations.sh; popd



