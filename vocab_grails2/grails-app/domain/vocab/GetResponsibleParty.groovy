package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class GetResponsibleParty implements Serializable {

	String personName
	String organisationAcronym
	String affiliationTypeName

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append personName
		builder.append organisationAcronym
		builder.append affiliationTypeName
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append personName, other.personName
		builder.append organisationAcronym, other.organisationAcronym
		builder.append affiliationTypeName, other.affiliationTypeName
		builder.isEquals()
	}

	static mapping = {
		id composite: ["personName", "organisationAcronym", "affiliationTypeName"]
		version false
	}

	static constraints = {
		personName nullable: true, maxSize: 110
		organisationAcronym nullable: true, maxSize: 10
		affiliationTypeName nullable: true, maxSize: 20
	}
}
