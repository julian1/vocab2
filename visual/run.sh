
output=./tmp
rm -rf $output
mkdir $output

java -jar schemaSpy_5.0.0.jar -t my.properties -s contr_vocab_db -u contr_vocab_db -p contr_vocab_db -o tmp/

