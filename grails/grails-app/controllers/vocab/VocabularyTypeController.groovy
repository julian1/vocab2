package vocab



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VocabularyTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VocabularyType.list(params), model:[vocabularyTypeInstanceCount: VocabularyType.count()]
    }

    def show(VocabularyType vocabularyTypeInstance) {
        respond vocabularyTypeInstance
    }

    def create() {
        respond new VocabularyType(params)
    }

    @Transactional
    def save(VocabularyType vocabularyTypeInstance) {
        if (vocabularyTypeInstance == null) {
            notFound()
            return
        }

        if (vocabularyTypeInstance.hasErrors()) {
            respond vocabularyTypeInstance.errors, view:'create'
            return
        }

        vocabularyTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'vocabularyType.label', default: 'VocabularyType'), vocabularyTypeInstance.id])
                redirect vocabularyTypeInstance
            }
            '*' { respond vocabularyTypeInstance, [status: CREATED] }
        }
    }

    def edit(VocabularyType vocabularyTypeInstance) {
        respond vocabularyTypeInstance
    }

    @Transactional
    def update(VocabularyType vocabularyTypeInstance) {
        if (vocabularyTypeInstance == null) {
            notFound()
            return
        }

        if (vocabularyTypeInstance.hasErrors()) {
            respond vocabularyTypeInstance.errors, view:'edit'
            return
        }

        vocabularyTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VocabularyType.label', default: 'VocabularyType'), vocabularyTypeInstance.id])
                redirect vocabularyTypeInstance
            }
            '*'{ respond vocabularyTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VocabularyType vocabularyTypeInstance) {

        if (vocabularyTypeInstance == null) {
            notFound()
            return
        }

        vocabularyTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VocabularyType.label', default: 'VocabularyType'), vocabularyTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'vocabularyType.label', default: 'VocabularyType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
