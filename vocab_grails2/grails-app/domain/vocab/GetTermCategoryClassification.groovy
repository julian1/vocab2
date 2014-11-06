package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class GetTermCategoryClassification implements Serializable {

	String uid
	String name
	String categoryName
	String categoryLabel
	Date dateAdded

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append uid
		builder.append name
		builder.append categoryName
		builder.append categoryLabel
		builder.append dateAdded
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append uid, other.uid
		builder.append name, other.name
		builder.append categoryName, other.categoryName
		builder.append categoryLabel, other.categoryLabel
		builder.append dateAdded, other.dateAdded
		builder.isEquals()
	}

	static mapping = {
		id composite: ["uid", "name", "categoryName", "categoryLabel", "dateAdded"]
		version false
	}

	static constraints = {
		uid nullable: true
		name nullable: true
		categoryName nullable: true
		categoryLabel nullable: true
		dateAdded nullable: true
	}
}
