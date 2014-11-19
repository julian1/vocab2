
<%@ page import="vocab.AssociationType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'associationType.label', default: 'AssociationType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-associationType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-associationType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list associationType">
			
				<g:if test="${associationTypeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="associationType.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${associationTypeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${associationTypeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="associationType.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${associationTypeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${associationTypeInstance?.externalAssociatedTermses}">
				<li class="fieldcontain">
					<span id="externalAssociatedTermses-label" class="property-label"><g:message code="associationType.externalAssociatedTermses.label" default="External Associated Termses" /></span>
					
						<g:each in="${associationTypeInstance.externalAssociatedTermses}" var="e">
						<span class="property-value" aria-labelledby="externalAssociatedTermses-label"><g:link controller="externalAssociatedTerms" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${associationTypeInstance?.internalAssociatedTermses}">
				<li class="fieldcontain">
					<span id="internalAssociatedTermses-label" class="property-label"><g:message code="associationType.internalAssociatedTermses.label" default="Internal Associated Termses" /></span>
					
						<g:each in="${associationTypeInstance.internalAssociatedTermses}" var="i">
						<span class="property-value" aria-labelledby="internalAssociatedTermses-label"><g:link controller="internalAssociatedTerms" action="show" id="${i.id}">${i?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:associationTypeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${associationTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
