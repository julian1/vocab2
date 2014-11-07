package vocab

class AffiliationType {

	String name
	String description

	static hasMany = [responsibleParties: ResponsibleParty]

	static mapping = {
		id generator:'sequence', params:[sequence:'affiliation_type_id_seq']
		version false
	}

	static constraints = {
		name maxSize: 20
		description nullable: true, maxSize: 110
	}
}
