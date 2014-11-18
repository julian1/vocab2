
<%@ page import="vocab.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">
			
				<g:if test="${personInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="person.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${personInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.salutation}">
				<li class="fieldcontain">
					<span id="salutation-label" class="property-label"><g:message code="person.salutation.label" default="Salutation" /></span>
					
						<span class="property-value" aria-labelledby="salutation-label"><g:fieldValue bean="${personInstance}" field="salutation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.alternatePersonNameExpression}">
				<li class="fieldcontain">
					<span id="alternatePersonNameExpression-label" class="property-label"><g:message code="person.alternatePersonNameExpression.label" default="Alternate Person Name Expression" /></span>
					
						<span class="property-value" aria-labelledby="alternatePersonNameExpression-label"><g:fieldValue bean="${personInstance}" field="alternatePersonNameExpression"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="person.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${personInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.contactPhoneNumber}">
				<li class="fieldcontain">
					<span id="contactPhoneNumber-label" class="property-label"><g:message code="person.contactPhoneNumber.label" default="Contact Phone Number" /></span>
					
						<span class="property-value" aria-labelledby="contactPhoneNumber-label"><g:fieldValue bean="${personInstance}" field="contactPhoneNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.contactMobileNumber}">
				<li class="fieldcontain">
					<span id="contactMobileNumber-label" class="property-label"><g:message code="person.contactMobileNumber.label" default="Contact Mobile Number" /></span>
					
						<span class="property-value" aria-labelledby="contactMobileNumber-label"><g:fieldValue bean="${personInstance}" field="contactMobileNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.responsibleParties}">
				<li class="fieldcontain">
					<span id="responsibleParties-label" class="property-label"><g:message code="person.responsibleParties.label" default="Responsible Parties" /></span>
					
						<g:each in="${personInstance.responsibleParties}" var="r">
						<span class="property-value" aria-labelledby="responsibleParties-label"><g:link controller="responsibleParty" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.vocabularyTerms}">
				<li class="fieldcontain">
					<span id="vocabularyTerms-label" class="property-label"><g:message code="person.vocabularyTerms.label" default="Vocabulary Terms" /></span>
					
						<g:each in="${personInstance.vocabularyTerms}" var="v">
						<span class="property-value" aria-labelledby="vocabularyTerms-label"><g:link controller="vocabularyTerm" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:personInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${personInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
