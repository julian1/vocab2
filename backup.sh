set -x

target=output/vocab.dump
rm $target

sudo -u postgres pg_dump -Fc vocab > $target

# upload and restore
# rsync -avzP output/vocab.dump  2-nsp-mel.emii.org.au:~/
# sudo -u postgres psql  -d harvest -c 'drop schema contr_vocab_db cascade' 
# sudo -u postgres psql  -d harvest -c 'create schema contr_vocab_db'
# sudo -u postgres pg_restore -n contr_vocab_db vocab.dump -d harvest 
# then must provision, to get permissions set over the top

