
<%@ page import="vocab.ClassificationSchemeAssociation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'classificationSchemeAssociation.label', default: 'ClassificationSchemeAssociation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-classificationSchemeAssociation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-classificationSchemeAssociation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list classificationSchemeAssociation">
			
				<g:if test="${classificationSchemeAssociationInstance?.classificationSchemeCategory}">
				<li class="fieldcontain">
					<span id="classificationSchemeCategory-label" class="property-label"><g:message code="classificationSchemeAssociation.classificationSchemeCategory.label" default="Classification Scheme Category" /></span>
					
						<span class="property-value" aria-labelledby="classificationSchemeCategory-label"><g:link controller="classificationSchemeCategory" action="show" id="${classificationSchemeAssociationInstance?.classificationSchemeCategory?.id}">${classificationSchemeAssociationInstance?.classificationSchemeCategory?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeAssociationInstance?.parentClassificationSchemeCategory}">
				<li class="fieldcontain">
					<span id="parentClassificationSchemeCategory-label" class="property-label"><g:message code="classificationSchemeAssociation.parentClassificationSchemeCategory.label" default="Parent Classification Scheme Category" /></span>
					
						<span class="property-value" aria-labelledby="parentClassificationSchemeCategory-label"><g:link controller="classificationSchemeCategory" action="show" id="${classificationSchemeAssociationInstance?.parentClassificationSchemeCategory?.id}">${classificationSchemeAssociationInstance?.parentClassificationSchemeCategory?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:classificationSchemeAssociationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${classificationSchemeAssociationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
