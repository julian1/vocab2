
<%@ page import="vocab.ResponsibleParty" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'responsibleParty.label', default: 'ResponsibleParty')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-responsibleParty" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-responsibleParty" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="responsibleParty.person.label" default="Person" /></th>

						<th><g:message code="responsibleParty.organisation.label" default="Organisation" /></th>
					
						<th><g:message code="responsibleParty.affiliationType.label" default="Affiliation Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${responsiblePartyInstanceList}" status="i" var="responsiblePartyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${responsiblePartyInstance.id}">${fieldValue(bean: responsiblePartyInstance, field: "person.name")}</g:link></td>
					
						<td>${fieldValue(bean: responsiblePartyInstance, field: "organisation.acronym")}</td>
					
						<td>${fieldValue(bean: responsiblePartyInstance, field: "affiliationType.name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${responsiblePartyInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
