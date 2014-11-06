package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Membership implements Serializable {

	String role
	String parent
	String grantor

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append role
		builder.append parent
		builder.append grantor
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append role, other.role
		builder.append parent, other.parent
		builder.append grantor, other.grantor
		builder.isEquals()
	}

	static mapping = {
		id composite: ["role", "parent", "grantor"]
		version false
	}

	static constraints = {
		role nullable: true
		parent nullable: true
		grantor nullable: true
	}
}
