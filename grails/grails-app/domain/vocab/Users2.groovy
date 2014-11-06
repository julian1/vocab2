package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Users2 implements Serializable {

	String usename
	String applicationName
	String datname
	Serializable clientAddr
	String duration
	Integer pid
	Boolean waiting

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append usename
		builder.append applicationName
		builder.append datname
		builder.append clientAddr
		builder.append duration
		builder.append pid
		builder.append waiting
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append usename, other.usename
		builder.append applicationName, other.applicationName
		builder.append datname, other.datname
		builder.append clientAddr, other.clientAddr
		builder.append duration, other.duration
		builder.append pid, other.pid
		builder.append waiting, other.waiting
		builder.isEquals()
	}

	static mapping = {
		id composite: ["usename", "applicationName", "datname", "clientAddr", "duration", "pid", "waiting"]
		version false
	}

	static constraints = {
		usename nullable: true
		applicationName nullable: true
		datname nullable: true
		clientAddr nullable: true
		duration nullable: true
		pid nullable: true
		waiting nullable: true
	}
}
