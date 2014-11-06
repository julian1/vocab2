
package vocab;

// Organisation
o = new Organisation( name: 'csiro')
o.notes = 'great organisation'
o.save( flush: true, failOnError:true )

o = Organisation.findWhere( name: 'csiro' )
assert o != null
o.delete( flush: true)




// Person
p = new Person( name: 'johnny' )
p.save( flush: true, failOnError:true )

p = Person.findWhere( name: 'johnny' )
assert p != null
p.delete(flush: true)

