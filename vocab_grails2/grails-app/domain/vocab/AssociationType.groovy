package vocab

class AssociationType {

	String name
	String description

	static hasMany = [externalAssociatedTermses: ExternalAssociatedTerms,
	                  internalAssociatedTermses: InternalAssociatedTerms]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		name maxSize: 20
		description nullable: true, maxSize: 1010
	}
}
