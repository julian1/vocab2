<%@ page import="vocab.ClassificationSchemeAssociation" %>



<div class="fieldcontain ${hasErrors(bean: classificationSchemeAssociationInstance, field: 'classificationSchemeCategory', 'error')} required">
	<label for="classificationSchemeCategory">
		<g:message code="classificationSchemeAssociation.classificationSchemeCategory.label" default="Classification Scheme Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="classificationSchemeCategory" name="classificationSchemeCategory.id" from="${vocab.ClassificationSchemeCategory.list()}" optionKey="id" required="" value="${classificationSchemeAssociationInstance?.classificationSchemeCategory?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeAssociationInstance, field: 'parentClassificationSchemeCategory', 'error')} required">
	<label for="parentClassificationSchemeCategory">
		<g:message code="classificationSchemeAssociation.parentClassificationSchemeCategory.label" default="Parent Classification Scheme Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="parentClassificationSchemeCategory" name="parentClassificationSchemeCategory.id" from="${vocab.ClassificationSchemeCategory.list()}" optionKey="id" required="" value="${classificationSchemeAssociationInstance?.parentClassificationSchemeCategory?.id}" class="many-to-one"/>

</div>

