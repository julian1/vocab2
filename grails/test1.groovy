
// READ ACTIONS

// general tuple / field access
println vocab.Organisation.list().name
println vocab.Organisation.get(1).name

println vocab.Person.list().name
println vocab.Person.get(1).name

println vocab.AffiliationType.list().name
println vocab.AffiliationType.get(1).name

// note, OrganisationSynonym table is empty
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

// more extensive drill down
vt = vocab.VocabularyTerm.get(1 );
assert vt != null
println vt.uid
println vt.vocabularyType.name
println vt.proposerResponsibleParty.person.name
println vt.proposerResponsibleParty.organisation.name


println vocab.AssociationType.get(1).name
println vocab.AssociationType.list().name

println vocab.Amendment.list().type
a = vocab.Amendment.get(1)
assert a != null
println a.type
println a.vocabularyTerm.uid
println a.vocabularyTerm.vocabularyRegister.uid


iat = vocab.InternalAssociatedTerms.get(1)
assert iat != null
println iat.objectVocabularyTerm.uid
println iat.subjectVocabularyTerm.uid
println iat.associationType.name


eat = vocab.ExternalAssociatedTerms.get(1)
assert eat != null
println eat.uid
println eat.vocabularyTerm.uid
println eat.associationType.name


vocab.ClassificationSchemeAssociation.list()
csa = vocab.ClassificationSchemeAssociation.get( 1)
assert csa != null
println csa.classificationSchemeCategory.name
println csa.parentClassificationSchemeCategory.name


tcc = vocab.TermCategoryClassification.get( 1)
assert tcc != null
println tcc.vocabularyTerm.uid
println tcc.classificationSchemeCategory.name


// creating new entries
// new change
o = new vocab.Organisation(  name: 'a new organisation', acronym: 'whoot' )
//o.save( flush: true, failOnError:true )

// discard changes
o = new vocab.Organisation(  name: 'another new organisation', acronym: 'whoot' )
o.discard()
//o.save( flush: true, failOnError:true )
// want to try to unambiguously access a responsible party
// need asserts on this stuff.


// search/lookup

// by field match, should also test for guarantee of uniqueness
o = vocab.Organisation.findWhere( acronym: 'eMII' )
assert o != null

// by HQL
o = vocab.Organisation.findAll( "from Organisation where acronym = 'eMII2' " )
assert o != null

// with parameter
o = vocab.Organisation.find( "from Organisation where acronym = :acronym", [ acronym: 'eMII' ] )
assert o != null

// HQL language supports simple joins behind the scenes - here for organisation.acronym 
rp = vocab.ResponsibleParty.find( "from ResponsibleParty where organisation.acronym = :acronym", [ acronym: 'eMII' ] )
assert rp != null

name = vocab.ResponsibleParty.findAll( "from ResponsibleParty where organisation.acronym = :acronym", [ acronym: 'eMII' ] ).person.name
assert name != null

// fully specified rp
// should be a way to ensure only one entry
rp = vocab.ResponsibleParty.findAll( "from ResponsibleParty where organisation.acronym = 'eMII' and person.name = 'Mancini, Sebastien'" )
assert name != null

// all vocabulary terms (not classification categories) by uid
vocab.VocabularyTerm.findAll( "from VocabularyTerm " ).uid

// by term
term = vocab.VocabularyTerm.findWhere( uid: 'http://vocab.nerc.ac.uk/collection/L22/current/TOOL0665' )
assert term != null
println term.uid
println term.definition

// change a property value
term.definition = 'whoot'

// save and flush, independent of hibernate session
//#term.save( flush: = true )

// throw on exception instead of returning null - which gives message
//term.save( failOnError:true )

// count of vocab terms
vocab.VocabularyTerm.count


// can use introspection on db properites
rp = vocab.ResponsibleParty.find( "from ResponsibleParty where organisation.acronym = 'eMII' and person.name = 'Mancini, Sebastien'" )
rp.properties.each { prop -> println "$prop" }
// or using it notation
rp.properties.each { println it }

// testing whether object is dirty/modified
rp.isDirty();

// listing dirty property fields
rp.getDirtyPropertyNames()

// reverse mappings
// eg. all the amendments proposed by the rp,
rp.amendments

// and drill down from rp to organisation and see those properties,
rp.organisation.properties.each { println it }


