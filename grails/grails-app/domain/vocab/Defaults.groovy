package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Defaults implements Serializable {

	String schema
	Character kind
	Serializable defaultacl

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append kind
		builder.append defaultacl
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append kind, other.kind
		builder.append defaultacl, other.defaultacl
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "kind", "defaultacl"]
		version false
	}

	static constraints = {
		schema nullable: true
		kind nullable: true, maxSize: 1
		defaultacl nullable: true
	}
}
