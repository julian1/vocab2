package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class SchemaMetadata implements Serializable {

	String relation
	String field
	String type
	String notnull
	String default_
	String constraint
	String comment

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append relation
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
		builder.append relation, other.relation
		builder.append field, other.field
		builder.append type, other.type
		builder.append notnull, other.notnull
		builder.append default_, other.default_
		builder.append constraint, other.constraint
		builder.append comment, other.comment
		builder.isEquals()
	}

	static mapping = {
		id composite: ["relation", "field", "type", "notnull", "default_", "constraint", "comment"]
		version false
	}

	static constraints = {
		relation nullable: true
		field nullable: true
		type nullable: true
		notnull nullable: true
		default_ nullable: true
		constraint nullable: true
		comment nullable: true
	}
}
