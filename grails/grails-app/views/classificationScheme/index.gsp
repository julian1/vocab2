
<%@ page import="vocab.ClassificationScheme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'classificationScheme.label', default: 'ClassificationScheme')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-classificationScheme" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-classificationScheme" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'classificationScheme.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'classificationScheme.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'classificationScheme.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="dateAdded" title="${message(code: 'classificationScheme.dateAdded.label', default: 'Date Added')}" />
					
						<th><g:message code="classificationScheme.responsibleParty.label" default="Responsible Party" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${classificationSchemeInstanceList}" status="i" var="classificationSchemeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${classificationSchemeInstance.id}">${fieldValue(bean: classificationSchemeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: classificationSchemeInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: classificationSchemeInstance, field: "title")}</td>
					
						<td><g:formatDate date="${classificationSchemeInstance.dateAdded}" /></td>
					
						<td>${fieldValue(bean: classificationSchemeInstance, field: "responsibleParty")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${classificationSchemeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
