package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VocabularyTermController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VocabularyTerm.list(params), model:[vocabularyTermInstanceCount: VocabularyTerm.count()]
    }

    def show(VocabularyTerm vocabularyTermInstance) {
        respond vocabularyTermInstance
    }

    def create() {
        respond new VocabularyTerm(params)
    }

    @Transactional
    def save(VocabularyTerm vocabularyTermInstance) {
        if (vocabularyTermInstance == null) {
            notFound()
            return
        }

        if (vocabularyTermInstance.hasErrors()) {
            respond vocabularyTermInstance.errors, view:'create'
            return
        }

        vocabularyTermInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vocabularyTerm.label', default: 'VocabularyTerm'), vocabularyTermInstance.id])
                redirect vocabularyTermInstance
            }
            '*' { respond vocabularyTermInstance, [status: CREATED] }
        }
    }

    def edit(VocabularyTerm vocabularyTermInstance) {
        respond vocabularyTermInstance
    }

    @Transactional
    def update(VocabularyTerm vocabularyTermInstance) {
        if (vocabularyTermInstance == null) {
            notFound()
            return
        }

        if (vocabularyTermInstance.hasErrors()) {
            respond vocabularyTermInstance.errors, view:'edit'
            return
        }

        vocabularyTermInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VocabularyTerm.label', default: 'VocabularyTerm'), vocabularyTermInstance.id])
                redirect vocabularyTermInstance
            }
            '*'{ respond vocabularyTermInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VocabularyTerm vocabularyTermInstance) {

        if (vocabularyTermInstance == null) {
            notFound()
            return
        }

        vocabularyTermInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VocabularyTerm.label', default: 'VocabularyTerm'), vocabularyTermInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vocabularyTerm.label', default: 'VocabularyTerm'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
