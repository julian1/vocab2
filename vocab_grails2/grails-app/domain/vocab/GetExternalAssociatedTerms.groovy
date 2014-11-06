package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class GetExternalAssociatedTerms implements Serializable {

	String uid
	String name
	String externalUid
	String associationType

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append uid
		builder.append name
		builder.append externalUid
		builder.append associationType
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append uid, other.uid
		builder.append name, other.name
		builder.append externalUid, other.externalUid
		builder.append associationType, other.associationType
		builder.isEquals()
	}

	static mapping = {
		id composite: ["uid", "name", "externalUid", "associationType"]
		version false
	}

	static constraints = {
		uid nullable: true
		name nullable: true
		externalUid nullable: true
		associationType nullable: true
	}
}
