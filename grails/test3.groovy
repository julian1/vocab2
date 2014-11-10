
package vocab;

// Organisation
o = new Organisation( name: 'csiro')
o.notes = 'great organisation'
o.save( flush: true, failOnError:true )

o = Organisation.findWhere( name: 'csiro' )
assert o != null
o.delete( flush: true)




// Person
p = new Person( name: 'johnny2' )
p.save( flush: true, failOnError:true )

p = Person.findWhere( name: 'johnny2' )
assert p != null
p.delete(flush: true)



// make changes and discard
o = new vocab.Organisation(  name: 'another new organisation', acronym: 'whoot' )
o.discard()
o.save( flush: true, failOnError:true )

