set -x

sudo -u postgres psql -c 'drop database vocab'
sudo -u postgres psql -c 'create database vocab'


sudo -u postgres psql -d vocab -f '/home/meteo/imos/projects/db/admin.sql'

sudo -u postgres psql -c 'drop role contr_vocab_db'
sudo -u postgres psql -c 'drop role maplayers_vocab_read'


# users
sudo -u postgres psql -d vocab -c "create user contr_vocab_db password 'a'" 
sudo -u postgres psql -d vocab -c 'create user maplayers_vocab_read' 

# schema and data


export PGPASSWORD=a 

echo "creating schema"
# psql -d vocab -U contr_vocab_db -c 'create schema contr_vocab_db'  || exit

sudo -u postgres psql -d vocab -c 'create schema contr_vocab_db; alter schema contr_vocab_db owner to contr_vocab_db'  || exit



# :'<,'>s/DROP TABLE/DROP TABLE IF EXISTS/g  
echo "creating tables"
psql -d vocab -U contr_vocab_db -f 'Contr_vocab_db - tables creation v8.0_contrvocabUser.sql' || exit

echo "populating"
psql -d vocab -U contr_vocab_db -f 'test_seb_vocab_v4.txt' || exit 




#sudo -u postgres psql -d vocab -U 'contr_vocab_db' -f 'test_seb_vocab_v4.txt'
#export PGPASSWORD=a
#echo "populating data"
#sudo -u postgres true && export PGPASSWORD=a && psql -d vocab -U contr_vocab_db -f 'test_seb_vocab_v4.txt' || exit
#sudo -u postgres psql -d vocab  -f 'test_seb_vocab_v4.txt' || exit
# sudo -u root true &&   PG_PASSWORD=a && echo $PG_PASSWORD
# select * from admin.objects where schema = 'contr_vocab_db';


