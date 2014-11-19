
<%@ page import="vocab.ExternalAssociatedTerms" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'externalAssociatedTerms.label', default: 'ExternalAssociatedTerms')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-externalAssociatedTerms" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-externalAssociatedTerms" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="uid" title="${message(code: 'externalAssociatedTerms.uid.label', default: 'Uid')}" />
					
						<th><g:message code="externalAssociatedTerms.associationType.label" default="Association Type" /></th>
					
						<th><g:message code="externalAssociatedTerms.vocabularyTerm.label" default="Vocabulary Term" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${externalAssociatedTermsInstanceList}" status="i" var="externalAssociatedTermsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${externalAssociatedTermsInstance.id}">${fieldValue(bean: externalAssociatedTermsInstance, field: "uid")}</g:link></td>
					
						<td>${fieldValue(bean: externalAssociatedTermsInstance, field: "associationType")}</td>
					
						<td>${fieldValue(bean: externalAssociatedTermsInstance, field: "vocabularyTerm")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${externalAssociatedTermsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
