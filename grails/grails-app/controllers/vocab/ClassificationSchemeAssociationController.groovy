package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ClassificationSchemeAssociationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ClassificationSchemeAssociation.list(params), model:[classificationSchemeAssociationInstanceCount: ClassificationSchemeAssociation.count()]
    }

    def show(ClassificationSchemeAssociation classificationSchemeAssociationInstance) {
        respond classificationSchemeAssociationInstance
    }

    def create() {
        respond new ClassificationSchemeAssociation(params)
    }

    @Transactional
    def save(ClassificationSchemeAssociation classificationSchemeAssociationInstance) {
        if (classificationSchemeAssociationInstance == null) {
            notFound()
            return
        }

        if (classificationSchemeAssociationInstance.hasErrors()) {
            respond classificationSchemeAssociationInstance.errors, view:'create'
            return
        }

        classificationSchemeAssociationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'classificationSchemeAssociation.label', default: 'ClassificationSchemeAssociation'), classificationSchemeAssociationInstance.id])
                redirect classificationSchemeAssociationInstance
            }
            '*' { respond classificationSchemeAssociationInstance, [status: CREATED] }
        }
    }

    def edit(ClassificationSchemeAssociation classificationSchemeAssociationInstance) {
        respond classificationSchemeAssociationInstance
    }

    @Transactional
    def update(ClassificationSchemeAssociation classificationSchemeAssociationInstance) {
        if (classificationSchemeAssociationInstance == null) {
            notFound()
            return
        }

        if (classificationSchemeAssociationInstance.hasErrors()) {
            respond classificationSchemeAssociationInstance.errors, view:'edit'
            return
        }

        classificationSchemeAssociationInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ClassificationSchemeAssociation.label', default: 'ClassificationSchemeAssociation'), classificationSchemeAssociationInstance.id])
                redirect classificationSchemeAssociationInstance
            }
            '*'{ respond classificationSchemeAssociationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ClassificationSchemeAssociation classificationSchemeAssociationInstance) {

        if (classificationSchemeAssociationInstance == null) {
            notFound()
            return
        }

        classificationSchemeAssociationInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ClassificationSchemeAssociation.label', default: 'ClassificationSchemeAssociation'), classificationSchemeAssociationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'classificationSchemeAssociation.label', default: 'ClassificationSchemeAssociation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
