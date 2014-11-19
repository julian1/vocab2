
<%@ page import="vocab.InternalAssociatedTerms" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'internalAssociatedTerms.label', default: 'InternalAssociatedTerms')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-internalAssociatedTerms" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-internalAssociatedTerms" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="internalAssociatedTerms.associationType.label" default="Association Type" /></th>
					
						<th><g:message code="internalAssociatedTerms.objectVocabularyTerm.label" default="Object Vocabulary Term" /></th>
					
						<th><g:message code="internalAssociatedTerms.subjectVocabularyTerm.label" default="Subject Vocabulary Term" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${internalAssociatedTermsInstanceList}" status="i" var="internalAssociatedTermsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${internalAssociatedTermsInstance.id}">${fieldValue(bean: internalAssociatedTermsInstance, field: "associationType")}</g:link></td>
					
						<td>${fieldValue(bean: internalAssociatedTermsInstance, field: "objectVocabularyTerm")}</td>
					
						<td>${fieldValue(bean: internalAssociatedTermsInstance, field: "subjectVocabularyTerm")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${internalAssociatedTermsInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
