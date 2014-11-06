package vocab

class ClassificationSchemeAssociation {

// classification_scheme_category_id        | integer | 
// parent_classification_scheme_category_id | integer | 


	ClassificationSchemeCategory classificationSchemeCategory
	ClassificationSchemeCategory parentClassificationSchemeCategory

	static belongsTo = [ClassificationSchemeCategory]

	static mapping = {
		id generator: "assigned"
		version false
	}
}
