<%@ page import="vocab.Amendment" %>



<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'type', 'error')} ">
	<label for="type">
		<g:message code="amendment.type.label" default="Type" />
		
	</label>
	<g:textField name="type" maxlength="50" value="${amendmentInstance?.type}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'requestDate', 'error')} ">
	<label for="requestDate">
		<g:message code="amendment.requestDate.label" default="Request Date" />
		
	</label>
	<g:datePicker name="requestDate" precision="day"  value="${amendmentInstance?.requestDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'approvalDate', 'error')} ">
	<label for="approvalDate">
		<g:message code="amendment.approvalDate.label" default="Approval Date" />
		
	</label>
	<g:datePicker name="approvalDate" precision="day"  value="${amendmentInstance?.approvalDate}" default="none" noSelection="['': '']" />

</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'responsibleParty', 'error')} required">
	<label for="responsibleParty">
		<g:message code="amendment.responsibleParty.label" default="Responsible Party" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="responsibleParty" name="responsibleParty.id" from="${vocab.ResponsibleParty.list()}" optionKey="id" required="" value="${amendmentInstance?.responsibleParty?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'vocabularyRegister', 'error')} required">
	<label for="vocabularyRegister">
		<g:message code="amendment.vocabularyRegister.label" default="Vocabulary Register" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vocabularyRegister" name="vocabularyRegister.id" from="${vocab.VocabularyRegister.list()}" optionKey="id" required="" value="${amendmentInstance?.vocabularyRegister?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: amendmentInstance, field: 'vocabularyTerm', 'error')} required">
	<label for="vocabularyTerm">
		<g:message code="amendment.vocabularyTerm.label" default="Vocabulary Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="vocabularyTerm" name="vocabularyTerm.id" from="${vocab.VocabularyTerm.list()}" optionKey="id" required="" value="${amendmentInstance?.vocabularyTerm?.id}" class="many-to-one"/>

</div>

