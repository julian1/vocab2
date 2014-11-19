
<%@ page import="vocab.ExternalAssociatedTerms" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'externalAssociatedTerms.label', default: 'ExternalAssociatedTerms')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-externalAssociatedTerms" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-externalAssociatedTerms" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list externalAssociatedTerms">
			
				<g:if test="${externalAssociatedTermsInstance?.uid}">
				<li class="fieldcontain">
					<span id="uid-label" class="property-label"><g:message code="externalAssociatedTerms.uid.label" default="Uid" /></span>
					
						<span class="property-value" aria-labelledby="uid-label"><g:fieldValue bean="${externalAssociatedTermsInstance}" field="uid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${externalAssociatedTermsInstance?.associationType}">
				<li class="fieldcontain">
					<span id="associationType-label" class="property-label"><g:message code="externalAssociatedTerms.associationType.label" default="Association Type" /></span>
					
						<span class="property-value" aria-labelledby="associationType-label"><g:link controller="associationType" action="show" id="${externalAssociatedTermsInstance?.associationType?.id}">${externalAssociatedTermsInstance?.associationType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${externalAssociatedTermsInstance?.vocabularyTerm}">
				<li class="fieldcontain">
					<span id="vocabularyTerm-label" class="property-label"><g:message code="externalAssociatedTerms.vocabularyTerm.label" default="Vocabulary Term" /></span>
					
						<span class="property-value" aria-labelledby="vocabularyTerm-label"><g:link controller="vocabularyTerm" action="show" id="${externalAssociatedTermsInstance?.vocabularyTerm?.id}">${externalAssociatedTermsInstance?.vocabularyTerm?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:externalAssociatedTermsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${externalAssociatedTermsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
