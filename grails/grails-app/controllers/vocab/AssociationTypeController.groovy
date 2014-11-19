package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AssociationTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AssociationType.list(params), model:[associationTypeInstanceCount: AssociationType.count()]
    }

    def show(AssociationType associationTypeInstance) {
        respond associationTypeInstance
    }

    def create() {
        respond new AssociationType(params)
    }

    @Transactional
    def save(AssociationType associationTypeInstance) {
        if (associationTypeInstance == null) {
            notFound()
            return
        }

        if (associationTypeInstance.hasErrors()) {
            respond associationTypeInstance.errors, view:'create'
            return
        }

        associationTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'associationType.label', default: 'AssociationType'), associationTypeInstance.id])
                redirect associationTypeInstance
            }
            '*' { respond associationTypeInstance, [status: CREATED] }
        }
    }

    def edit(AssociationType associationTypeInstance) {
        respond associationTypeInstance
    }

    @Transactional
    def update(AssociationType associationTypeInstance) {
        if (associationTypeInstance == null) {
            notFound()
            return
        }

        if (associationTypeInstance.hasErrors()) {
            respond associationTypeInstance.errors, view:'edit'
            return
        }

        associationTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AssociationType.label', default: 'AssociationType'), associationTypeInstance.id])
                redirect associationTypeInstance
            }
            '*'{ respond associationTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AssociationType associationTypeInstance) {

        if (associationTypeInstance == null) {
            notFound()
            return
        }

        associationTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AssociationType.label', default: 'AssociationType'), associationTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'associationType.label', default: 'AssociationType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
