package vocab

class InternalAssociatedTerms {

	VocabularyTerm objectVocabularyTerm
	AssociationType associationType
	VocabularyTerm subjectVocabularyTerm

	static belongsTo = [AssociationType, VocabularyTerm]

	static mapping = {
		id generator: "assigned"
		version false
	}
}
