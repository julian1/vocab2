package vocab

class VocabularyTerm {

	String name
	String uid
	String shortName
	String ancillaryInformation
	String definition
	String alternativeTermExpression
	Date dateAdded
	String proposalTermStatus
	String termStatus
	Date dateStatusAmended
	String termNotes
	VocabularyRegister vocabularyRegister
	ReferenceSource referenceSource
	VocabularyType vocabularyType
	ResponsibleParty proposerResponsibleParty
	Person addedByPerson

	static hasMany = [amendments: Amendment,
	                  externalAssociatedTerms: ExternalAssociatedTerms,
	                  objectVocabularyTerms: InternalAssociatedTerms,
	                  subjectVocabularyTerms : InternalAssociatedTerms,
	                  termCategoryClassifications: TermCategoryClassification
				]

	// static belongsTo = [Person, ReferenceSource, ResponsibleParty, VocabularyRegister, VocabularyType]

	static mappedBy = [ objectVocabularyTerms: "objectVocabularyTerm",
	                   subjectVocabularyTerms: "subjectVocabularyTerm",
	                   externalAssociatedTerms: "vocabularyTerm"
				]

	static mapping = {
		id generator:'sequence', params:[sequence:'vocabulary_term_id_seq']
		version false
	}

	static constraints = {
		name maxSize: 110, unique: true
		uid maxSize: 110, unique: true
		shortName nullable: true, maxSize: 110
		ancillaryInformation nullable: true, maxSize: 110
		definition nullable: true, maxSize: 4000
		alternativeTermExpression nullable: true, maxSize: 110
		dateAdded nullable: true
		proposalTermStatus nullable: true, maxSize: 20
		termStatus nullable: true, maxSize: 20
		dateStatusAmended nullable: true
		termNotes nullable: true, maxSize: 1010

		referenceSource nullable: true
	}
}
