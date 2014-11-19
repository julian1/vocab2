
<%@ page import="vocab.VocabularyType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vocabularyType.label', default: 'VocabularyType')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vocabularyType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vocabularyType" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vocabularyType">
			
				<g:if test="${vocabularyTypeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="vocabularyType.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${vocabularyTypeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTypeInstance?.definition}">
				<li class="fieldcontain">
					<span id="definition-label" class="property-label"><g:message code="vocabularyType.definition.label" default="Definition" /></span>
					
						<span class="property-value" aria-labelledby="definition-label"><g:fieldValue bean="${vocabularyTypeInstance}" field="definition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTypeInstance?.vocabularyTerms}">
				<li class="fieldcontain">
					<span id="vocabularyTerms-label" class="property-label"><g:message code="vocabularyType.vocabularyTerms.label" default="Vocabulary Terms" /></span>
					
						<g:each in="${vocabularyTypeInstance.vocabularyTerms}" var="v">
						<span class="property-value" aria-labelledby="vocabularyTerms-label"><g:link controller="vocabularyTerm" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:vocabularyTypeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${vocabularyTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
