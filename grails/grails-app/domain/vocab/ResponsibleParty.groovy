package vocab

class ResponsibleParty {

	AffiliationType affiliationType
	Person person
	Organisation organisation

	static hasMany = [amendments: Amendment,
	                  classificationSchemes: ClassificationScheme,
	                  managerResponsiblePartys: VocabularyRegister,
	                  ownerResponsiblePartys: VocabularyRegister,
	                  vocabularyTerms: VocabularyTerm]
	static belongsTo = [AffiliationType, Organisation, Person]

	// TODO you have multiple hasMany references for class(es) [VocabularyRegister] 
	//      so you'll need to disambiguate them with the 'mappedBy' property:


    static mappedBy = [ managerResponsiblePartys: "managerResponsibleParty",
                         ownerResponsiblePartys: "ownerResponsibleParty"]


	static mapping = {
		id generator: "assigned"
		version false
	}
}
