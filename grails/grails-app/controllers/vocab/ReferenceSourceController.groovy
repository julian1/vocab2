package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReferenceSourceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ReferenceSource.list(params), model:[referenceSourceInstanceCount: ReferenceSource.count()]
    }

    def show(ReferenceSource referenceSourceInstance) {
        respond referenceSourceInstance
    }

    def create() {
        respond new ReferenceSource(params)
    }

    @Transactional
    def save(ReferenceSource referenceSourceInstance) {
        if (referenceSourceInstance == null) {
            notFound()
            return
        }

        if (referenceSourceInstance.hasErrors()) {
            respond referenceSourceInstance.errors, view:'create'
            return
        }

        referenceSourceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'referenceSource.label', default: 'ReferenceSource'), referenceSourceInstance.id])
                redirect referenceSourceInstance
            }
            '*' { respond referenceSourceInstance, [status: CREATED] }
        }
    }

    def edit(ReferenceSource referenceSourceInstance) {
        respond referenceSourceInstance
    }

    @Transactional
    def update(ReferenceSource referenceSourceInstance) {
        if (referenceSourceInstance == null) {
            notFound()
            return
        }

        if (referenceSourceInstance.hasErrors()) {
            respond referenceSourceInstance.errors, view:'edit'
            return
        }

        referenceSourceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ReferenceSource.label', default: 'ReferenceSource'), referenceSourceInstance.id])
                redirect referenceSourceInstance
            }
            '*'{ respond referenceSourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ReferenceSource referenceSourceInstance) {

        if (referenceSourceInstance == null) {
            notFound()
            return
        }

        referenceSourceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ReferenceSource.label', default: 'ReferenceSource'), referenceSourceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'referenceSource.label', default: 'ReferenceSource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
