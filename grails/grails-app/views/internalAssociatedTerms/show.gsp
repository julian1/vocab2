
<%@ page import="vocab.InternalAssociatedTerms" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'internalAssociatedTerms.label', default: 'InternalAssociatedTerms')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-internalAssociatedTerms" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-internalAssociatedTerms" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list internalAssociatedTerms">
			
				<g:if test="${internalAssociatedTermsInstance?.associationType}">
				<li class="fieldcontain">
					<span id="associationType-label" class="property-label"><g:message code="internalAssociatedTerms.associationType.label" default="Association Type" /></span>
					
						<span class="property-value" aria-labelledby="associationType-label"><g:link controller="associationType" action="show" id="${internalAssociatedTermsInstance?.associationType?.id}">${internalAssociatedTermsInstance?.associationType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${internalAssociatedTermsInstance?.objectVocabularyTerm}">
				<li class="fieldcontain">
					<span id="objectVocabularyTerm-label" class="property-label"><g:message code="internalAssociatedTerms.objectVocabularyTerm.label" default="Object Vocabulary Term" /></span>
					
						<span class="property-value" aria-labelledby="objectVocabularyTerm-label"><g:link controller="vocabularyTerm" action="show" id="${internalAssociatedTermsInstance?.objectVocabularyTerm?.id}">${internalAssociatedTermsInstance?.objectVocabularyTerm?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${internalAssociatedTermsInstance?.subjectVocabularyTerm}">
				<li class="fieldcontain">
					<span id="subjectVocabularyTerm-label" class="property-label"><g:message code="internalAssociatedTerms.subjectVocabularyTerm.label" default="Subject Vocabulary Term" /></span>
					
						<span class="property-value" aria-labelledby="subjectVocabularyTerm-label"><g:link controller="vocabularyTerm" action="show" id="${internalAssociatedTermsInstance?.subjectVocabularyTerm?.id}">${internalAssociatedTermsInstance?.subjectVocabularyTerm?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:internalAssociatedTermsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${internalAssociatedTermsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
