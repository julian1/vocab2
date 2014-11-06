package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Databasechangelog implements Serializable {

	String id
	String author
	String filename
	Date dateexecuted
	Integer orderexecuted
	String exectype
	String md5sum
	String description
	String comments
	String tag
	String liquibase

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append id
		builder.append author
		builder.append filename
		builder.append dateexecuted
		builder.append orderexecuted
		builder.append exectype
		builder.append md5sum
		builder.append description
		builder.append comments
		builder.append tag
		builder.append liquibase
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append id, other.id
		builder.append author, other.author
		builder.append filename, other.filename
		builder.append dateexecuted, other.dateexecuted
		builder.append orderexecuted, other.orderexecuted
		builder.append exectype, other.exectype
		builder.append md5sum, other.md5sum
		builder.append description, other.description
		builder.append comments, other.comments
		builder.append tag, other.tag
		builder.append liquibase, other.liquibase
		builder.isEquals()
	}

	static mapping = {
		id composite: ["id", "author", "filename", "dateexecuted", "orderexecuted", "exectype", "md5sum", "description", "comments", "tag", "liquibase"]
		version false
	}

	static constraints = {
		exectype maxSize: 10
		md5sum nullable: true, maxSize: 35
		description nullable: true
		comments nullable: true
		tag nullable: true
		liquibase nullable: true, maxSize: 20
	}
}
