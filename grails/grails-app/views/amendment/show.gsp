
<%@ page import="vocab.Amendment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'amendment.label', default: 'Amendment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-amendment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-amendment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list amendment">
			
				<g:if test="${amendmentInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="amendment.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${amendmentInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${amendmentInstance?.requestDate}">
				<li class="fieldcontain">
					<span id="requestDate-label" class="property-label"><g:message code="amendment.requestDate.label" default="Request Date" /></span>
					
						<span class="property-value" aria-labelledby="requestDate-label"><g:formatDate date="${amendmentInstance?.requestDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${amendmentInstance?.approvalDate}">
				<li class="fieldcontain">
					<span id="approvalDate-label" class="property-label"><g:message code="amendment.approvalDate.label" default="Approval Date" /></span>
					
						<span class="property-value" aria-labelledby="approvalDate-label"><g:formatDate date="${amendmentInstance?.approvalDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${amendmentInstance?.responsibleParty}">
				<li class="fieldcontain">
					<span id="responsibleParty-label" class="property-label"><g:message code="amendment.responsibleParty.label" default="Responsible Party" /></span>
					
						<span class="property-value" aria-labelledby="responsibleParty-label"><g:link controller="responsibleParty" action="show" id="${amendmentInstance?.responsibleParty?.id}">${amendmentInstance?.responsibleParty?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${amendmentInstance?.vocabularyRegister}">
				<li class="fieldcontain">
					<span id="vocabularyRegister-label" class="property-label"><g:message code="amendment.vocabularyRegister.label" default="Vocabulary Register" /></span>
					
						<span class="property-value" aria-labelledby="vocabularyRegister-label"><g:link controller="vocabularyRegister" action="show" id="${amendmentInstance?.vocabularyRegister?.id}">${amendmentInstance?.vocabularyRegister?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${amendmentInstance?.vocabularyTerm}">
				<li class="fieldcontain">
					<span id="vocabularyTerm-label" class="property-label"><g:message code="amendment.vocabularyTerm.label" default="Vocabulary Term" /></span>
					
						<span class="property-value" aria-labelledby="vocabularyTerm-label"><g:link controller="vocabularyTerm" action="show" id="${amendmentInstance?.vocabularyTerm?.id}">${amendmentInstance?.vocabularyTerm?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:amendmentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${amendmentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
