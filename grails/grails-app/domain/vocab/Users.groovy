package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Users implements Serializable {

	String usename
	String datname
	Long count

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append usename
		builder.append datname
		builder.append count
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append usename, other.usename
		builder.append datname, other.datname
		builder.append count, other.count
		builder.isEquals()
	}

	static mapping = {
		id composite: ["usename", "datname", "count"]
		version false
	}

	static constraints = {
		usename nullable: true
		datname nullable: true
		count nullable: true
	}
}
