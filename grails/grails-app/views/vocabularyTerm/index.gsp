
<%@ page import="vocab.VocabularyTerm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vocabularyTerm.label', default: 'VocabularyTerm')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vocabularyTerm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vocabularyTerm" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'vocabularyTerm.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="uid" title="${message(code: 'vocabularyTerm.uid.label', default: 'Uid')}" />
					
						<g:sortableColumn property="shortName" title="${message(code: 'vocabularyTerm.shortName.label', default: 'Short Name')}" />
					
						<g:sortableColumn property="ancillaryInformation" title="${message(code: 'vocabularyTerm.ancillaryInformation.label', default: 'Ancillary Information')}" />
					
						<g:sortableColumn property="definition" title="${message(code: 'vocabularyTerm.definition.label', default: 'Definition')}" />
					
						<g:sortableColumn property="alternativeTermExpression" title="${message(code: 'vocabularyTerm.alternativeTermExpression.label', default: 'Alternative Term Expression')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vocabularyTermInstanceList}" status="i" var="vocabularyTermInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vocabularyTermInstance.id}">${fieldValue(bean: vocabularyTermInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: vocabularyTermInstance, field: "uid")}</td>
					
						<td>${fieldValue(bean: vocabularyTermInstance, field: "shortName")}</td>
					
						<td>${fieldValue(bean: vocabularyTermInstance, field: "ancillaryInformation")}</td>
					
						<td>${fieldValue(bean: vocabularyTermInstance, field: "definition")}</td>
					
						<td>${fieldValue(bean: vocabularyTermInstance, field: "alternativeTermExpression")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vocabularyTermInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
