<%@ page import="vocab.OrganisationSynonym" %>



<div class="fieldcontain ${hasErrors(bean: organisationSynonymInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="organisationSynonym.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="110" value="${organisationSynonymInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: organisationSynonymInstance, field: 'organisation', 'error')} required">
	<label for="organisation">
		<g:message code="organisationSynonym.organisation.label" default="Organisation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="organisation" name="organisation.id" from="${vocab.Organisation.list()}" optionKey="id" required="" value="${organisationSynonymInstance?.organisation?.id}" class="many-to-one"/>

</div>

