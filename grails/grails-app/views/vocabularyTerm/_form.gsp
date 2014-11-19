<%@ page import="vocab.VocabularyTerm" %>



<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="vocabularyTerm.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="110" required="" value="${vocabularyTermInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'uid', 'error')} required">
	<label for="uid">
		<g:message code="vocabularyTerm.uid.label" default="Uid" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="uid" maxlength="110" required="" value="${vocabularyTermInstance?.uid}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'shortName', 'error')} ">
	<label for="shortName">
		<g:message code="vocabularyTerm.shortName.label" default="Short Name" />
		
	</label>
	<g:textField name="shortName" maxlength="110" value="${vocabularyTermInstance?.shortName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'ancillaryInformation', 'error')} ">
	<label for="ancillaryInformation">
		<g:message code="vocabularyTerm.ancillaryInformation.label" default="Ancillary Information" />
		
	</label>
	<g:textField name="ancillaryInformation" maxlength="110" value="${vocabularyTermInstance?.ancillaryInformation}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'definition', 'error')} ">
	<label for="definition">
		<g:message code="vocabularyTerm.definition.label" default="Definition" />
		
	</label>
	<g:textArea name="definition" cols="40" rows="5" maxlength="4000" value="${vocabularyTermInstance?.definition}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'alternativeTermExpression', 'error')} ">
	<label for="alternativeTermExpression">
		<g:message code="vocabularyTerm.alternativeTermExpression.label" default="Alternative Term Expression" />
		
	</label>
	<g:textField name="alternativeTermExpression" maxlength="110" value="${vocabularyTermInstance?.alternativeTermExpression}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'dateAdded', 'error')} ">
	<label for="dateAdded">
		<g:message code="vocabularyTerm.dateAdded.label" default="Date Added" />
		
	</label>
	<g:datePicker name="dateAdded" precision="day"  value="${vocabularyTermInstance?.dateAdded}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'proposalTermStatus', 'error')} ">
	<label for="proposalTermStatus">
		<g:message code="vocabularyTerm.proposalTermStatus.label" default="Proposal Term Status" />
		
	</label>
	<g:textField name="proposalTermStatus" maxlength="20" value="${vocabularyTermInstance?.proposalTermStatus}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'termStatus', 'error')} ">
	<label for="termStatus">
		<g:message code="vocabularyTerm.termStatus.label" default="Term Status" />
		
	</label>
	<g:textField name="termStatus" maxlength="20" value="${vocabularyTermInstance?.termStatus}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'dateStatusAmended', 'error')} ">
	<label for="dateStatusAmended">
		<g:message code="vocabularyTerm.dateStatusAmended.label" default="Date Status Amended" />
		
	</label>
	<g:datePicker name="dateStatusAmended" precision="day"  value="${vocabularyTermInstance?.dateStatusAmended}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'termNotes', 'error')} ">
	<label for="termNotes">
		<g:message code="vocabularyTerm.termNotes.label" default="Term Notes" />
		
	</label>
	<g:textArea name="termNotes" cols="40" rows="5" maxlength="1010" value="${vocabularyTermInstance?.termNotes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'referenceSource', 'error')} ">
	<label for="referenceSource">
		<g:message code="vocabularyTerm.referenceSource.label" default="Reference Source" />
		
	</label>
	<g:select id="referenceSource" name="referenceSource.id" from="${vocab.ReferenceSource.list()}" optionKey="id" value="${vocabularyTermInstance?.referenceSource?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'addedByPerson', 'error')} required">
	<label for="addedByPerson">
		<g:message code="vocabularyTerm.addedByPerson.label" default="Added By Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="addedByPerson" name="addedByPerson.id" from="${vocab.Person.list()}" optionKey="id" required="" value="${vocabularyTermInstance?.addedByPerson?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'amendments', 'error')} ">
	<label for="amendments">
		<g:message code="vocabularyTerm.amendments.label" default="Amendments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vocabularyTermInstance?.amendments?}" var="a">
    <li><g:link controller="amendment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="amendment" action="create" params="['vocabularyTerm.id': vocabularyTermInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'amendment.label', default: 'Amendment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'externalAssociatedTerms', 'error')} ">
	<label for="externalAssociatedTerms">
		<g:message code="vocabularyTerm.externalAssociatedTerms.label" default="External Associated Terms" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vocabularyTermInstance?.externalAssociatedTerms?}" var="e">
    <li><g:link controller="externalAssociatedTerms" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="externalAssociatedTerms" action="create" params="['vocabularyTerm.id': vocabularyTermInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'externalAssociatedTerms.label', default: 'ExternalAssociatedTerms')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'objectVocabularyTerms', 'error')} ">
	<label for="objectVocabularyTerms">
		<g:message code="vocabularyTerm.objectVocabularyTerms.label" default="Object Vocabulary Terms" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vocabularyTermInstance?.objectVocabularyTerms?}" var="o">
    <li><g:link controller="internalAssociatedTerms" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="internalAssociatedTerms" action="create" params="['vocabularyTerm.id': vocabularyTermInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'internalAssociatedTerms.label', default: 'InternalAssociatedTerms')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'proposerResponsibleParty', 'error')} required">
	<label for="proposerResponsibleParty">
		<g:message code="vocabularyTerm.proposerResponsibleParty.label" default="Proposer Responsible Party" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="proposerResponsibleParty" name="proposerResponsibleParty.id" from="${vocab.ResponsibleParty.list()}" optionKey="id" required="" value="${vocabularyTermInstance?.proposerResponsibleParty?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'subjectVocabularyTerms', 'error')} ">
	<label for="subjectVocabularyTerms">
		<g:message code="vocabularyTerm.subjectVocabularyTerms.label" default="Subject Vocabulary Terms" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vocabularyTermInstance?.subjectVocabularyTerms?}" var="s">
    <li><g:link controller="internalAssociatedTerms" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="internalAssociatedTerms" action="create" params="['vocabularyTerm.id': vocabularyTermInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'internalAssociatedTerms.label', default: 'InternalAssociatedTerms')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'termCategoryClassifications', 'error')} ">
	<label for="termCategoryClassifications">
		<g:message code="vocabularyTerm.termCategoryClassifications.label" default="Term Category Classifications" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vocabularyTermInstance?.termCategoryClassifications?}" var="t">
    <li><g:link controller="termCategoryClassification" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="termCategoryClassification" action="create" params="['vocabularyTerm.id': vocabularyTermInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'termCategoryClassification.label', default: 'TermCategoryClassification')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'vocabularyRegister', 'error')} required">
	<label for="vocabularyRegister">
		<g:message code="vocabularyTerm.vocabularyRegister.label" default="Vocabulary Register" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vocabularyRegister" name="vocabularyRegister.id" from="${vocab.VocabularyRegister.list()}" optionKey="id" required="" value="${vocabularyTermInstance?.vocabularyRegister?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTermInstance, field: 'vocabularyType', 'error')} required">
	<label for="vocabularyType">
		<g:message code="vocabularyTerm.vocabularyType.label" default="Vocabulary Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vocabularyType" name="vocabularyType.id" from="${vocab.VocabularyType.list()}" optionKey="id" required="" value="${vocabularyTermInstance?.vocabularyType?.id}" class="many-to-one"/>

</div>

