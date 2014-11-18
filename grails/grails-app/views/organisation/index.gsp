
<%@ page import="vocab.Organisation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organisation.label', default: 'Organisation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-organisation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-organisation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'organisation.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'organisation.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="acronym" title="${message(code: 'organisation.acronym.label', default: 'Acronym')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'organisation.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'organisation.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="notes" title="${message(code: 'organisation.notes.label', default: 'Notes')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${organisationInstanceList}" status="i" var="organisationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${organisationInstance.id}">${fieldValue(bean: organisationInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: organisationInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: organisationInstance, field: "acronym")}</td>
					
						<td>${fieldValue(bean: organisationInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: organisationInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: organisationInstance, field: "notes")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${organisationInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
