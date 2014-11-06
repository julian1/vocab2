package vocab

import org.apache.commons.lang.builder.EqualsBuilder
import org.apache.commons.lang.builder.HashCodeBuilder

class Locks1 implements Serializable {

	String relname
	String locktype
	Long database
	Long relation
	Integer page
	Short tuple
	String virtualxid
	Serializable transactionid
	Long classid
	Long objid
	Short objsubid
	String virtualtransaction
	Integer pid
	String mode
	Boolean granted
	Boolean fastpath

	int hashCode() {
		def builder = new HashCodeBuilder()
		builder.append relname
		builder.append locktype
		builder.append database
		builder.append relation
		builder.append page
		builder.append tuple
		builder.append virtualxid
		builder.append transactionid
		builder.append classid
		builder.append objid
		builder.append objsubid
		builder.append virtualtransaction
		builder.append pid
		builder.append mode
		builder.append granted
		builder.append fastpath
		builder.toHashCode()
	}

	boolean equals(other) {
		if (other == null) return false
		def builder = new EqualsBuilder()
		builder.append relname, other.relname
		builder.append locktype, other.locktype
		builder.append database, other.database
		builder.append relation, other.relation
		builder.append page, other.page
		builder.append tuple, other.tuple
		builder.append virtualxid, other.virtualxid
		builder.append transactionid, other.transactionid
		builder.append classid, other.classid
		builder.append objid, other.objid
		builder.append objsubid, other.objsubid
		builder.append virtualtransaction, other.virtualtransaction
		builder.append pid, other.pid
		builder.append mode, other.mode
		builder.append granted, other.granted
		builder.append fastpath, other.fastpath
		builder.isEquals()
	}

	static mapping = {
		id composite: ["relname", "locktype", "database", "relation", "page", "tuple", "virtualxid", "transactionid", "classid", "objid", "objsubid", "virtualtransaction", "pid", "mode", "granted", "fastpath"]
		version false
	}

	static constraints = {
		relname nullable: true
		locktype nullable: true
		database nullable: true
		relation nullable: true
		page nullable: true
		tuple nullable: true
		virtualxid nullable: true
		transactionid nullable: true
		classid nullable: true
		objid nullable: true
		objsubid nullable: true
		virtualtransaction nullable: true
		pid nullable: true
		mode nullable: true
		granted nullable: true
		fastpath nullable: true
	}
}
