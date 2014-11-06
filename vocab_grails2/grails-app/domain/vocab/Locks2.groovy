package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Locks2 implements Serializable {

	Integer blockedPid
	String blockedUser
	Integer blockingPid
	String blockingUser
	String blockedStatement

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append blockedPid
		builder.append blockedUser
		builder.append blockingPid
		builder.append blockingUser
		builder.append blockedStatement
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append blockedPid, other.blockedPid
		builder.append blockedUser, other.blockedUser
		builder.append blockingPid, other.blockingPid
		builder.append blockingUser, other.blockingUser
		builder.append blockedStatement, other.blockedStatement
		builder.isEquals()
	}

	static mapping = {
		id composite: ["blockedPid", "blockedUser", "blockingPid", "blockingUser", "blockedStatement"]
		version false
	}

	static constraints = {
		blockedPid nullable: true
		blockedUser nullable: true
		blockingPid nullable: true
		blockingUser nullable: true
		blockedStatement nullable: true
	}
}
