package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Functions implements Serializable {

	String schema
	String name
	String owner
	Long oid
	String fullname
	Serializable acl

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append name
		builder.append owner
		builder.append oid
		builder.append fullname
		builder.append acl
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append name, other.name
		builder.append owner, other.owner
		builder.append oid, other.oid
		builder.append fullname, other.fullname
		builder.append acl, other.acl
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "name", "owner", "oid", "fullname", "acl"]
		version false
	}

	static constraints = {
		schema nullable: true
		name nullable: true
		owner nullable: true
		oid nullable: true
		fullname nullable: true
		acl nullable: true
	}
}
