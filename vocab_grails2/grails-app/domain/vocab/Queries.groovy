package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Queries implements Serializable {

	String BDuration
	String QDuration
	Integer pid
	String role
	String database
	String query

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append BDuration
		builder.append QDuration
		builder.append pid
		builder.append role
		builder.append database
		builder.append query
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append BDuration, other.BDuration
		builder.append QDuration, other.QDuration
		builder.append pid, other.pid
		builder.append role, other.role
		builder.append database, other.database
		builder.append query, other.query
		builder.isEquals()
	}

	static mapping = {
		id composite: ["BDuration", "QDuration", "pid", "role", "database", "query"]
		version false
	}

	static constraints = {
//		BDuration nullable: true
//		QDuration nullable: true
		pid nullable: true
		role nullable: true
		database nullable: true
		query nullable: true
	}
}
