
<%@ page import="vocab.Organisation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organisation.label', default: 'Organisation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-organisation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-organisation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list organisation">
			
				<g:if test="${organisationInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="organisation.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${organisationInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="organisation.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${organisationInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.acronym}">
				<li class="fieldcontain">
					<span id="acronym-label" class="property-label"><g:message code="organisation.acronym.label" default="Acronym" /></span>
					
						<span class="property-value" aria-labelledby="acronym-label"><g:fieldValue bean="${organisationInstance}" field="acronym"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="organisation.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${organisationInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="organisation.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${organisationInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="organisation.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${organisationInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.organisationSynonyms}">
				<li class="fieldcontain">
					<span id="organisationSynonyms-label" class="property-label"><g:message code="organisation.organisationSynonyms.label" default="Organisation Synonyms" /></span>
					
						<g:each in="${organisationInstance.organisationSynonyms}" var="o">
						<span class="property-value" aria-labelledby="organisationSynonyms-label"><g:link controller="organisationSynonym" action="show" id="${o.id}">${o?.name?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.referenceSources}">
				<li class="fieldcontain">
					<span id="referenceSources-label" class="property-label"><g:message code="organisation.referenceSources.label" default="Reference Sources" /></span>
					
						<g:each in="${organisationInstance.referenceSources}" var="r">
						<span class="property-value" aria-labelledby="referenceSources-label"><g:link controller="referenceSource" action="show" id="${r.id}">${r?.citationString?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${organisationInstance?.responsibleParties}">
				<li class="fieldcontain">
					<span id="responsibleParties-label" class="property-label"><g:message code="organisation.responsibleParties.label" default="Responsible Parties" /></span>
					
						<g:each in="${organisationInstance.responsibleParties}" var="r">
						<span class="property-value" aria-labelledby="responsibleParties-label"><g:link controller="responsibleParty" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:organisationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${organisationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
