
<%@ page import="vocab.VocabularyType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vocabularyType.label', default: 'VocabularyType')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vocabularyType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vocabularyType" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'vocabularyType.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="definition" title="${message(code: 'vocabularyType.definition.label', default: 'Definition')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vocabularyTypeInstanceList}" status="i" var="vocabularyTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vocabularyTypeInstance.id}">${fieldValue(bean: vocabularyTypeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: vocabularyTypeInstance, field: "definition")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vocabularyTypeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
