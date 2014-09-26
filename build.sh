

# connect as correct user, since this is a property of the session which cannot be changed
psql -h 127.0.0.1 -U contr_vocab_db -d vocab -f build.sql > /dev/null




