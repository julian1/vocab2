set -x
sudo -u postgres pg_dump -Fc vocab > output/vocab.dump

