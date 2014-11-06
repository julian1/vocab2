package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class SkosConceptScheme implements Serializable {

	String subject
	String rdfType
	Date dctermsIssued
	String dcTitle
	String dcDescription
	String dcCreator
	String dcPublisher
	String dctermsHasversion

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append subject
		builder.append rdfType
		builder.append dctermsIssued
		builder.append dcTitle
		builder.append dcDescription
		builder.append dcCreator
		builder.append dcPublisher
		builder.append dctermsHasversion
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append subject, other.subject
		builder.append rdfType, other.rdfType
		builder.append dctermsIssued, other.dctermsIssued
		builder.append dcTitle, other.dcTitle
		builder.append dcDescription, other.dcDescription
		builder.append dcCreator, other.dcCreator
		builder.append dcPublisher, other.dcPublisher
		builder.append dctermsHasversion, other.dctermsHasversion
		builder.isEquals()
	}

	static mapping = {
		id composite: ["subject", "rdfType", "dctermsIssued", "dcTitle", "dcDescription", "dcCreator", "dcPublisher", "dctermsHasversion"]
		version false
	}

	static constraints = {
		subject nullable: true, maxSize: 1010
		rdfType nullable: true
		dctermsIssued nullable: true
		dcTitle nullable: true
		dcDescription nullable: true, maxSize: 1010
		dcCreator nullable: true, maxSize: 110
		dcPublisher nullable: true, maxSize: 110
		dctermsHasversion nullable: true
	}
}
