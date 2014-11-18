<%@ page import="vocab.ResponsibleParty" %>



<div class="fieldcontain ${hasErrors(bean: responsiblePartyInstance, field: 'affiliationType', 'error')} required">
	<label for="affiliationType">
		<g:message code="responsibleParty.affiliationType.label" default="Affiliation Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="affiliationType" name="affiliationType.id" from="${vocab.AffiliationType.list()}" optionKey="id" optionValue="name" required="" value="${responsiblePartyInstance?.affiliationType?.id}" class="many-to-one"/>

</div>


<div class="fieldcontain ${hasErrors(bean: responsiblePartyInstance, field: 'organisation', 'error')} required">
	<label for="organisation">
		<g:message code="responsibleParty.organisation.label" default="Organisation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="organisation" name="organisation.id" from="${vocab.Organisation.list()}" optionKey="id" optionValue="acronym" required="" value="${responsiblePartyInstance?.organisation?.id}" class="many-to-one"/>

</div>



<div class="fieldcontain ${hasErrors(bean: responsiblePartyInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="responsibleParty.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${vocab.Person.list()}" optionKey="id" optionValue="name" required="" value="${responsiblePartyInstance?.person?.id}" class="many-to-one"/>

</div>


<div class="fieldcontain ${hasErrors(bean: responsiblePartyInstance, field: 'amendments', 'error')} ">
	<label for="amendments">
		<g:message code="responsibleParty.amendments.label" default="Amendments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${responsiblePartyInstance?.amendments?}" var="a">
    <li><g:link controller="amendment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="amendment" action="create" params="['responsibleParty.id': responsiblePartyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'amendment.label', default: 'Amendment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: responsiblePartyInstance, field: 'classificationSchemes', 'error')} ">
	<label for="classificationSchemes">
		<g:message code="responsibleParty.classificationSchemes.label" default="Classification Schemes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${responsiblePartyInstance?.classificationSchemes?}" var="c">
    <li><g:link controller="classificationScheme" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="classificationScheme" action="create" params="['responsibleParty.id': responsiblePartyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'classificationScheme.label', default: 'ClassificationScheme')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: responsiblePartyInstance, field: 'managerResponsiblePartys', 'error')} ">
	<label for="managerResponsiblePartys">
		<g:message code="responsibleParty.managerResponsiblePartys.label" default="Manager Responsible Partys" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${responsiblePartyInstance?.managerResponsiblePartys?}" var="m">
    <li><g:link controller="vocabularyRegister" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vocabularyRegister" action="create" params="['responsibleParty.id': responsiblePartyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vocabularyRegister.label', default: 'VocabularyRegister')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: responsiblePartyInstance, field: 'ownerResponsiblePartys', 'error')} ">
	<label for="ownerResponsiblePartys">
		<g:message code="responsibleParty.ownerResponsiblePartys.label" default="Owner Responsible Partys" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${responsiblePartyInstance?.ownerResponsiblePartys?}" var="o">
    <li><g:link controller="vocabularyRegister" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vocabularyRegister" action="create" params="['responsibleParty.id': responsiblePartyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vocabularyRegister.label', default: 'VocabularyRegister')])}</g:link>
</li>
</ul>


</div>


<div class="fieldcontain ${hasErrors(bean: responsiblePartyInstance, field: 'vocabularyTerms', 'error')} ">
	<label for="vocabularyTerms">
		<g:message code="responsibleParty.vocabularyTerms.label" default="Vocabulary Terms" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${responsiblePartyInstance?.vocabularyTerms?}" var="v">
    <li><g:link controller="vocabularyTerm" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vocabularyTerm" action="create" params="['responsibleParty.id': responsiblePartyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vocabularyTerm.label', default: 'VocabularyTerm')])}</g:link>
</li>
</ul>


</div>

