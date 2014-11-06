package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Defaults2 implements Serializable {

	String schema
	Character kind
	String privilege
	String grantor
	String grantee

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append kind
		builder.append privilege
		builder.append grantor
		builder.append grantee
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append kind, other.kind
		builder.append privilege, other.privilege
		builder.append grantor, other.grantor
		builder.append grantee, other.grantee
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "kind", "privilege", "grantor", "grantee"]
		version false
	}

	static constraints = {
		schema nullable: true
		kind nullable: true, maxSize: 1
		privilege nullable: true
		grantor nullable: true
		grantee nullable: true
	}
}
