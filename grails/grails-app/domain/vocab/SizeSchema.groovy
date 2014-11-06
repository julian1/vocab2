package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class SizeSchema implements Serializable {

	String schema
	String size

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append size
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append size, other.size
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "size"]
		version false
	}

	static constraints = {
		schema nullable: true
		size nullable: true
	}
}
