
println vocab.Organisation.list().name
println vocab.Organisation.get(1).name

println vocab.Person.list().name
println vocab.Person.get(1).name

println vocab.AffiliationType.list().name
println vocab.AffiliationType.get(1).name

// note, table is empty
println vocab.OrganisationSynonym.list().name

println vocab.ReferenceSource.list().citationString
println vocab.ReferenceSource.get(1).citationString

println vocab.ResponsibleParty.list().person.name
println vocab.ResponsibleParty.get(1).person.name

println vocab.ClassificationScheme.list().name
println vocab.ClassificationScheme.get(1).name

println vocab.VocabularyRegister.list().uid 
r = vocab.VocabularyRegister.get(1)
println r.uid
println r.managerResponsibleParty.person.name
println r.ownerResponsibleParty.organisation.name

println vocab.VocabularyType.list().name
println vocab.VocabularyType.get(1).name

vt = vocab.VocabularyTerm.get(1 );
println vt.uid
println vt.vocabularyType.name
println vt.proposerResponsibleParty.person.name
println vt.proposerResponsibleParty.organisation.name


println vocab.AssociationType.get(1).name
println vocab.AssociationType.list().name

println vocab.Amendment.list().type
a = vocab.Amendment.get(1)
println a.type
println a.vocabularyTerm.uid
println a.vocabularyTerm.vocabularyRegister.uid


iat = vocab.InternalAssociatedTerms.get(1)
println iat.objectVocabularyTerm.uid
println iat.subjectVocabularyTerm.uid
println iat.associationType.name


eat = vocab.ExternalAssociatedTerms.get(1)
println eat.uid
println eat.vocabularyTerm.uid
println eat.associationType.name


vocab.ClassificationSchemeAssociation.list()
csa = vocab.ClassificationSchemeAssociation.get( 1)
println csa.classificationSchemeCategory.name
println csa.parentClassificationSchemeCategory.name


tcc = vocab.TermCategoryClassification.get( 1)
println tcc.vocabularyTerm.uid
println tcc.classificationSchemeCategory.name



// new change
o = new vocab.Organisation(  name: 'a new organisation', acronym: 'whoot' )
//o.save( flush: true, failOnError:true )

// discard changes
o = new vocab.Organisation(  name: 'another new organisation', acronym: 'whoot' )
o.discard()
//o.save( flush: true, failOnError:true )

// want to try to unambiguously access a responsible party

// need asserts on this stuff.

vocab.Organisation.findAll( "from Organisation where acronym = 'eMII' " )
vocab.Organisation.findAll( "from Organisation where acronym = 'eMII2' " )

vocab.Organisation.find( "from Organisation where acronym = 'eMII' " )
vocab.Organisation.find( "from Organisation where acronym = :acronym", [ acronym: 'eMII' ] )

// note HQL language, which supports joins behind the scenes - joining rp on organisation
vocab.ResponsibleParty.findAll( "from ResponsibleParty where organisation.acronym = :acronym", [ acronym: 'eMII' ] )

rp = vocab.ResponsibleParty.find( "from ResponsibleParty where organisation.acronym = :acronym", [ acronym: 'eMII' ] )

vocab.ResponsibleParty.findAll( "from ResponsibleParty where organisation.acronym = :acronym", [ acronym: 'eMII' ] ).person.name

// fully specified rp
// should be a way to ensure only one entry
rp = vocab.ResponsibleParty.findAll( "from ResponsibleParty where organisation.acronym = 'eMII' and person.name = 'Mancini, Sebastien'" )


vocab.VocabularyTerm.findAll( "from VocabularyTerm " ).uid

term = vocab.VocabularyTerm.find( "from VocabularyTerm where uid = 'http://vocab.nerc.ac.uk/collection/L22/current/TOOL0665' " )
println term.uid
println term.definition

term.vocabularyRegister.properties.each   {  prop -> println "$prop"  }

term.definition = 'whoot'
//#term.save( flush: = true )

// will throw an exception - reveal source of issues on save
//term.save( failOnError:true )

// count of vocab terms
vocab.VocabularyTerm.count




// can introspect the db properites
// works
rp = vocab.ResponsibleParty.find( "from ResponsibleParty where organisation.acronym = 'eMII' and person.name = 'Mancini, Sebastien'" )
rp.properties.each {  prop -> println "$prop"  }
// or
rp.properties.each {  println it }

// testing dirty
rp.isDirty();
rp.getDirtyPropertyNames()

// and can look at the reverse mappings
// eg. all the amendments proposed by the rp,
rp.amendments

// and drill down from rp to organisation and see those properties,
rp.organisation.properties.each {  prop -> println "$prop"  }



