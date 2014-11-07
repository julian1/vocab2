package vocab

class ClassificationSchemeCategory {

	String name
	String description
	String label
	Date dateAdded
	ClassificationScheme classificationScheme

	static hasMany = [ classificationSchemeCategorys : ClassificationSchemeAssociation,
	                  parentClassificationSchemeCategorys : ClassificationSchemeAssociation,
	                  termCategoryClassifications: TermCategoryClassification]

	// static belongsTo = [ClassificationScheme]

	static mappedBy = [ classificationSchemeCategorys: "classificationSchemeCategory",
	                  parentClassificationSchemeCategorys: "parentClassificationSchemeCategory"]

	static mapping = {
		id generator:'sequence', params:[sequence:'classification_scheme_category_seq']
		version false
	}

	static constraints = {
		name nullable: true, maxSize: 1010
		description nullable: true, maxSize: 1010
		label nullable: true, maxSize: 1010
		dateAdded nullable: true
	}
}
