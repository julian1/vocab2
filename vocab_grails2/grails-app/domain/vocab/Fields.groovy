package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Fields implements Serializable {

	String schema
	String relation
	Character kind
	String field
	String type
	String notnull
	String default_
	String constraint
	String comment

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append relation
		builder.append kind
		builder.append field
		builder.append type
		builder.append notnull
		builder.append default_
		builder.append constraint
		builder.append comment
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append relation, other.relation
		builder.append kind, other.kind
		builder.append field, other.field
		builder.append type, other.type
		builder.append notnull, other.notnull
		builder.append default_, other.default_
		builder.append constraint, other.constraint
		builder.append comment, other.comment
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "relation", "kind", "field", "type", "notnull", "default_", "constraint", "comment"]
		version false
	}

	static constraints = {
		schema nullable: true
		relation nullable: true
		kind nullable: true, maxSize: 1
		field nullable: true
		type nullable: true
		notnull nullable: true
		default_ nullable: true
		constraint nullable: true
		comment nullable: true
	}
}
