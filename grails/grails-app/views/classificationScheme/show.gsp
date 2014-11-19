
<%@ page import="vocab.ClassificationScheme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'classificationScheme.label', default: 'ClassificationScheme')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-classificationScheme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-classificationScheme" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list classificationScheme">
			
				<g:if test="${classificationSchemeInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="classificationScheme.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${classificationSchemeInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="classificationScheme.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${classificationSchemeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="classificationScheme.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${classificationSchemeInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeInstance?.dateAdded}">
				<li class="fieldcontain">
					<span id="dateAdded-label" class="property-label"><g:message code="classificationScheme.dateAdded.label" default="Date Added" /></span>
					
						<span class="property-value" aria-labelledby="dateAdded-label"><g:formatDate date="${classificationSchemeInstance?.dateAdded}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeInstance?.classificationSchemeCategories}">
				<li class="fieldcontain">
					<span id="classificationSchemeCategories-label" class="property-label"><g:message code="classificationScheme.classificationSchemeCategories.label" default="Classification Scheme Categories" /></span>
					
						<g:each in="${classificationSchemeInstance.classificationSchemeCategories}" var="c">
						<span class="property-value" aria-labelledby="classificationSchemeCategories-label"><g:link controller="classificationSchemeCategory" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeInstance?.responsibleParty}">
				<li class="fieldcontain">
					<span id="responsibleParty-label" class="property-label"><g:message code="classificationScheme.responsibleParty.label" default="Responsible Party" /></span>
					
						<span class="property-value" aria-labelledby="responsibleParty-label"><g:link controller="responsibleParty" action="show" id="${classificationSchemeInstance?.responsibleParty?.id}">${classificationSchemeInstance?.responsibleParty?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:classificationSchemeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${classificationSchemeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
