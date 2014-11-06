

// change works - on fresh db.
rp = vocab.ResponsibleParty.find( "from ResponsibleParty where organisation.acronym = 'eMII' and person.name = 'Mancini, Sebastien'" )
o = vocab.Organisation.find( "from Organisation where acronym = 'AAD'" )
rp.organisation = o
rp.isDirty()
// doens't work? 
rp.save( flush: true, failOnError:true )


// need to change back
o = vocab.Organisation.find( "from Organisation where acronym = 'eMII'" )
rp.organisation = o
rp.save( flush: true, failOnError:true )


// change amendment type
a = vocab.Amendment.get( 1)
a.type = 'removing'
a.save( flush: true, failOnError:true )

// change amendment responsible party
a.responsibleParty = vocab.ResponsibleParty.get( 3)
a.isDirty()
a.save( flush: true, failOnError:true )


// change vocab term
term = vocab.VocabularyTerm.find( "from VocabularyTerm where uid = 'http://vocab.nerc.ac.uk/collection/L22/current/TOOL0665' " )
term.definition = 'whoot'
term.isDirty()
term.save( flush: true, failOnError:true )



