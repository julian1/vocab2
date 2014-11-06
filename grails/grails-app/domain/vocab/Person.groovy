package vocab

class Person {

	String name
	String salutation
	String alternatePersonNameExpression
	String email
	String contactPhoneNumber
	String contactMobileNumber

	static hasMany = [responsibleParties: ResponsibleParty,
	                  vocabularyTerms: VocabularyTerm]

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		name nullable: true, maxSize: 110
		salutation nullable: true, maxSize: 6
		alternatePersonNameExpression nullable: true, maxSize: 110
		email nullable: true, maxSize: 110
		contactPhoneNumber nullable: true, maxSize: 20
		contactMobileNumber nullable: true, maxSize: 20
	}
}
