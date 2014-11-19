<%@ page import="vocab.InternalAssociatedTerms" %>



<div class="fieldcontain ${hasErrors(bean: internalAssociatedTermsInstance, field: 'associationType', 'error')} required">
	<label for="associationType">
		<g:message code="internalAssociatedTerms.associationType.label" default="Association Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="associationType" name="associationType.id" from="${vocab.AssociationType.list()}" optionKey="id" optionValue="name" required="" value="${internalAssociatedTermsInstance?.associationType?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: internalAssociatedTermsInstance, field: 'subjectVocabularyTerm', 'error')} required">
	<label for="subjectVocabularyTerm">
		<g:message code="internalAssociatedTerms.subjectVocabularyTerm.label" default="Subject Vocabulary Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="subjectVocabularyTerm" name="subjectVocabularyTerm.id" from="${vocab.VocabularyTerm.list()}" optionKey="id" optionValue="name" required="" value="${internalAssociatedTermsInstance?.subjectVocabularyTerm?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: internalAssociatedTermsInstance, field: 'objectVocabularyTerm', 'error')} required">
	<label for="objectVocabularyTerm">
		<g:message code="internalAssociatedTerms.objectVocabularyTerm.label" default="Object Vocabulary Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="objectVocabularyTerm" name="objectVocabularyTerm.id" from="${vocab.VocabularyTerm.list()}" optionKey="id" optionValue="name" required="" value="${internalAssociatedTermsInstance?.objectVocabularyTerm?.id}" class="many-to-one"/>

</div>


