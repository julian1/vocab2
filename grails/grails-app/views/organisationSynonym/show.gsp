
<%@ page import="vocab.OrganisationSynonym" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organisationSynonym.label', default: 'OrganisationSynonym')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-organisationSynonym" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-organisationSynonym" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list organisationSynonym">
			
				<g:if test="${organisationSynonymInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="organisationSynonym.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${organisationSynonymInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${organisationSynonymInstance?.organisation}">
				<li class="fieldcontain">
					<span id="organisation-label" class="property-label"><g:message code="organisationSynonym.organisation.label" default="Organisation" /></span>
					
						<span class="property-value" aria-labelledby="organisation-label"><g:link controller="organisation" action="show" id="${organisationSynonymInstance?.organisation?.id}">${organisationSynonymInstance?.organisation?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:organisationSynonymInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${organisationSynonymInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
