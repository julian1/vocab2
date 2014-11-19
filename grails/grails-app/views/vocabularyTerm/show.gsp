
<%@ page import="vocab.VocabularyTerm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'vocabularyTerm.label', default: 'VocabularyTerm')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-vocabularyTerm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-vocabularyTerm" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list vocabularyTerm">
			
				<g:if test="${vocabularyTermInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="vocabularyTerm.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${vocabularyTermInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.uid}">
				<li class="fieldcontain">
					<span id="uid-label" class="property-label"><g:message code="vocabularyTerm.uid.label" default="Uid" /></span>
					
						<span class="property-value" aria-labelledby="uid-label"><g:fieldValue bean="${vocabularyTermInstance}" field="uid"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.shortName}">
				<li class="fieldcontain">
					<span id="shortName-label" class="property-label"><g:message code="vocabularyTerm.shortName.label" default="Short Name" /></span>
					
						<span class="property-value" aria-labelledby="shortName-label"><g:fieldValue bean="${vocabularyTermInstance}" field="shortName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.ancillaryInformation}">
				<li class="fieldcontain">
					<span id="ancillaryInformation-label" class="property-label"><g:message code="vocabularyTerm.ancillaryInformation.label" default="Ancillary Information" /></span>
					
						<span class="property-value" aria-labelledby="ancillaryInformation-label"><g:fieldValue bean="${vocabularyTermInstance}" field="ancillaryInformation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.definition}">
				<li class="fieldcontain">
					<span id="definition-label" class="property-label"><g:message code="vocabularyTerm.definition.label" default="Definition" /></span>
					
						<span class="property-value" aria-labelledby="definition-label"><g:fieldValue bean="${vocabularyTermInstance}" field="definition"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.alternativeTermExpression}">
				<li class="fieldcontain">
					<span id="alternativeTermExpression-label" class="property-label"><g:message code="vocabularyTerm.alternativeTermExpression.label" default="Alternative Term Expression" /></span>
					
						<span class="property-value" aria-labelledby="alternativeTermExpression-label"><g:fieldValue bean="${vocabularyTermInstance}" field="alternativeTermExpression"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.dateAdded}">
				<li class="fieldcontain">
					<span id="dateAdded-label" class="property-label"><g:message code="vocabularyTerm.dateAdded.label" default="Date Added" /></span>
					
						<span class="property-value" aria-labelledby="dateAdded-label"><g:formatDate date="${vocabularyTermInstance?.dateAdded}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.proposalTermStatus}">
				<li class="fieldcontain">
					<span id="proposalTermStatus-label" class="property-label"><g:message code="vocabularyTerm.proposalTermStatus.label" default="Proposal Term Status" /></span>
					
						<span class="property-value" aria-labelledby="proposalTermStatus-label"><g:fieldValue bean="${vocabularyTermInstance}" field="proposalTermStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.termStatus}">
				<li class="fieldcontain">
					<span id="termStatus-label" class="property-label"><g:message code="vocabularyTerm.termStatus.label" default="Term Status" /></span>
					
						<span class="property-value" aria-labelledby="termStatus-label"><g:fieldValue bean="${vocabularyTermInstance}" field="termStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.dateStatusAmended}">
				<li class="fieldcontain">
					<span id="dateStatusAmended-label" class="property-label"><g:message code="vocabularyTerm.dateStatusAmended.label" default="Date Status Amended" /></span>
					
						<span class="property-value" aria-labelledby="dateStatusAmended-label"><g:formatDate date="${vocabularyTermInstance?.dateStatusAmended}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.termNotes}">
				<li class="fieldcontain">
					<span id="termNotes-label" class="property-label"><g:message code="vocabularyTerm.termNotes.label" default="Term Notes" /></span>
					
						<span class="property-value" aria-labelledby="termNotes-label"><g:fieldValue bean="${vocabularyTermInstance}" field="termNotes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.referenceSource}">
				<li class="fieldcontain">
					<span id="referenceSource-label" class="property-label"><g:message code="vocabularyTerm.referenceSource.label" default="Reference Source" /></span>
					
						<span class="property-value" aria-labelledby="referenceSource-label"><g:link controller="referenceSource" action="show" id="${vocabularyTermInstance?.referenceSource?.id}">${vocabularyTermInstance?.referenceSource?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.addedByPerson}">
				<li class="fieldcontain">
					<span id="addedByPerson-label" class="property-label"><g:message code="vocabularyTerm.addedByPerson.label" default="Added By Person" /></span>
					
						<span class="property-value" aria-labelledby="addedByPerson-label"><g:link controller="person" action="show" id="${vocabularyTermInstance?.addedByPerson?.id}">${vocabularyTermInstance?.addedByPerson?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.amendments}">
				<li class="fieldcontain">
					<span id="amendments-label" class="property-label"><g:message code="vocabularyTerm.amendments.label" default="Amendments" /></span>
					
						<g:each in="${vocabularyTermInstance.amendments}" var="a">
						<span class="property-value" aria-labelledby="amendments-label"><g:link controller="amendment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.externalAssociatedTerms}">
				<li class="fieldcontain">
					<span id="externalAssociatedTerms-label" class="property-label"><g:message code="vocabularyTerm.externalAssociatedTerms.label" default="External Associated Terms" /></span>
					
						<g:each in="${vocabularyTermInstance.externalAssociatedTerms}" var="e">
						<span class="property-value" aria-labelledby="externalAssociatedTerms-label"><g:link controller="externalAssociatedTerms" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.objectVocabularyTerms}">
				<li class="fieldcontain">
					<span id="objectVocabularyTerms-label" class="property-label"><g:message code="vocabularyTerm.objectVocabularyTerms.label" default="Object Vocabulary Terms" /></span>
					
						<g:each in="${vocabularyTermInstance.objectVocabularyTerms}" var="o">
						<span class="property-value" aria-labelledby="objectVocabularyTerms-label"><g:link controller="internalAssociatedTerms" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.proposerResponsibleParty}">
				<li class="fieldcontain">
					<span id="proposerResponsibleParty-label" class="property-label"><g:message code="vocabularyTerm.proposerResponsibleParty.label" default="Proposer Responsible Party" /></span>
					
						<span class="property-value" aria-labelledby="proposerResponsibleParty-label"><g:link controller="responsibleParty" action="show" id="${vocabularyTermInstance?.proposerResponsibleParty?.id}">${vocabularyTermInstance?.proposerResponsibleParty?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.subjectVocabularyTerms}">
				<li class="fieldcontain">
					<span id="subjectVocabularyTerms-label" class="property-label"><g:message code="vocabularyTerm.subjectVocabularyTerms.label" default="Subject Vocabulary Terms" /></span>
					
						<g:each in="${vocabularyTermInstance.subjectVocabularyTerms}" var="s">
						<span class="property-value" aria-labelledby="subjectVocabularyTerms-label"><g:link controller="internalAssociatedTerms" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.termCategoryClassifications}">
				<li class="fieldcontain">
					<span id="termCategoryClassifications-label" class="property-label"><g:message code="vocabularyTerm.termCategoryClassifications.label" default="Term Category Classifications" /></span>
					
						<g:each in="${vocabularyTermInstance.termCategoryClassifications}" var="t">
						<span class="property-value" aria-labelledby="termCategoryClassifications-label"><g:link controller="termCategoryClassification" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.vocabularyRegister}">
				<li class="fieldcontain">
					<span id="vocabularyRegister-label" class="property-label"><g:message code="vocabularyTerm.vocabularyRegister.label" default="Vocabulary Register" /></span>
					
						<span class="property-value" aria-labelledby="vocabularyRegister-label"><g:link controller="vocabularyRegister" action="show" id="${vocabularyTermInstance?.vocabularyRegister?.id}">${vocabularyTermInstance?.vocabularyRegister?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${vocabularyTermInstance?.vocabularyType}">
				<li class="fieldcontain">
					<span id="vocabularyType-label" class="property-label"><g:message code="vocabularyTerm.vocabularyType.label" default="Vocabulary Type" /></span>
					
						<span class="property-value" aria-labelledby="vocabularyType-label"><g:link controller="vocabularyType" action="show" id="${vocabularyTermInstance?.vocabularyType?.id}">${vocabularyTermInstance?.vocabularyType?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:vocabularyTermInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${vocabularyTermInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
