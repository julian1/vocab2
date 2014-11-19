<%@ page import="vocab.TermCategoryClassification" %>



<div class="fieldcontain ${hasErrors(bean: termCategoryClassificationInstance, field: 'classificationSchemeCategory', 'error')} required">
	<label for="classificationSchemeCategory">
		<g:message code="termCategoryClassification.classificationSchemeCategory.label" default="Classification Scheme Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="classificationSchemeCategory" name="classificationSchemeCategory.id" from="${vocab.ClassificationSchemeCategory.list()}" optionKey="id" optionValue="label" required="" value="${termCategoryClassificationInstance?.classificationSchemeCategory?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: termCategoryClassificationInstance, field: 'vocabularyTerm', 'error')} required">
	<label for="vocabularyTerm">
		<g:message code="termCategoryClassification.vocabularyTerm.label" default="Vocabulary Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vocabularyTerm" name="vocabularyTerm.id" from="${vocab.VocabularyTerm.list()}" optionKey="id" optionValue="name" required="" value="${termCategoryClassificationInstance?.vocabularyTerm?.id}" class="many-to-one"/>

</div>

