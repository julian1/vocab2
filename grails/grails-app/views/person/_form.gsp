<%@ page import="vocab.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="person.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="110" value="${personInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'salutation', 'error')} ">
	<label for="salutation">
		<g:message code="person.salutation.label" default="Salutation" />
		
	</label>
	<g:textField name="salutation" maxlength="6" value="${personInstance?.salutation}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'alternatePersonNameExpression', 'error')} ">
	<label for="alternatePersonNameExpression">
		<g:message code="person.alternatePersonNameExpression.label" default="Alternate Person Name Expression" />
		
	</label>
	<g:textField name="alternatePersonNameExpression" maxlength="110" value="${personInstance?.alternatePersonNameExpression}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="person.email.label" default="Email" />
		
	</label>
	<g:textField name="email" maxlength="110" value="${personInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'contactPhoneNumber', 'error')} ">
	<label for="contactPhoneNumber">
		<g:message code="person.contactPhoneNumber.label" default="Contact Phone Number" />
		
	</label>
	<g:textField name="contactPhoneNumber" maxlength="20" value="${personInstance?.contactPhoneNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'contactMobileNumber', 'error')} ">
	<label for="contactMobileNumber">
		<g:message code="person.contactMobileNumber.label" default="Contact Mobile Number" />
		
	</label>
	<g:textField name="contactMobileNumber" maxlength="20" value="${personInstance?.contactMobileNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'responsibleParties', 'error')} ">
	<label for="responsibleParties">
		<g:message code="person.responsibleParties.label" default="Responsible Parties" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.responsibleParties?}" var="r">
    <li><g:link controller="responsibleParty" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="responsibleParty" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'responsibleParty.label', default: 'ResponsibleParty')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'vocabularyTerms', 'error')} ">
	<label for="vocabularyTerms">
		<g:message code="person.vocabularyTerms.label" default="Vocabulary Terms" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.vocabularyTerms?}" var="v">
    <li><g:link controller="vocabularyTerm" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vocabularyTerm" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vocabularyTerm.label', default: 'VocabularyTerm')])}</g:link>
</li>
</ul>


</div>

