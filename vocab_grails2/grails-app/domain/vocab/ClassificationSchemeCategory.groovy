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
	static belongsTo = [ClassificationScheme]

	// TODO you have multiple hasMany references for class(es) [ClassificationSchemeAssociation] 
	//      so you'll need to disambiguate them with the 'mappedBy' property:
	static mappedBy = [ classificationSchemeCategorys: "classificationSchemeCategory",
	                  parentClassificationSchemeCategorys: "parentClassificationSchemeCategory"]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		name nullable: true, maxSize: 1010
		description nullable: true, maxSize: 1010
		label nullable: true, maxSize: 1010
		dateAdded nullable: true
	}
}
