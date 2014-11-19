package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VocabularyRegisterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VocabularyRegister.list(params), model:[vocabularyRegisterInstanceCount: VocabularyRegister.count()]
    }

    def show(VocabularyRegister vocabularyRegisterInstance) {
        respond vocabularyRegisterInstance
    }

    def create() {
        respond new VocabularyRegister(params)
    }

    @Transactional
    def save(VocabularyRegister vocabularyRegisterInstance) {
        if (vocabularyRegisterInstance == null) {
            notFound()
            return
        }

        if (vocabularyRegisterInstance.hasErrors()) {
            respond vocabularyRegisterInstance.errors, view:'create'
            return
        }

        vocabularyRegisterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vocabularyRegister.label', default: 'VocabularyRegister'), vocabularyRegisterInstance.id])
                redirect vocabularyRegisterInstance
            }
            '*' { respond vocabularyRegisterInstance, [status: CREATED] }
        }
    }

    def edit(VocabularyRegister vocabularyRegisterInstance) {
        respond vocabularyRegisterInstance
    }

    @Transactional
    def update(VocabularyRegister vocabularyRegisterInstance) {
        if (vocabularyRegisterInstance == null) {
            notFound()
            return
        }

        if (vocabularyRegisterInstance.hasErrors()) {
            respond vocabularyRegisterInstance.errors, view:'edit'
            return
        }

        vocabularyRegisterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VocabularyRegister.label', default: 'VocabularyRegister'), vocabularyRegisterInstance.id])
                redirect vocabularyRegisterInstance
            }
            '*'{ respond vocabularyRegisterInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VocabularyRegister vocabularyRegisterInstance) {

        if (vocabularyRegisterInstance == null) {
            notFound()
            return
        }

        vocabularyRegisterInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VocabularyRegister.label', default: 'VocabularyRegister'), vocabularyRegisterInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vocabularyRegister.label', default: 'VocabularyRegister'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
