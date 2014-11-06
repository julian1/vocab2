package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class GetClassificationSchemeAssociation implements Serializable {

	String uid
	String label
	String parentUid
	String parentLabel

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append uid
		builder.append label
		builder.append parentUid
		builder.append parentLabel
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append uid, other.uid
		builder.append label, other.label
		builder.append parentUid, other.parentUid
		builder.append parentLabel, other.parentLabel
		builder.isEquals()
	}

	static mapping = {
		id composite: ["uid", "label", "parentUid", "parentLabel"]
		version false
	}

	static constraints = {
		uid nullable: true
		label nullable: true
		parentUid nullable: true
		parentLabel nullable: true
	}
}
