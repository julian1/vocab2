<%@ page import="vocab.Organisation" %>



<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="organisation.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="110" value="${organisationInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="organisation.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${organisationInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'acronym', 'error')} ">
	<label for="acronym">
		<g:message code="organisation.acronym.label" default="Acronym" />
		
	</label>
	<g:textField name="acronym" maxlength="10" value="${organisationInstance?.acronym}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="organisation.address.label" default="Address" />
		
	</label>
	<g:textField name="address" maxlength="110" value="${organisationInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="organisation.status.label" default="Status" />
		
	</label>
	<g:textField name="status" maxlength="10" value="${organisationInstance?.status}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="organisation.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="1010" value="${organisationInstance?.notes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'organisationSynonyms', 'error')} ">
	<label for="organisationSynonyms">
		<g:message code="organisation.organisationSynonyms.label" default="Organisation Synonyms" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${organisationInstance?.organisationSynonyms?}" var="o">
    <li><g:link controller="organisationSynonym" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="organisationSynonym" action="create" params="['organisation.id': organisationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'organisationSynonym.label', default: 'OrganisationSynonym')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'referenceSources', 'error')} ">
	<label for="referenceSources">
		<g:message code="organisation.referenceSources.label" default="Reference Sources" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${organisationInstance?.referenceSources?}" var="r">
    <li><g:link controller="referenceSource" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="referenceSource" action="create" params="['organisation.id': organisationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'referenceSource.label', default: 'ReferenceSource')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'responsibleParties', 'error')} ">
	<label for="responsibleParties">
		<g:message code="organisation.responsibleParties.label" default="Responsible Parties" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${organisationInstance?.responsibleParties?}" var="r">
    <li><g:link controller="responsibleParty" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="responsibleParty" action="create" params="['organisation.id': organisationInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'responsibleParty.label', default: 'ResponsibleParty')])}</g:link>
</li>
</ul>


</div>

