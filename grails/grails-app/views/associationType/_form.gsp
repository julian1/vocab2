<%@ page import="vocab.AssociationType" %>



<div class="fieldcontain ${hasErrors(bean: associationTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="associationType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="20" required="" value="${associationTypeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: associationTypeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="associationType.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1010" value="${associationTypeInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: associationTypeInstance, field: 'externalAssociatedTermses', 'error')} ">
	<label for="externalAssociatedTermses">
		<g:message code="associationType.externalAssociatedTermses.label" default="External Associated Termses" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${associationTypeInstance?.externalAssociatedTermses?}" var="e">
    <li><g:link controller="externalAssociatedTerms" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="externalAssociatedTerms" action="create" params="['associationType.id': associationTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'externalAssociatedTerms.label', default: 'ExternalAssociatedTerms')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: associationTypeInstance, field: 'internalAssociatedTermses', 'error')} ">
	<label for="internalAssociatedTermses">
		<g:message code="associationType.internalAssociatedTermses.label" default="Internal Associated Termses" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${associationTypeInstance?.internalAssociatedTermses?}" var="i">
    <li><g:link controller="internalAssociatedTerms" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="internalAssociatedTerms" action="create" params="['associationType.id': associationTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'internalAssociatedTerms.label', default: 'InternalAssociatedTerms')])}</g:link>
</li>
</ul>


</div>

