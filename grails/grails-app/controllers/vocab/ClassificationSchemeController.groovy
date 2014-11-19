package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClassificationSchemeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClassificationScheme.list(params), model:[classificationSchemeInstanceCount: ClassificationScheme.count()]
    }

    def show(ClassificationScheme classificationSchemeInstance) {
        respond classificationSchemeInstance
    }

    def create() {
        respond new ClassificationScheme(params)
    }

    @Transactional
    def save(ClassificationScheme classificationSchemeInstance) {
        if (classificationSchemeInstance == null) {
            notFound()
            return
        }

        if (classificationSchemeInstance.hasErrors()) {
            respond classificationSchemeInstance.errors, view:'create'
            return
        }

        classificationSchemeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'classificationScheme.label', default: 'ClassificationScheme'), classificationSchemeInstance.id])
                redirect classificationSchemeInstance
            }
            '*' { respond classificationSchemeInstance, [status: CREATED] }
        }
    }

    def edit(ClassificationScheme classificationSchemeInstance) {
        respond classificationSchemeInstance
    }

    @Transactional
    def update(ClassificationScheme classificationSchemeInstance) {
        if (classificationSchemeInstance == null) {
            notFound()
            return
        }

        if (classificationSchemeInstance.hasErrors()) {
            respond classificationSchemeInstance.errors, view:'edit'
            return
        }

        classificationSchemeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ClassificationScheme.label', default: 'ClassificationScheme'), classificationSchemeInstance.id])
                redirect classificationSchemeInstance
            }
            '*'{ respond classificationSchemeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ClassificationScheme classificationSchemeInstance) {

        if (classificationSchemeInstance == null) {
            notFound()
            return
        }

        classificationSchemeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ClassificationScheme.label', default: 'ClassificationScheme'), classificationSchemeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificationScheme.label', default: 'ClassificationScheme'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
