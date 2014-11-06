package vocab

class Organisation {

	String name
	String description
	String acronym
	String address
	String status
	String notes

	static hasMany = [organisationSynonyms: OrganisationSynonym,
	                  referenceSources: ReferenceSource,
	                  responsibleParties: ResponsibleParty]

	static mapping = {

		id generator:'sequence', params:[sequence:'organisation_id_seq']
		//id generator: "assigned"
		version false
	}

	static constraints = {
		name nullable: true, maxSize: 110
		description nullable: true, maxSize: 1000
		acronym nullable: true, maxSize: 10
		address nullable: true, maxSize: 110
		status nullable: true, maxSize: 10
		notes nullable: true, maxSize: 1010
	}
}
