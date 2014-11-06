set -x

# note must enable in BuildConfig.groovy
# //runtime ':db-reverse-engineer:0.5'

grails clean all 
rm grails-app/domain/vocab/ -rf

grails compile
grails db-reverse-engineer


#grails compile
