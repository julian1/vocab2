package vocab

class TermCategoryClassification {

	ClassificationSchemeCategory classificationSchemeCategory
	VocabularyTerm vocabularyTerm

	static belongsTo = [ClassificationSchemeCategory, VocabularyTerm]

	static mapping = {
		id generator: "assigned"
		version false
	}
}
