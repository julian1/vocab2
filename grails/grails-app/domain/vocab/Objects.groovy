package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Objects implements Serializable {

	String schema
	Character kind
	String name
	Long oid
	String owner
	Serializable acl

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append kind
		builder.append name
		builder.append oid
		builder.append owner
		builder.append acl
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append kind, other.kind
		builder.append name, other.name
		builder.append oid, other.oid
		builder.append owner, other.owner
		builder.append acl, other.acl
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "kind", "name", "oid", "owner", "acl"]
		version false
	}

	static constraints = {
		schema nullable: true
		kind nullable: true, maxSize: 1
		name nullable: true
		oid nullable: true
		owner nullable: true
		acl nullable: true
	}
}
