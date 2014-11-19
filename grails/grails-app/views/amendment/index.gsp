
<%@ page import="vocab.Amendment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'amendment.label', default: 'Amendment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-amendment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-amendment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="type" title="${message(code: 'amendment.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="requestDate" title="${message(code: 'amendment.requestDate.label', default: 'Request Date')}" />
					
						<g:sortableColumn property="approvalDate" title="${message(code: 'amendment.approvalDate.label', default: 'Approval Date')}" />
					
						<th><g:message code="amendment.responsibleParty.label" default="Responsible Party" /></th>
					
						<th><g:message code="amendment.vocabularyRegister.label" default="Vocabulary Register" /></th>
					
						<th><g:message code="amendment.vocabularyTerm.label" default="Vocabulary Term" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${amendmentInstanceList}" status="i" var="amendmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${amendmentInstance.id}">${fieldValue(bean: amendmentInstance, field: "type")}</g:link></td>
					
						<td><g:formatDate date="${amendmentInstance.requestDate}" /></td>
					
						<td><g:formatDate date="${amendmentInstance.approvalDate}" /></td>
					
						<td>${fieldValue(bean: amendmentInstance, field: "responsibleParty")}</td>
					
						<td>${fieldValue(bean: amendmentInstance, field: "vocabularyRegister")}</td>
					
						<td>${fieldValue(bean: amendmentInstance, field: "vocabularyTerm")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${amendmentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
