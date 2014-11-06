package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Locks4 implements Serializable {

	String mode
	String locktype
	String duration
	String usename
	String datname
	Integer pid
	String query

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append mode
		builder.append locktype
		builder.append duration
		builder.append usename
		builder.append datname
		builder.append pid
		builder.append query
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append mode, other.mode
		builder.append locktype, other.locktype
		builder.append duration, other.duration
		builder.append usename, other.usename
		builder.append datname, other.datname
		builder.append pid, other.pid
		builder.append query, other.query
		builder.isEquals()
	}

	static mapping = {
		id composite: ["mode", "locktype", "duration", "usename", "datname", "pid", "query"]
		version false
	}

	static constraints = {
		mode nullable: true
		locktype nullable: true
		duration nullable: true
		usename nullable: true
		datname nullable: true
		pid nullable: true
		query nullable: true
	}
}
