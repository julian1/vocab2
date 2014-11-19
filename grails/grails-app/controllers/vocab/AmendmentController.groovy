package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AmendmentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Amendment.list(params), model:[amendmentInstanceCount: Amendment.count()]
    }

    def show(Amendment amendmentInstance) {
        respond amendmentInstance
    }

    def create() {
        respond new Amendment(params)
    }

    @Transactional
    def save(Amendment amendmentInstance) {
        if (amendmentInstance == null) {
            notFound()
            return
        }

        if (amendmentInstance.hasErrors()) {
            respond amendmentInstance.errors, view:'create'
            return
        }

        amendmentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'amendment.label', default: 'Amendment'), amendmentInstance.id])
                redirect amendmentInstance
            }
            '*' { respond amendmentInstance, [status: CREATED] }
        }
    }

    def edit(Amendment amendmentInstance) {
        respond amendmentInstance
    }

    @Transactional
    def update(Amendment amendmentInstance) {
        if (amendmentInstance == null) {
            notFound()
            return
        }

        if (amendmentInstance.hasErrors()) {
            respond amendmentInstance.errors, view:'edit'
            return
        }

        amendmentInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Amendment.label', default: 'Amendment'), amendmentInstance.id])
                redirect amendmentInstance
            }
            '*'{ respond amendmentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Amendment amendmentInstance) {

        if (amendmentInstance == null) {
            notFound()
            return
        }

        amendmentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Amendment.label', default: 'Amendment'), amendmentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'amendment.label', default: 'Amendment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
