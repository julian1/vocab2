package vocab

class ClassificationSchemeAssociation {

	ClassificationSchemeCategory classificationSchemeCategory
	ClassificationSchemeCategory parentClassificationSchemeCategory

	// static belongsTo = [ClassificationSchemeCategory]

	static mapping = {
 		id generator:'sequence', params:[sequence:'classification_scheme_association_id_seq']
		version false
	}
}
