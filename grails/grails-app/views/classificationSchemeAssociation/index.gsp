
<%@ page import="vocab.ClassificationSchemeAssociation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'classificationSchemeAssociation.label', default: 'ClassificationSchemeAssociation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-classificationSchemeAssociation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-classificationSchemeAssociation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="classificationSchemeAssociation.classificationSchemeCategory.label" default="Classification Scheme Category" /></th>
					
						<th><g:message code="classificationSchemeAssociation.parentClassificationSchemeCategory.label" default="Parent Classification Scheme Category" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${classificationSchemeAssociationInstanceList}" status="i" var="classificationSchemeAssociationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${classificationSchemeAssociationInstance.id}">${fieldValue(bean: classificationSchemeAssociationInstance, field: "classificationSchemeCategory")}</g:link></td>
					
						<td>${fieldValue(bean: classificationSchemeAssociationInstance, field: "parentClassificationSchemeCategory")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${classificationSchemeAssociationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
