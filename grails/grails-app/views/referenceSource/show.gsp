
<%@ page import="vocab.ReferenceSource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'referenceSource.label', default: 'ReferenceSource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-referenceSource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-referenceSource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list referenceSource">
			
				<g:if test="${referenceSourceInstance?.citationString}">
				<li class="fieldcontain">
					<span id="citationString-label" class="property-label"><g:message code="referenceSource.citationString.label" default="Citation String" /></span>
					
						<span class="property-value" aria-labelledby="citationString-label"><g:fieldValue bean="${referenceSourceInstance}" field="citationString"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${referenceSourceInstance?.onlineReferenceResource}">
				<li class="fieldcontain">
					<span id="onlineReferenceResource-label" class="property-label"><g:message code="referenceSource.onlineReferenceResource.label" default="Online Reference Resource" /></span>
					
						<span class="property-value" aria-labelledby="onlineReferenceResource-label"><g:fieldValue bean="${referenceSourceInstance}" field="onlineReferenceResource"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${referenceSourceInstance?.onlineTermResource}">
				<li class="fieldcontain">
					<span id="onlineTermResource-label" class="property-label"><g:message code="referenceSource.onlineTermResource.label" default="Online Term Resource" /></span>
					
						<span class="property-value" aria-labelledby="onlineTermResource-label"><g:fieldValue bean="${referenceSourceInstance}" field="onlineTermResource"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${referenceSourceInstance?.organisation}">
				<li class="fieldcontain">
					<span id="organisation-label" class="property-label"><g:message code="referenceSource.organisation.label" default="Organisation" /></span>
					
						<span class="property-value" aria-labelledby="organisation-label"><g:link controller="organisation" action="show" id="${referenceSourceInstance?.organisation?.id}">${referenceSourceInstance?.organisation?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${referenceSourceInstance?.vocabularyTerms}">
				<li class="fieldcontain">
					<span id="vocabularyTerms-label" class="property-label"><g:message code="referenceSource.vocabularyTerms.label" default="Vocabulary Terms" /></span>
					
						<g:each in="${referenceSourceInstance.vocabularyTerms}" var="v">
						<span class="property-value" aria-labelledby="vocabularyTerms-label"><g:link controller="vocabularyTerm" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:referenceSourceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${referenceSourceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
