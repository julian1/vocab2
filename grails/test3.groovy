
package vocab;

// Organisation

// Person

p = new Person( name: 'johnny' )
p.save( flush: true, failOnError:true )

p = Person.findWhere( name: 'johnny' )
assert p != null

p.delete()
p.save( flush: true, failOnError:true )

