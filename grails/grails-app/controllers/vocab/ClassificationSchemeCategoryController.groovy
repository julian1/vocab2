package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClassificationSchemeCategoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClassificationSchemeCategory.list(params), model:[classificationSchemeCategoryInstanceCount: ClassificationSchemeCategory.count()]
    }

    def show(ClassificationSchemeCategory classificationSchemeCategoryInstance) {
        respond classificationSchemeCategoryInstance
    }

    def create() {
        respond new ClassificationSchemeCategory(params)
    }

    @Transactional
    def save(ClassificationSchemeCategory classificationSchemeCategoryInstance) {
        if (classificationSchemeCategoryInstance == null) {
            notFound()
            return
        }

        if (classificationSchemeCategoryInstance.hasErrors()) {
            respond classificationSchemeCategoryInstance.errors, view:'create'
            return
        }

        classificationSchemeCategoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'classificationSchemeCategory.label', default: 'ClassificationSchemeCategory'), classificationSchemeCategoryInstance.id])
                redirect classificationSchemeCategoryInstance
            }
            '*' { respond classificationSchemeCategoryInstance, [status: CREATED] }
        }
    }

    def edit(ClassificationSchemeCategory classificationSchemeCategoryInstance) {
        respond classificationSchemeCategoryInstance
    }

    @Transactional
    def update(ClassificationSchemeCategory classificationSchemeCategoryInstance) {
        if (classificationSchemeCategoryInstance == null) {
            notFound()
            return
        }

        if (classificationSchemeCategoryInstance.hasErrors()) {
            respond classificationSchemeCategoryInstance.errors, view:'edit'
            return
        }

        classificationSchemeCategoryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ClassificationSchemeCategory.label', default: 'ClassificationSchemeCategory'), classificationSchemeCategoryInstance.id])
                redirect classificationSchemeCategoryInstance
            }
            '*'{ respond classificationSchemeCategoryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ClassificationSchemeCategory classificationSchemeCategoryInstance) {

        if (classificationSchemeCategoryInstance == null) {
            notFound()
            return
        }

        classificationSchemeCategoryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ClassificationSchemeCategory.label', default: 'ClassificationSchemeCategory'), classificationSchemeCategoryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificationSchemeCategory.label', default: 'ClassificationSchemeCategory'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
