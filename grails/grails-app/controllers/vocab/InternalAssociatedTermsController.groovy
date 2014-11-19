package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class InternalAssociatedTermsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond InternalAssociatedTerms.list(params), model:[internalAssociatedTermsInstanceCount: InternalAssociatedTerms.count()]
    }

    def show(InternalAssociatedTerms internalAssociatedTermsInstance) {
        respond internalAssociatedTermsInstance
    }

    def create() {
        respond new InternalAssociatedTerms(params)
    }

    @Transactional
    def save(InternalAssociatedTerms internalAssociatedTermsInstance) {
        if (internalAssociatedTermsInstance == null) {
            notFound()
            return
        }

        if (internalAssociatedTermsInstance.hasErrors()) {
            respond internalAssociatedTermsInstance.errors, view:'create'
            return
        }

        internalAssociatedTermsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'internalAssociatedTerms.label', default: 'InternalAssociatedTerms'), internalAssociatedTermsInstance.id])
                redirect internalAssociatedTermsInstance
            }
            '*' { respond internalAssociatedTermsInstance, [status: CREATED] }
        }
    }

    def edit(InternalAssociatedTerms internalAssociatedTermsInstance) {
        respond internalAssociatedTermsInstance
    }

    @Transactional
    def update(InternalAssociatedTerms internalAssociatedTermsInstance) {
        if (internalAssociatedTermsInstance == null) {
            notFound()
            return
        }

        if (internalAssociatedTermsInstance.hasErrors()) {
            respond internalAssociatedTermsInstance.errors, view:'edit'
            return
        }

        internalAssociatedTermsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'InternalAssociatedTerms.label', default: 'InternalAssociatedTerms'), internalAssociatedTermsInstance.id])
                redirect internalAssociatedTermsInstance
            }
            '*'{ respond internalAssociatedTermsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(InternalAssociatedTerms internalAssociatedTermsInstance) {

        if (internalAssociatedTermsInstance == null) {
            notFound()
            return
        }

        internalAssociatedTermsInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'InternalAssociatedTerms.label', default: 'InternalAssociatedTerms'), internalAssociatedTermsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'internalAssociatedTerms.label', default: 'InternalAssociatedTerms'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
