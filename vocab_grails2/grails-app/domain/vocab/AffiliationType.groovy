package vocab

class AffiliationType {

	String name
	String description

	static hasMany = [responsibleParties: ResponsibleParty]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		name maxSize: 20
		description nullable: true, maxSize: 110
	}
}
