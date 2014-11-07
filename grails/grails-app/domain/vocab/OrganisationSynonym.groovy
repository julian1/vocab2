package vocab

class OrganisationSynonym {

	String name
	Organisation organisation

	// static belongsTo = [Organisation]

	static mapping = {
		id generator:'sequence', params:[sequence:'organisation_synonym_id_seq']
		version false
	}

	static constraints = {
		name nullable: true, maxSize: 110
	}
}
