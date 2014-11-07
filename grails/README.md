
Plan to manage -   
	bring together db change-migration,  and grails under,  and skos templates in one repo
	fork d2rml with submodule
	fork skos.  
	git submodules 

Running,
	grails run-script test.groovy
	grails run-script test2.groovy
	grails shell 


Possible Ownership options,
	VocabularyTerm -> eat, iat, tcc, csa
	Organisation -> organisation synonym
	referenceSource -> vocabularyTerm


Liquibase
	Can now generate the db from the domain. or the liquibase changeset.

Goals
	- one layer of abstraction above the db
	- presents objects rather than tables, and allows dot notation to join relations 
	- presents the logical object/tuple, rather than an integer foreign key
	- includes ownership specification for cascading saves and deletes

Issues
	- (ok) read and write roles on the db 
	- review pluralisation - etc. partys
	- (leave) remove view code from hibernate.
	- test changes / transactions
	- (done ) ownership semantics - belongs to  - leave as is
	- (done) sequence number generation and saving
	- (done) need to combine into the same git repo - so changes will track together and sparql mappings.
	- (done) need to change version field in db changelog. 
	- (done) understand optimistic locking strategy.

ORM Issues 
	- reverse engineer,
		- property naming when multiple one to many relationships
		- sequences - hibernate wants own single sequence
		- hiberate rather than existing key constraints
		- version field naming conflicts 
		- gorm dynamic typing bugs




Domain class examples,

http://grails.org/doc/latest/ref/Domain%20Classes/findAll.html


-------
Note if run rev-engineer script then must
	downgrade hibernate to version 3 to do the rev-engineer.
	then upgrade to 4 get it start in console.

