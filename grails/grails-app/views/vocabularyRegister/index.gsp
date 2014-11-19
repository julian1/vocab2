
<%@ page import="vocab.VocabularyRegister" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vocabularyRegister.label', default: 'VocabularyRegister')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-vocabularyRegister" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-vocabularyRegister" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="uid" title="${message(code: 'vocabularyRegister.uid.label', default: 'Uid')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'vocabularyRegister.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="contentSummary" title="${message(code: 'vocabularyRegister.contentSummary.label', default: 'Content Summary')}" />
					
						<g:sortableColumn property="languageName" title="${message(code: 'vocabularyRegister.languageName.label', default: 'Language Name')}" />
					
						<g:sortableColumn property="languageCode" title="${message(code: 'vocabularyRegister.languageCode.label', default: 'Language Code')}" />
					
						<g:sortableColumn property="languageCountry" title="${message(code: 'vocabularyRegister.languageCountry.label', default: 'Language Country')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${vocabularyRegisterInstanceList}" status="i" var="vocabularyRegisterInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${vocabularyRegisterInstance.id}">${fieldValue(bean: vocabularyRegisterInstance, field: "uid")}</g:link></td>
					
						<td>${fieldValue(bean: vocabularyRegisterInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: vocabularyRegisterInstance, field: "contentSummary")}</td>
					
						<td>${fieldValue(bean: vocabularyRegisterInstance, field: "languageName")}</td>
					
						<td>${fieldValue(bean: vocabularyRegisterInstance, field: "languageCode")}</td>
					
						<td>${fieldValue(bean: vocabularyRegisterInstance, field: "languageCountry")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${vocabularyRegisterInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
