package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Schemas implements Serializable {

	String schema
	String owner
	Serializable acl

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append owner
		builder.append acl
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append owner, other.owner
		builder.append acl, other.acl
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "owner", "acl"]
		version false
	}

	static constraints = {
		schema nullable: true
		owner nullable: true
		acl nullable: true
	}
}
