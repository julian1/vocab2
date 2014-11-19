<%@ page import="vocab.ClassificationSchemeCategory" %>



<div class="fieldcontain ${hasErrors(bean: classificationSchemeCategoryInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="classificationSchemeCategory.name.label" default="Name" />
		
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="1010" value="${classificationSchemeCategoryInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeCategoryInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="classificationSchemeCategory.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1010" value="${classificationSchemeCategoryInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeCategoryInstance, field: 'label', 'error')} ">
	<label for="label">
		<g:message code="classificationSchemeCategory.label.label" default="Label" />
		
	</label>
	<g:textArea name="label" cols="40" rows="5" maxlength="1010" value="${classificationSchemeCategoryInstance?.label}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeCategoryInstance, field: 'dateAdded', 'error')} ">
	<label for="dateAdded">
		<g:message code="classificationSchemeCategory.dateAdded.label" default="Date Added" />
		
	</label>
	<g:datePicker name="dateAdded" precision="day"  value="${classificationSchemeCategoryInstance?.dateAdded}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeCategoryInstance, field: 'classificationScheme', 'error')} required">
	<label for="classificationScheme">
		<g:message code="classificationSchemeCategory.classificationScheme.label" default="Classification Scheme" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="classificationScheme" name="classificationScheme.id" from="${vocab.ClassificationScheme.list()}" optionKey="id" required="" value="${classificationSchemeCategoryInstance?.classificationScheme?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeCategoryInstance, field: 'classificationSchemeCategorys', 'error')} ">
	<label for="classificationSchemeCategorys">
		<g:message code="classificationSchemeCategory.classificationSchemeCategorys.label" default="Classification Scheme Categorys" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${classificationSchemeCategoryInstance?.classificationSchemeCategorys?}" var="c">
    <li><g:link controller="classificationSchemeAssociation" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="classificationSchemeAssociation" action="create" params="['classificationSchemeCategory.id': classificationSchemeCategoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'classificationSchemeAssociation.label', default: 'ClassificationSchemeAssociation')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeCategoryInstance, field: 'parentClassificationSchemeCategorys', 'error')} ">
	<label for="parentClassificationSchemeCategorys">
		<g:message code="classificationSchemeCategory.parentClassificationSchemeCategorys.label" default="Parent Classification Scheme Categorys" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${classificationSchemeCategoryInstance?.parentClassificationSchemeCategorys?}" var="p">
    <li><g:link controller="classificationSchemeAssociation" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="classificationSchemeAssociation" action="create" params="['classificationSchemeCategory.id': classificationSchemeCategoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'classificationSchemeAssociation.label', default: 'ClassificationSchemeAssociation')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeCategoryInstance, field: 'termCategoryClassifications', 'error')} ">
	<label for="termCategoryClassifications">
		<g:message code="classificationSchemeCategory.termCategoryClassifications.label" default="Term Category Classifications" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${classificationSchemeCategoryInstance?.termCategoryClassifications?}" var="t">
    <li><g:link controller="termCategoryClassification" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="termCategoryClassification" action="create" params="['classificationSchemeCategory.id': classificationSchemeCategoryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'termCategoryClassification.label', default: 'TermCategoryClassification')])}</g:link>
</li>
</ul>


</div>

