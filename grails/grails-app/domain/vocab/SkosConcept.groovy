package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class SkosConcept implements Serializable {

	String subject
	String rdfType
	String skosPreflabel
	String skosDefinition
	Date dctermsIssued
	Date dctermsCreated
	String dcSource
	String dcPublisher

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append subject
		builder.append rdfType
		builder.append skosPreflabel
		builder.append skosDefinition
		builder.append dctermsIssued
		builder.append dctermsCreated
		builder.append dcSource
		builder.append dcPublisher
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append subject, other.subject
		builder.append rdfType, other.rdfType
		builder.append skosPreflabel, other.skosPreflabel
		builder.append skosDefinition, other.skosDefinition
		builder.append dctermsIssued, other.dctermsIssued
		builder.append dctermsCreated, other.dctermsCreated
		builder.append dcSource, other.dcSource
		builder.append dcPublisher, other.dcPublisher
		builder.isEquals()
	}

	static mapping = {
		id composite: ["subject", "rdfType", "skosPreflabel", "skosDefinition", "dctermsIssued", "dctermsCreated", "dcSource", "dcPublisher"]
		version false
	}

	static constraints = {
		subject nullable: true
		rdfType nullable: true
		skosPreflabel nullable: true
		skosDefinition nullable: true
		dctermsIssued nullable: true
		dctermsCreated nullable: true
		dcSource nullable: true
		dcPublisher nullable: true
	}
}
