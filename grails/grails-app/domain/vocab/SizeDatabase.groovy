package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class SizeDatabase implements Serializable {

	String datname
	String size

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append datname
		builder.append size
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append datname, other.datname
		builder.append size, other.size
		builder.isEquals()
	}

	static mapping = {
		id composite: ["datname", "size"]
		version false
	}

	static constraints = {
		datname nullable: true
		size nullable: true
	}
}
