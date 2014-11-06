package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Locks3 implements Serializable {

	Integer blockedPid
	String blockedUser
	String blockingStatement
	Serializable blockingDuration
	Integer blockingPid
	String blockingUser
	String blockedStatement
	Serializable blockedDuration

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append blockedPid
		builder.append blockedUser
		builder.append blockingStatement
		builder.append blockingDuration
		builder.append blockingPid
		builder.append blockingUser
		builder.append blockedStatement
		builder.append blockedDuration
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append blockedPid, other.blockedPid
		builder.append blockedUser, other.blockedUser
		builder.append blockingStatement, other.blockingStatement
		builder.append blockingDuration, other.blockingDuration
		builder.append blockingPid, other.blockingPid
		builder.append blockingUser, other.blockingUser
		builder.append blockedStatement, other.blockedStatement
		builder.append blockedDuration, other.blockedDuration
		builder.isEquals()
	}

	static mapping = {
		id composite: ["blockedPid", "blockedUser", "blockingStatement", "blockingDuration", "blockingPid", "blockingUser", "blockedStatement", "blockedDuration"]
		version false
	}

	static constraints = {
		blockedPid nullable: true
		blockedUser nullable: true
		blockingStatement nullable: true
		blockingDuration nullable: true
		blockingPid nullable: true
		blockingUser nullable: true
		blockedStatement nullable: true
		blockedDuration nullable: true
	}
}
