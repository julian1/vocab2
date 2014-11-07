package vocab

class ReferenceSource {

	String citationString
	String onlineReferenceResource
	String onlineTermResource
	Organisation organisation

	static hasMany = [vocabularyTerms: VocabularyTerm]

	// static belongsTo = [Organisation]

	static mapping = {
		id generator:'sequence', params:[sequence:'reference_source_id_seq']
		version false
	}

	static constraints = {
		citationString nullable: true, maxSize: 110
		onlineReferenceResource nullable: true, maxSize: 200
		onlineTermResource nullable: true, maxSize: 110
	}
}
