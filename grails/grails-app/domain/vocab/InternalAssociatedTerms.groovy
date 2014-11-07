package vocab

class InternalAssociatedTerms {

	VocabularyTerm objectVocabularyTerm
	AssociationType associationType
	VocabularyTerm subjectVocabularyTerm

	// static belongsTo = [AssociationType, VocabularyTerm]

	static mapping = {
		id generator:'sequence', params:[sequence:'internal_associated_terms_id_seq']
		version false
	}
}
