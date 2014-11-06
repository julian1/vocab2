
Plan to manage -   
	bring together db change-migration,  and grails under,  and skos templates in one repo
	fork d2rml with submodule
	fork skos.  
	git submodules 

------
To run,

grails run-script test.groovy
grails shell 

Can now generate the db from the domain. or the liquibase changeset.
---

Goals
	- one layer of abstraction above the db
	- presents objects rather than tables, and allows dot notation to join relations 
	- presents the logical object/tuple, rather than an integer foreign key
	- includes ownership specification for cascading saves and deletes

Issues
	- read and write roles on the db 
	- review pluralisation - etc. partys

	- remove view code from hibernate.
	- test changes / transactions

	- ownership semantics - belongs to 
		- classification scheme association
		- transactions
	- sequence number generation and saving
	- need to combine into the same git repo - so changes will track together  
		- and sparql mappings.

	- need to change version field in db changelog. 

	understand optimistic locking strategy.

ORM - reverse engineer,
	- sequences - hibernate wants own single sequence
	- missing foreign key constraints
	- version field. 
	- gorm dynamic typing bugs.




Domain class examples,

http://grails.org/doc/latest/ref/Domain%20Classes/findAll.html




-------
Need to downgrade hibernate to version 3 to do the rev-engineer.
then upgrade to 4 get it start in console.

-------

build.sh

----
grails 2.4.4

grails create-app vocab
git init

git add $( find -type f | grep -v git  )
g cm 'initial'

g a .gitignore
etc.



