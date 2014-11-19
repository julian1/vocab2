
<%@ page import="vocab.TermCategoryClassification" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'termCategoryClassification.label', default: 'TermCategoryClassification')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-termCategoryClassification" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-termCategoryClassification" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list termCategoryClassification">
			
				<g:if test="${termCategoryClassificationInstance?.classificationSchemeCategory}">
				<li class="fieldcontain">
					<span id="classificationSchemeCategory-label" class="property-label"><g:message code="termCategoryClassification.classificationSchemeCategory.label" default="Classification Scheme Category" /></span>
					
						<span class="property-value" aria-labelledby="classificationSchemeCategory-label"><g:link controller="classificationSchemeCategory" action="show" id="${termCategoryClassificationInstance?.classificationSchemeCategory?.id}">${termCategoryClassificationInstance?.classificationSchemeCategory?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${termCategoryClassificationInstance?.vocabularyTerm}">
				<li class="fieldcontain">
					<span id="vocabularyTerm-label" class="property-label"><g:message code="termCategoryClassification.vocabularyTerm.label" default="Vocabulary Term" /></span>
					
						<span class="property-value" aria-labelledby="vocabularyTerm-label"><g:link controller="vocabularyTerm" action="show" id="${termCategoryClassificationInstance?.vocabularyTerm?.id}">${termCategoryClassificationInstance?.vocabularyTerm?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:termCategoryClassificationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${termCategoryClassificationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
