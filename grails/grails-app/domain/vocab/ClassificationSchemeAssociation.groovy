package vocab

class ClassificationSchemeAssociation {

	ClassificationSchemeCategory classificationSchemeCategory
	ClassificationSchemeCategory parentClassificationSchemeCategory

	// static belongsTo = [ClassificationSchemeCategory]

	static mapping = {
		id generator: "assigned"
		version false
	}
}
