package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class UnitView implements Serializable {

	Integer id
	String name
	String shortName
	String definition
	Date dateAdded

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append id
		builder.append name
		builder.append shortName
		builder.append definition
		builder.append dateAdded
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append id, other.id
		builder.append name, other.name
		builder.append shortName, other.shortName
		builder.append definition, other.definition
		builder.append dateAdded, other.dateAdded
		builder.isEquals()
	}

	static mapping = {
		id composite: ["id", "name", "shortName", "definition", "dateAdded"]
		version false
	}

	static constraints = {
		id nullable: true
		name nullable: true, maxSize: 110
		shortName nullable: true, maxSize: 110
		definition nullable: true, maxSize: 4000
		dateAdded nullable: true
	}
}
