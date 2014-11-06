package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class GetUid implements Serializable {

	String relation
	String field
	String uid

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append relation
		builder.append field
		builder.append uid
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append relation, other.relation
		builder.append field, other.field
		builder.append uid, other.uid
		builder.isEquals()
	}

	static mapping = {
		id composite: ["relation", "field", "uid"]
		version false
	}

	static constraints = {
		relation nullable: true
		field nullable: true
		uid nullable: true
	}
}
