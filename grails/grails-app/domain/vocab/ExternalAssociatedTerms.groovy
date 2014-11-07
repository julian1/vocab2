package vocab

class ExternalAssociatedTerms {

	String uid
	AssociationType associationType
	VocabularyTerm vocabularyTerm

	// static belongsTo = [AssociationType, VocabularyTerm]

	static mapping = {
		id generator:'sequence', params:[sequence:'external_associated_terms_id_seq']
		version false
	}

	static constraints = {
		uid maxSize: 510
	}
}
