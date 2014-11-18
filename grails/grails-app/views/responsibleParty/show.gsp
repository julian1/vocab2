
<%@ page import="vocab.ResponsibleParty" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'responsibleParty.label', default: 'ResponsibleParty')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-responsibleParty" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-responsibleParty" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list responsibleParty">
			
				<g:if test="${responsiblePartyInstance?.affiliationType}">
				<li class="fieldcontain">
					<span id="affiliationType-label" class="property-label"><g:message code="responsibleParty.affiliationType.label" default="Affiliation Type" /></span>
					
						<span class="property-value" aria-labelledby="affiliationType-label"><g:link controller="affiliationType" action="show" id="${responsiblePartyInstance?.affiliationType?.id}">${responsiblePartyInstance?.affiliationType?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${responsiblePartyInstance?.organisation}">
				<li class="fieldcontain">
					<span id="organisation-label" class="property-label"><g:message code="responsibleParty.organisation.label" default="Organisation" /></span>
					
						<span class="property-value" aria-labelledby="organisation-label"><g:link controller="organisation" action="show" id="${responsiblePartyInstance?.organisation?.id}">${responsiblePartyInstance?.organisation?.acronym?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>

			
				<g:if test="${responsiblePartyInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="responsibleParty.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${responsiblePartyInstance?.person?.id}">${responsiblePartyInstance?.person?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>


				<g:if test="${responsiblePartyInstance?.amendments}">
				<li class="fieldcontain">
					<span id="amendments-label" class="property-label"><g:message code="responsibleParty.amendments.label" default="Amendments" /></span>
					
						<g:each in="${responsiblePartyInstance.amendments}" var="a">
						<span class="property-value" aria-labelledby="amendments-label"><g:link controller="amendment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${responsiblePartyInstance?.classificationSchemes}">
				<li class="fieldcontain">
					<span id="classificationSchemes-label" class="property-label"><g:message code="responsibleParty.classificationSchemes.label" default="Classification Schemes" /></span>
					
						<g:each in="${responsiblePartyInstance.classificationSchemes}" var="c">
						<span class="property-value" aria-labelledby="classificationSchemes-label"><g:link controller="classificationScheme" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${responsiblePartyInstance?.managerResponsiblePartys}">
				<li class="fieldcontain">
					<span id="managerResponsiblePartys-label" class="property-label"><g:message code="responsibleParty.managerResponsiblePartys.label" default="Manager Responsible Partys" /></span>
					
						<g:each in="${responsiblePartyInstance.managerResponsiblePartys}" var="m">
						<span class="property-value" aria-labelledby="managerResponsiblePartys-label"><g:link controller="vocabularyRegister" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

			
				<g:if test="${responsiblePartyInstance?.ownerResponsiblePartys}">
				<li class="fieldcontain">
					<span id="ownerResponsiblePartys-label" class="property-label"><g:message code="responsibleParty.ownerResponsiblePartys.label" default="Owner Responsible Partys" /></span>
					
						<g:each in="${responsiblePartyInstance.ownerResponsiblePartys}" var="o">
						<span class="property-value" aria-labelledby="ownerResponsiblePartys-label"><g:link controller="vocabularyRegister" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>

			
				<g:if test="${responsiblePartyInstance?.vocabularyTerms}">
				<li class="fieldcontain">
					<span id="vocabularyTerms-label" class="property-label"><g:message code="responsibleParty.vocabularyTerms.label" default="Vocabulary Terms" /></span>
					
						<g:each in="${responsiblePartyInstance.vocabularyTerms}" var="v">
						<span class="property-value" aria-labelledby="vocabularyTerms-label"><g:link controller="vocabularyTerm" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:responsiblePartyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${responsiblePartyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
