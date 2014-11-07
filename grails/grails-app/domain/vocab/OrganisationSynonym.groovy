package vocab

class OrganisationSynonym {

	String name
	Organisation organisation

	// static belongsTo = [Organisation]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		name nullable: true, maxSize: 110
	}
}
