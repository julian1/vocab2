package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class TermClassificationSchemeCategory implements Serializable {

	Integer vocabularyTermId
	Integer classificationSchemeCategoryId

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append vocabularyTermId
		builder.append classificationSchemeCategoryId
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append vocabularyTermId, other.vocabularyTermId
		builder.append classificationSchemeCategoryId, other.classificationSchemeCategoryId
		builder.isEquals()
	}

	static mapping = {
		id composite: ["vocabularyTermId", "classificationSchemeCategoryId"]
		version false
	}

	static constraints = {
		vocabularyTermId nullable: true
		classificationSchemeCategoryId nullable: true
	}
}
