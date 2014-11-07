package vocab

class ExternalAssociatedTerms {

	String uid
	AssociationType associationType
	VocabularyTerm vocabularyTerm

	// static belongsTo = [AssociationType, VocabularyTerm]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		uid maxSize: 510
	}
}
