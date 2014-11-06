package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class TermClassificationScheme implements Serializable {

	Integer vocabularyTermId
	Integer classificationSchemeId

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append vocabularyTermId
		builder.append classificationSchemeId
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append vocabularyTermId, other.vocabularyTermId
		builder.append classificationSchemeId, other.classificationSchemeId
		builder.isEquals()
	}

	static mapping = {
		id composite: ["vocabularyTermId", "classificationSchemeId"]
		version false
	}

	static constraints = {
		vocabularyTermId nullable: true
		classificationSchemeId nullable: true
	}
}
