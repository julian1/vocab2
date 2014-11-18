package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResponsiblePartyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ResponsibleParty.list(params), model:[responsiblePartyInstanceCount: ResponsibleParty.count()]
    }

    def show(ResponsibleParty responsiblePartyInstance) {
        respond responsiblePartyInstance
    }

    def create() {
        respond new ResponsibleParty(params)
    }

    @Transactional
    def save(ResponsibleParty responsiblePartyInstance) {
        if (responsiblePartyInstance == null) {
            notFound()
            return
        }

        if (responsiblePartyInstance.hasErrors()) {
            respond responsiblePartyInstance.errors, view:'create'
            return
        }

        responsiblePartyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'responsibleParty.label', default: 'ResponsibleParty'), responsiblePartyInstance.id])
                redirect responsiblePartyInstance
            }
            '*' { respond responsiblePartyInstance, [status: CREATED] }
        }
    }

    def edit(ResponsibleParty responsiblePartyInstance) {
        respond responsiblePartyInstance
    }

    @Transactional
    def update(ResponsibleParty responsiblePartyInstance) {
        if (responsiblePartyInstance == null) {
            notFound()
            return
        }

        if (responsiblePartyInstance.hasErrors()) {
            respond responsiblePartyInstance.errors, view:'edit'
            return
        }

        responsiblePartyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ResponsibleParty.label', default: 'ResponsibleParty'), responsiblePartyInstance.id])
                redirect responsiblePartyInstance
            }
            '*'{ respond responsiblePartyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ResponsibleParty responsiblePartyInstance) {

        if (responsiblePartyInstance == null) {
            notFound()
            return
        }

        responsiblePartyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ResponsibleParty.label', default: 'ResponsibleParty'), responsiblePartyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'responsibleParty.label', default: 'ResponsibleParty'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
