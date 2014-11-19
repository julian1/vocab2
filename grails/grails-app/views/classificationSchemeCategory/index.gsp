
<%@ page import="vocab.ClassificationSchemeCategory" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'classificationSchemeCategory.label', default: 'ClassificationSchemeCategory')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-classificationSchemeCategory" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-classificationSchemeCategory" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'classificationSchemeCategory.name.label', default: 'Name')}" />
					
					
						<g:sortableColumn property="label" title="${message(code: 'classificationSchemeCategory.label.label', default: 'Label')}" />

						<g:sortableColumn property="description" title="${message(code: 'classificationSchemeCategory.description.label', default: 'Description')}" />
					
						<th><g:message code="classificationSchemeCategory.classificationScheme.label" default="Classification Scheme" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${classificationSchemeCategoryInstanceList}" status="i" var="classificationSchemeCategoryInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${classificationSchemeCategoryInstance.id}">${fieldValue(bean: classificationSchemeCategoryInstance, field: "name")}</g:link></td>
					
					
						<td>${fieldValue(bean: classificationSchemeCategoryInstance, field: "label")}</td>

						<td>${fieldValue(bean: classificationSchemeCategoryInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: classificationSchemeCategoryInstance, field: "classificationScheme.name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${classificationSchemeCategoryInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
