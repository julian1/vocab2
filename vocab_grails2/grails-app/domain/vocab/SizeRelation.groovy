package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class SizeRelation implements Serializable {

	String schema
	String relation
	String size

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append relation
		builder.append size
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append relation, other.relation
		builder.append size, other.size
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "relation", "size"]
		version false
	}

	static constraints = {
		schema nullable: true
		relation nullable: true
		size nullable: true
	}
}
