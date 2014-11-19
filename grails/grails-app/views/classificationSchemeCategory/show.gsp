
<%@ page import="vocab.ClassificationSchemeCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'classificationSchemeCategory.label', default: 'ClassificationSchemeCategory')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-classificationSchemeCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-classificationSchemeCategory" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list classificationSchemeCategory">
			
				<g:if test="${classificationSchemeCategoryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="classificationSchemeCategory.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${classificationSchemeCategoryInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeCategoryInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="classificationSchemeCategory.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${classificationSchemeCategoryInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeCategoryInstance?.label}">
				<li class="fieldcontain">
					<span id="label-label" class="property-label"><g:message code="classificationSchemeCategory.label.label" default="Label" /></span>
					
						<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${classificationSchemeCategoryInstance}" field="label"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeCategoryInstance?.dateAdded}">
				<li class="fieldcontain">
					<span id="dateAdded-label" class="property-label"><g:message code="classificationSchemeCategory.dateAdded.label" default="Date Added" /></span>
					
						<span class="property-value" aria-labelledby="dateAdded-label"><g:formatDate date="${classificationSchemeCategoryInstance?.dateAdded}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeCategoryInstance?.classificationScheme}">
				<li class="fieldcontain">
					<span id="classificationScheme-label" class="property-label"><g:message code="classificationSchemeCategory.classificationScheme.label" default="Classification Scheme" /></span>
					
						<span class="property-value" aria-labelledby="classificationScheme-label"><g:link controller="classificationScheme" action="show" id="${classificationSchemeCategoryInstance?.classificationScheme?.id}">${classificationSchemeCategoryInstance?.classificationScheme?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeCategoryInstance?.classificationSchemeCategorys}">
				<li class="fieldcontain">
					<span id="classificationSchemeCategorys-label" class="property-label"><g:message code="classificationSchemeCategory.classificationSchemeCategorys.label" default="Classification Scheme Categorys" /></span>
					
						<g:each in="${classificationSchemeCategoryInstance.classificationSchemeCategorys}" var="c">
						<span class="property-value" aria-labelledby="classificationSchemeCategorys-label"><g:link controller="classificationSchemeAssociation" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeCategoryInstance?.parentClassificationSchemeCategorys}">
				<li class="fieldcontain">
					<span id="parentClassificationSchemeCategorys-label" class="property-label"><g:message code="classificationSchemeCategory.parentClassificationSchemeCategorys.label" default="Parent Classification Scheme Categorys" /></span>
					
						<g:each in="${classificationSchemeCategoryInstance.parentClassificationSchemeCategorys}" var="p">
						<span class="property-value" aria-labelledby="parentClassificationSchemeCategorys-label"><g:link controller="classificationSchemeAssociation" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${classificationSchemeCategoryInstance?.termCategoryClassifications}">
				<li class="fieldcontain">
					<span id="termCategoryClassifications-label" class="property-label"><g:message code="classificationSchemeCategory.termCategoryClassifications.label" default="Term Category Classifications" /></span>
					
						<g:each in="${classificationSchemeCategoryInstance.termCategoryClassifications}" var="t">
						<span class="property-value" aria-labelledby="termCategoryClassifications-label"><g:link controller="termCategoryClassification" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:classificationSchemeCategoryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${classificationSchemeCategoryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
