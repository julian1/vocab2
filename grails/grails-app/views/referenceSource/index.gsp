
<%@ page import="vocab.ReferenceSource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'referenceSource.label', default: 'ReferenceSource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-referenceSource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-referenceSource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="citationString" title="${message(code: 'referenceSource.citationString.label', default: 'Citation String')}" />
					
						<g:sortableColumn property="onlineReferenceResource" title="${message(code: 'referenceSource.onlineReferenceResource.label', default: 'Online Reference Resource')}" />
					
						<g:sortableColumn property="onlineTermResource" title="${message(code: 'referenceSource.onlineTermResource.label', default: 'Online Term Resource')}" />
					
						<th><g:message code="referenceSource.organisation.label" default="Organisation" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${referenceSourceInstanceList}" status="i" var="referenceSourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${referenceSourceInstance.id}">${fieldValue(bean: referenceSourceInstance, field: "citationString")}</g:link></td>
					
						<td>${fieldValue(bean: referenceSourceInstance, field: "onlineReferenceResource")}</td>
					
						<td>${fieldValue(bean: referenceSourceInstance, field: "onlineTermResource")}</td>
					
						<td>${fieldValue(bean: referenceSourceInstance, field: "organisation")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${referenceSourceInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
