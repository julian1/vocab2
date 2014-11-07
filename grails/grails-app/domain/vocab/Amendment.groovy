package vocab

class Amendment {

	String type
	Date requestDate
	Date approvalDate
	VocabularyRegister vocabularyRegister
	ResponsibleParty responsibleParty
	VocabularyTerm vocabularyTerm

	// static belongsTo = [ResponsibleParty, VocabularyRegister, VocabularyTerm]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		type nullable: true, maxSize: 50
		requestDate nullable: true
		approvalDate nullable: true
	}
}
