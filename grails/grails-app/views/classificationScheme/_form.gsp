<%@ page import="vocab.ClassificationScheme" %>



<div class="fieldcontain ${hasErrors(bean: classificationSchemeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="classificationScheme.name.label" default="Name" />
		
	</label>
	<g:textArea name="name" cols="40" rows="5" maxlength="1010" value="${classificationSchemeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="classificationScheme.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1010" value="${classificationSchemeInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="classificationScheme.title.label" default="Title" />
		
	</label>
	<g:textArea name="title" cols="40" rows="5" maxlength="1010" value="${classificationSchemeInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeInstance, field: 'dateAdded', 'error')} ">
	<label for="dateAdded">
		<g:message code="classificationScheme.dateAdded.label" default="Date Added" />
		
	</label>
	<g:datePicker name="dateAdded" precision="day"  value="${classificationSchemeInstance?.dateAdded}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeInstance, field: 'classificationSchemeCategories', 'error')} ">
	<label for="classificationSchemeCategories">
		<g:message code="classificationScheme.classificationSchemeCategories.label" default="Classification Scheme Categories" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${classificationSchemeInstance?.classificationSchemeCategories?}" var="c">
    <li><g:link controller="classificationSchemeCategory" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="classificationSchemeCategory" action="create" params="['classificationScheme.id': classificationSchemeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'classificationSchemeCategory.label', default: 'ClassificationSchemeCategory')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: classificationSchemeInstance, field: 'responsibleParty', 'error')} required">
	<label for="responsibleParty">
		<g:message code="classificationScheme.responsibleParty.label" default="Responsible Party" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="responsibleParty" name="responsibleParty.id" from="${vocab.ResponsibleParty.list()}" optionKey="id" required="" value="${classificationSchemeInstance?.responsibleParty?.id}" class="many-to-one"/>

</div>

