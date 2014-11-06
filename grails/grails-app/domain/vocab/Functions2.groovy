package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Functions2 implements Serializable {

	String schema
	String name
	String src

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append schema
		builder.append name
		builder.append src
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append schema, other.schema
		builder.append name, other.name
		builder.append src, other.src
		builder.isEquals()
	}

	static mapping = {
		id composite: ["schema", "name", "src"]
		version false
	}

	static constraints = {
		schema nullable: true
		name nullable: true
		src nullable: true
	}
}
