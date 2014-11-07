package vocab

class ClassificationScheme {

	String name
	String description
	String title
	Date dateAdded
	ResponsibleParty responsibleParty

	static hasMany = [classificationSchemeCategories: ClassificationSchemeCategory]

	// static belongsTo = [ResponsibleParty]

	static mapping = {
		id generator:'sequence', params:[sequence:'classification_scheme_seq']
		version false
	}

	static constraints = {
		name nullable: true, maxSize: 1010
		description nullable: true, maxSize: 1010
		title nullable: true, maxSize: 1010
		dateAdded nullable: true
	}
}
