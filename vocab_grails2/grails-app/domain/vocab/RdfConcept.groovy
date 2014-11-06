package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class RdfConcept implements Serializable {

	String subject
	String predicate
	String object

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append subject
		builder.append predicate
		builder.append object
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append subject, other.subject
		builder.append predicate, other.predicate
		builder.append object, other.object
		builder.isEquals()
	}

	static mapping = {
		id composite: ["subject", "predicate", "object"]
		version false
	}

	static constraints = {
		subject nullable: true
		predicate nullable: true
		object nullable: true
	}
}
