package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Config implements Serializable {

	String database
	String role
	Serializable config

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append database
		builder.append role
		builder.append config
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append database, other.database
		builder.append role, other.role
		builder.append config, other.config
		builder.isEquals()
	}

	static mapping = {
		id composite: ["database", "role", "config"]
		version false
	}

	static constraints = {
		database nullable: true
		role nullable: true
		config nullable: true
	}
}
