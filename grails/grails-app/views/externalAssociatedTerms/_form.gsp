<%@ page import="vocab.ExternalAssociatedTerms" %>



<div class="fieldcontain ${hasErrors(bean: externalAssociatedTermsInstance, field: 'uid', 'error')} required">
	<label for="uid">
		<g:message code="externalAssociatedTerms.uid.label" default="Uid" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="uid" cols="40" rows="5" maxlength="510" required="" value="${externalAssociatedTermsInstance?.uid}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: externalAssociatedTermsInstance, field: 'associationType', 'error')} required">
	<label for="associationType">
		<g:message code="externalAssociatedTerms.associationType.label" default="Association Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="associationType" name="associationType.id" from="${vocab.AssociationType.list()}" optionKey="id" optionValue="name" required="" value="${externalAssociatedTermsInstance?.associationType?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: externalAssociatedTermsInstance, field: 'vocabularyTerm', 'error')} required">
	<label for="vocabularyTerm">
		<g:message code="externalAssociatedTerms.vocabularyTerm.label" default="Vocabulary Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vocabularyTerm" name="vocabularyTerm.id" from="${vocab.VocabularyTerm.list()}" optionKey="id" optionValue="name" required="" value="${externalAssociatedTermsInstance?.vocabularyTerm?.id}" class="many-to-one"/>

</div>

