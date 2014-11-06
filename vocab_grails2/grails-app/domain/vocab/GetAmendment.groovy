package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class GetAmendment implements Serializable {

	String uid
	String type
	Date requestDate
	Date approvalDate
	String registerName
	String personName
	String organisationAcronym

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append uid
		builder.append type
		builder.append requestDate
		builder.append approvalDate
		builder.append registerName
		builder.append personName
		builder.append organisationAcronym
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append uid, other.uid
		builder.append type, other.type
		builder.append requestDate, other.requestDate
		builder.append approvalDate, other.approvalDate
		builder.append registerName, other.registerName
		builder.append personName, other.personName
		builder.append organisationAcronym, other.organisationAcronym
		builder.isEquals()
	}

	static mapping = {
		id composite: ["uid", "type", "requestDate", "approvalDate", "registerName", "personName", "organisationAcronym"]
		version false
	}

	static constraints = {
		uid nullable: true
		type nullable: true, maxSize: 50
		requestDate nullable: true
		approvalDate nullable: true
		registerName nullable: true
		personName nullable: true, maxSize: 110
		organisationAcronym nullable: true, maxSize: 10
	}
}
