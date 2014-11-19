package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrganisationSynonymController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond OrganisationSynonym.list(params), model:[organisationSynonymInstanceCount: OrganisationSynonym.count()]
    }

    def show(OrganisationSynonym organisationSynonymInstance) {
        respond organisationSynonymInstance
    }

    def create() {
        respond new OrganisationSynonym(params)
    }

    @Transactional
    def save(OrganisationSynonym organisationSynonymInstance) {
        if (organisationSynonymInstance == null) {
            notFound()
            return
        }

        if (organisationSynonymInstance.hasErrors()) {
            respond organisationSynonymInstance.errors, view:'create'
            return
        }

        organisationSynonymInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'organisationSynonym.label', default: 'OrganisationSynonym'), organisationSynonymInstance.id])
                redirect organisationSynonymInstance
            }
            '*' { respond organisationSynonymInstance, [status: CREATED] }
        }
    }

    def edit(OrganisationSynonym organisationSynonymInstance) {
        respond organisationSynonymInstance
    }

    @Transactional
    def update(OrganisationSynonym organisationSynonymInstance) {
        if (organisationSynonymInstance == null) {
            notFound()
            return
        }

        if (organisationSynonymInstance.hasErrors()) {
            respond organisationSynonymInstance.errors, view:'edit'
            return
        }

        organisationSynonymInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OrganisationSynonym.label', default: 'OrganisationSynonym'), organisationSynonymInstance.id])
                redirect organisationSynonymInstance
            }
            '*'{ respond organisationSynonymInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OrganisationSynonym organisationSynonymInstance) {

        if (organisationSynonymInstance == null) {
            notFound()
            return
        }

        organisationSynonymInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OrganisationSynonym.label', default: 'OrganisationSynonym'), organisationSynonymInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'organisationSynonym.label', default: 'OrganisationSynonym'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
