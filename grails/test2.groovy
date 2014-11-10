
// UPDATE

package vocab;
//import vocab.*

// Organisation
o = Organisation.find( "from Organisation where acronym = 'eMII'" )
o.notes = 'great organisation'
o.save( flush: true, failOnError:true )

// AffiliationType
a = AffiliationType.get(1)
a.name = 'whoot'
a.save( flush: true, failOnError:true )

// Person
p = Person.get(3)
p.name = 'johnny'
p.save( flush: true, failOnError:true )


// OrganisationSynonym - no records


// ResponsibleParty
rp = ResponsibleParty.find( "from ResponsibleParty where organisation.acronym = 'eMII' and person.name = 'Mancini, Sebastien'" )
// rp = ResponsibleParty.findWhere = { it.organisation.acronym = 'eMII' && it.person.name = 'Mancini, Sebastien' }
// rp = ResponsibleParty.findWhere = { it.organisation.acronym = 'eMII'  }
assert rp != null

o = Organisation.findWhere( acronym: 'AAD' )
assert o != null
rp.organisation = o
assert rp.isDirty() == true
rp.save( flush: true, failOnError:true )

// need to change back
o = Organisation.find( "from Organisation where acronym = 'eMII'" )
assert o != null
rp.organisation = o
rp.save( flush: true, failOnError:true )


// VocabularyType
t = VocabularyType.findWhere( name: 'Instrument'  )
assert t != null
t.definition = 'whoot'
t.save( flush: true, failOnError:true )


// ReferenceSource
rs = ReferenceSource.get( 1)
assert rs != null
rs.citationString = 'whoot'
t.save( flush: true, failOnError:true )


// VocabularyRegister
vr = VocabularyRegister.get( 1) 
assert vr != null
vr.name = 'whoot'
vr.save( flush: true, failOnError:true )

vr.managerResponsibleParty = ResponsibleParty.get( 2)
vr.save( flush: true, failOnError:true )


// ClassificationScheme
cs = ClassificationScheme.get( 1)
assert cs != null
cs.name = 'my classification scheme'
cs.save( flush: true, failOnError:true )


// AssociationType
at = AssociationType.get( 1)
assert at != null
at.description = 'all about the association type'
at.save( flush: true, failOnError:true )


// VocabularyTerm
term = VocabularyTerm.findByUid( 'http://vocab.aodn.org.au/def/imosfacilities/800' )
assert term != null
term.definition = 'whoot'
term.isDirty()
term.save( flush: true, failOnError:true )

// just differet accessors 
term.vocabularyType = VocabularyType.find( "from VocabularyType where name = 'UnitsOfMeasure'" )
assert term.vocabularyType != null
term.vocabularyType = VocabularyType.findByName( 'UnitsOfMeasure' )
assert term.vocabularyType != null
term.vocabularyType = VocabularyType.findWhere( name: 'Instrument'  )
assert term.vocabularyType != null


assert term.vocabularyType != null
term.save( flush: true, failOnError:true )


// ClassificationSchemeCategory
csc = ClassificationSchemeCategory.get( 1)
assert csc != null
csc.description = 'updated description'
csc.save( flush: true, failOnError:true )


// Amendment
a = Amendment.get( 1)
a.type = 'removing'
a.save( flush: true, failOnError:true )

// change amendment responsible party
a.responsibleParty = ResponsibleParty.get( 3)
a.isDirty()
a.save( flush: true, failOnError:true )


// ExternalAssociatedTerms
eat = ExternalAssociatedTerms.findWhere( uid: 'http://vocab.nerc.ac.uk/collection/P01/current/GTDHZZ01' )
assert eat != null
eat.associationType = AssociationType.findWhere( name: 'sameAs' )  
eat.save( flush: true, failOnError:true )


// InternalAssociatedTerms
iat = InternalAssociatedTerms.find( "from InternalAssociatedTerms where associationType.name = 'isInstanceOf' and objectVocabularyTerm.uid = 'http://vocab.nerc.ac.uk/collection/L06/current/31'" )
assert iat != null
iat.subjectVocabularyTerm = VocabularyTerm.findWhere( uid: 'http://vocab.aodn.org.au/def/instrument/33'  )  
iat.save( flush: true, failOnError:true )


// TermCategoryClassification
tcc = TermCategoryClassification.find( "from TermCategoryClassification where vocabularyTerm.uid = 'http://vocab.nerc.ac.uk/collection/L06/current/31'" )  
assert tcc != null
tcc.classificationSchemeCategory = ClassificationSchemeCategory.findWhere( name: 'http://vocab.aodn.org.au/def/ClassScheme/parameter1/Category/3' )  
assert tcc.classificationSchemeCategory != null
tcc.save( flush: true, failOnError:true )


// ClassificationSchemeAssociation
csa = ClassificationSchemeAssociation.find( 
  "from ClassificationSchemeAssociation "
  + " where classificationSchemeCategory.name = 'http://vocab.aodn.org.au/def/ClassScheme/parameter1/Category/2'" 
  + " and parentClassificationSchemeCategory.name = 'http://vocab.aodn.org.au/def/ClassScheme/parameter1/Category/56'" 
)
assert csa != null
csa.parentClassificationSchemeCategory.name = 'http://vocab.aodn.org.au/def/ClassScheme/parameter1/Category/45'
tcc.save( flush: true, failOnError:true )

// change back
csa.parentClassificationSchemeCategory.name = 'http://vocab.aodn.org.au/def/ClassScheme/parameter1/Category/56'
tcc.save( flush: true, failOnError:true )



