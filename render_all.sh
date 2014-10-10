set -x
output=./skos_files

rm -rf "$output"
mkdir "$output"


./render.rb -t AODNParameterVocabulary.erb			> $output/AODNParameterVocabulary.xml
./render.rb -t parameterClassificationScheme.erb	> $output/parameterClassificationScheme.xml

./render.rb -t platformClassificationScheme.erb		> $output/platformClassificationScheme.erb


