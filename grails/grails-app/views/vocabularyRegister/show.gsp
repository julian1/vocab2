
<%@ page import="vocab.VocabularyRegister" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vocabularyRegister.label', default: 'VocabularyRegister')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vocabularyRegister" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vocabularyRegister" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vocabularyRegister">
			
				<g:if test="${vocabularyRegisterInstance?.uid}">
				<li class="fieldcontain">
					<span id="uid-label" class="property-label"><g:message code="vocabularyRegister.uid.label" default="Uid" /></span>
					
						<span class="property-value" aria-labelledby="uid-label"><g:fieldValue bean="${vocabularyRegisterInstance}" field="uid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="vocabularyRegister.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${vocabularyRegisterInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.contentSummary}">
				<li class="fieldcontain">
					<span id="contentSummary-label" class="property-label"><g:message code="vocabularyRegister.contentSummary.label" default="Content Summary" /></span>
					
						<span class="property-value" aria-labelledby="contentSummary-label"><g:fieldValue bean="${vocabularyRegisterInstance}" field="contentSummary"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.languageName}">
				<li class="fieldcontain">
					<span id="languageName-label" class="property-label"><g:message code="vocabularyRegister.languageName.label" default="Language Name" /></span>
					
						<span class="property-value" aria-labelledby="languageName-label"><g:fieldValue bean="${vocabularyRegisterInstance}" field="languageName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.languageCode}">
				<li class="fieldcontain">
					<span id="languageCode-label" class="property-label"><g:message code="vocabularyRegister.languageCode.label" default="Language Code" /></span>
					
						<span class="property-value" aria-labelledby="languageCode-label"><g:fieldValue bean="${vocabularyRegisterInstance}" field="languageCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.languageCountry}">
				<li class="fieldcontain">
					<span id="languageCountry-label" class="property-label"><g:message code="vocabularyRegister.languageCountry.label" default="Language Country" /></span>
					
						<span class="property-value" aria-labelledby="languageCountry-label"><g:fieldValue bean="${vocabularyRegisterInstance}" field="languageCountry"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.languageEncoding}">
				<li class="fieldcontain">
					<span id="languageEncoding-label" class="property-label"><g:message code="vocabularyRegister.languageEncoding.label" default="Language Encoding" /></span>
					
						<span class="property-value" aria-labelledby="languageEncoding-label"><g:fieldValue bean="${vocabularyRegisterInstance}" field="languageEncoding"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="vocabularyRegister.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${vocabularyRegisterInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.dateOfLastChange}">
				<li class="fieldcontain">
					<span id="dateOfLastChange-label" class="property-label"><g:message code="vocabularyRegister.dateOfLastChange.label" default="Date Of Last Change" /></span>
					
						<span class="property-value" aria-labelledby="dateOfLastChange-label"><g:formatDate date="${vocabularyRegisterInstance?.dateOfLastChange}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?._version}">
				<li class="fieldcontain">
					<span id="_version-label" class="property-label"><g:message code="vocabularyRegister._version.label" default="Version" /></span>
					
						<span class="property-value" aria-labelledby="_version-label"><g:fieldValue bean="${vocabularyRegisterInstance}" field="_version"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.amendments}">
				<li class="fieldcontain">
					<span id="amendments-label" class="property-label"><g:message code="vocabularyRegister.amendments.label" default="Amendments" /></span>
					
						<g:each in="${vocabularyRegisterInstance.amendments}" var="a">
						<span class="property-value" aria-labelledby="amendments-label"><g:link controller="amendment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.managerResponsibleParty}">
				<li class="fieldcontain">
					<span id="managerResponsibleParty-label" class="property-label"><g:message code="vocabularyRegister.managerResponsibleParty.label" default="Manager Responsible Party" /></span>
					
						<span class="property-value" aria-labelledby="managerResponsibleParty-label"><g:link controller="responsibleParty" action="show" id="${vocabularyRegisterInstance?.managerResponsibleParty?.id}">${
		( vocabularyRegisterInstance?.managerResponsibleParty?.person?.name 
		+ ' ' + vocabularyRegisterInstance?.managerResponsibleParty?.affiliationType?.name 
		+ ' ' + vocabularyRegisterInstance?.managerResponsibleParty?.organisation?.acronym ) .encodeAsHTML()
		}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.ownerResponsibleParty}">
				<li class="fieldcontain">
					<span id="ownerResponsibleParty-label" class="property-label"><g:message code="vocabularyRegister.ownerResponsibleParty.label" default="Owner Responsible Party" /></span>
					
						<span class="property-value" aria-labelledby="ownerResponsibleParty-label"><g:link controller="responsibleParty" action="show" id="${vocabularyRegisterInstance?.ownerResponsibleParty?.id}">${
		( vocabularyRegisterInstance?.ownerResponsibleParty?.person?.name 
		+ ' ' + vocabularyRegisterInstance?.ownerResponsibleParty?.affiliationType?.name 
		+ ' ' + vocabularyRegisterInstance?.ownerResponsibleParty?.organisation?.acronym ) .encodeAsHTML()
		}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyRegisterInstance?.vocabularyTerms}">
				<li class="fieldcontain">
					<span id="vocabularyTerms-label" class="property-label"><g:message code="vocabularyRegister.vocabularyTerms.label" default="Vocabulary Terms" /></span>
					
						<g:each in="${vocabularyRegisterInstance.vocabularyTerms}" var="v">
						<span class="property-value" aria-labelledby="vocabularyTerms-label"><g:link controller="vocabularyTerm" action="show" id="${v.id}">${v?.name?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:vocabularyRegisterInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${vocabularyRegisterInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
