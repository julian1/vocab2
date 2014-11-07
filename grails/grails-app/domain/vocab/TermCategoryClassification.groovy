package vocab

class TermCategoryClassification {

	ClassificationSchemeCategory classificationSchemeCategory
	VocabularyTerm vocabularyTerm

	// static belongsTo = [ClassificationSchemeCategory, VocabularyTerm]

	static mapping = {
		id generator:'sequence', params:[sequence:'term_category_classification_id_seq']
		version false
	}
}
