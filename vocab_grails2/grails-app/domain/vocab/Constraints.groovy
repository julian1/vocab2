package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Constraints implements Serializable {

	String schema
	String relation
	String name

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append relation
		builder.append name
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append relation, other.relation
		builder.append name, other.name
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "relation", "name"]
		version false
	}

	static constraints = {
		schema nullable: true
		relation nullable: true
		name nullable: true
	}
}
