package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Xmins implements Serializable {

	String schema
	String name
	Integer xmin

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append name
		builder.append xmin
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append name, other.name
		builder.append xmin, other.xmin
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "name", "xmin"]
		version false
	}

	static constraints = {
		schema nullable: true
		name nullable: true
		xmin nullable: true
	}
}
