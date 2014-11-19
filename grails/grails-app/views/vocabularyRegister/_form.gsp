<%@ page import="vocab.VocabularyRegister" %>



<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'uid', 'error')} required">
	<label for="uid">
		<g:message code="vocabularyRegister.uid.label" default="Uid" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="uid" cols="40" rows="5" maxlength="1010" required="" value="${vocabularyRegisterInstance?.uid}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="vocabularyRegister.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="110" required="" value="${vocabularyRegisterInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'contentSummary', 'error')} ">
	<label for="contentSummary">
		<g:message code="vocabularyRegister.contentSummary.label" default="Content Summary" />
		
	</label>
	<g:textArea name="contentSummary" cols="40" rows="5" maxlength="1010" value="${vocabularyRegisterInstance?.contentSummary}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'languageName', 'error')} ">
	<label for="languageName">
		<g:message code="vocabularyRegister.languageName.label" default="Language Name" />
		
	</label>
	<g:textField name="languageName" maxlength="50" value="${vocabularyRegisterInstance?.languageName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'languageCode', 'error')} ">
	<label for="languageCode">
		<g:message code="vocabularyRegister.languageCode.label" default="Language Code" />
		
	</label>
	<g:textField name="languageCode" maxlength="10" value="${vocabularyRegisterInstance?.languageCode}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'languageCountry', 'error')} ">
	<label for="languageCountry">
		<g:message code="vocabularyRegister.languageCountry.label" default="Language Country" />
		
	</label>
	<g:textField name="languageCountry" maxlength="10" value="${vocabularyRegisterInstance?.languageCountry}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'languageEncoding', 'error')} ">
	<label for="languageEncoding">
		<g:message code="vocabularyRegister.languageEncoding.label" default="Language Encoding" />
		
	</label>
	<g:textField name="languageEncoding" maxlength="50" value="${vocabularyRegisterInstance?.languageEncoding}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'date', 'error')} ">
	<label for="date">
		<g:message code="vocabularyRegister.date.label" default="Date" />
		
	</label>
	<g:datePicker name="date" precision="day"  value="${vocabularyRegisterInstance?.date}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'dateOfLastChange', 'error')} ">
	<label for="dateOfLastChange">
		<g:message code="vocabularyRegister.dateOfLastChange.label" default="Date Of Last Change" />
		
	</label>
	<g:datePicker name="dateOfLastChange" precision="day"  value="${vocabularyRegisterInstance?.dateOfLastChange}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: '_version', 'error')} required">
	<label for="_version">
		<g:message code="vocabularyRegister._version.label" default="Version" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="_version" required="" value="${vocabularyRegisterInstance?._version}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'amendments', 'error')} ">
	<label for="amendments">
		<g:message code="vocabularyRegister.amendments.label" default="Amendments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vocabularyRegisterInstance?.amendments?}" var="a">
    <li><g:link controller="amendment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="amendment" action="create" params="['vocabularyRegister.id': vocabularyRegisterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'amendment.label', default: 'Amendment')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'managerResponsibleParty', 'error')} required">
	<label for="managerResponsibleParty">
		<g:message code="vocabularyRegister.managerResponsibleParty.label" default="Manager Responsible Party" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="managerResponsibleParty" name="managerResponsibleParty.id" from="${vocab.ResponsibleParty.list()}" optionKey="id" required="" value="${vocabularyRegisterInstance?.managerResponsibleParty?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'ownerResponsibleParty', 'error')} required">
	<label for="ownerResponsibleParty">
		<g:message code="vocabularyRegister.ownerResponsibleParty.label" default="Owner Responsible Party" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="ownerResponsibleParty" name="ownerResponsibleParty.id" from="${vocab.ResponsibleParty.list()}" optionKey="id" required="" value="${vocabularyRegisterInstance?.ownerResponsibleParty?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyRegisterInstance, field: 'vocabularyTerms', 'error')} ">
	<label for="vocabularyTerms">
		<g:message code="vocabularyRegister.vocabularyTerms.label" default="Vocabulary Terms" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vocabularyRegisterInstance?.vocabularyTerms?}" var="v">
    <li><g:link controller="vocabularyTerm" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vocabularyTerm" action="create" params="['vocabularyRegister.id': vocabularyRegisterInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vocabularyTerm.label', default: 'VocabularyTerm')])}</g:link>
</li>
</ul>


</div>

