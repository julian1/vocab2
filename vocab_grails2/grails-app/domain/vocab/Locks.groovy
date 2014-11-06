package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Locks implements Serializable {

	String database
	String schema
	String relation
	String usename
	String duration
	String bduration
	String locktype
	String virtualxid
	Serializable transactionid
	Integer pid
	String mode
	Boolean granted

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append database
		builder.append schema
		builder.append relation
		builder.append usename
		builder.append duration
		builder.append bduration
		builder.append locktype
		builder.append virtualxid
		builder.append transactionid
		builder.append pid
		builder.append mode
		builder.append granted
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append database, other.database
		builder.append schema, other.schema
		builder.append relation, other.relation
		builder.append usename, other.usename
		builder.append duration, other.duration
		builder.append bduration, other.bduration
		builder.append locktype, other.locktype
		builder.append virtualxid, other.virtualxid
		builder.append transactionid, other.transactionid
		builder.append pid, other.pid
		builder.append mode, other.mode
		builder.append granted, other.granted
		builder.isEquals()
	}

	static mapping = {
		id composite: ["database", "schema", "relation", "usename", "duration", "bduration", "locktype", "virtualxid", "transactionid", "pid", "mode", "granted"]
		version false
	}

	static constraints = {
		database nullable: true
		schema nullable: true
		relation nullable: true
		usename nullable: true
		duration nullable: true
		bduration nullable: true
		locktype nullable: true
		virtualxid nullable: true
		transactionid nullable: true
		pid nullable: true
		mode nullable: true
		granted nullable: true
	}
}
