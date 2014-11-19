package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ExternalAssociatedTermsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ExternalAssociatedTerms.list(params), model:[externalAssociatedTermsInstanceCount: ExternalAssociatedTerms.count()]
    }

    def show(ExternalAssociatedTerms externalAssociatedTermsInstance) {
        respond externalAssociatedTermsInstance
    }

    def create() {
        respond new ExternalAssociatedTerms(params)
    }

    @Transactional
    def save(ExternalAssociatedTerms externalAssociatedTermsInstance) {
        if (externalAssociatedTermsInstance == null) {
            notFound()
            return
        }

        if (externalAssociatedTermsInstance.hasErrors()) {
            respond externalAssociatedTermsInstance.errors, view:'create'
            return
        }

        externalAssociatedTermsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'externalAssociatedTerms.label', default: 'ExternalAssociatedTerms'), externalAssociatedTermsInstance.id])
                redirect externalAssociatedTermsInstance
            }
            '*' { respond externalAssociatedTermsInstance, [status: CREATED] }
        }
    }

    def edit(ExternalAssociatedTerms externalAssociatedTermsInstance) {
        respond externalAssociatedTermsInstance
    }

    @Transactional
    def update(ExternalAssociatedTerms externalAssociatedTermsInstance) {
        if (externalAssociatedTermsInstance == null) {
            notFound()
            return
        }

        if (externalAssociatedTermsInstance.hasErrors()) {
            respond externalAssociatedTermsInstance.errors, view:'edit'
            return
        }

        externalAssociatedTermsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ExternalAssociatedTerms.label', default: 'ExternalAssociatedTerms'), externalAssociatedTermsInstance.id])
                redirect externalAssociatedTermsInstance
            }
            '*'{ respond externalAssociatedTermsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ExternalAssociatedTerms externalAssociatedTermsInstance) {

        if (externalAssociatedTermsInstance == null) {
            notFound()
            return
        }

        externalAssociatedTermsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ExternalAssociatedTerms.label', default: 'ExternalAssociatedTerms'), externalAssociatedTermsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'externalAssociatedTerms.label', default: 'ExternalAssociatedTerms'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
