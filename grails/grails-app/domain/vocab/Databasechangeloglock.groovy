package vocab

class Databasechangeloglock {

	Boolean locked
	Date lockgranted
	String lockedby

	static mapping = {
		id generator: "assigned"
		version false
	}

	static constraints = {
		lockgranted nullable: true
		lockedby nullable: true
	}
}
