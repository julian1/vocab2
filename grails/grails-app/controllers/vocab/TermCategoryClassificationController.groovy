package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TermCategoryClassificationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TermCategoryClassification.list(params), model:[termCategoryClassificationInstanceCount: TermCategoryClassification.count()]
    }

    def show(TermCategoryClassification termCategoryClassificationInstance) {
        respond termCategoryClassificationInstance
    }

    def create() {
        respond new TermCategoryClassification(params)
    }

    @Transactional
    def save(TermCategoryClassification termCategoryClassificationInstance) {
        if (termCategoryClassificationInstance == null) {
            notFound()
            return
        }

        if (termCategoryClassificationInstance.hasErrors()) {
            respond termCategoryClassificationInstance.errors, view:'create'
            return
        }

        termCategoryClassificationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'termCategoryClassification.label', default: 'TermCategoryClassification'), termCategoryClassificationInstance.id])
                redirect termCategoryClassificationInstance
            }
            '*' { respond termCategoryClassificationInstance, [status: CREATED] }
        }
    }

    def edit(TermCategoryClassification termCategoryClassificationInstance) {
        respond termCategoryClassificationInstance
    }

    @Transactional
    def update(TermCategoryClassification termCategoryClassificationInstance) {
        if (termCategoryClassificationInstance == null) {
            notFound()
            return
        }

        if (termCategoryClassificationInstance.hasErrors()) {
            respond termCategoryClassificationInstance.errors, view:'edit'
            return
        }

        termCategoryClassificationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TermCategoryClassification.label', default: 'TermCategoryClassification'), termCategoryClassificationInstance.id])
                redirect termCategoryClassificationInstance
            }
            '*'{ respond termCategoryClassificationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TermCategoryClassification termCategoryClassificationInstance) {

        if (termCategoryClassificationInstance == null) {
            notFound()
            return
        }

        termCategoryClassificationInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TermCategoryClassification.label', default: 'TermCategoryClassification'), termCategoryClassificationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'termCategoryClassification.label', default: 'TermCategoryClassification'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
