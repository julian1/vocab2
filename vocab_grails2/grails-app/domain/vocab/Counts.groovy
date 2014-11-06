package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Counts implements Serializable {

	String schema
	String name
	Integer count

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append name
		builder.append count
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append name, other.name
		builder.append count, other.count
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "name", "count"]
		version false
	}

	static constraints = {
		schema nullable: true
		name nullable: true
		count nullable: true
	}
}
