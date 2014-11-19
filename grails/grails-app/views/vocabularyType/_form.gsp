<%@ page import="vocab.VocabularyType" %>



<div class="fieldcontain ${hasErrors(bean: vocabularyTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="vocabularyType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="20" required="" value="${vocabularyTypeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTypeInstance, field: 'definition', 'error')} ">
	<label for="definition">
		<g:message code="vocabularyType.definition.label" default="Definition" />
		
	</label>
	<g:textArea name="definition" cols="40" rows="5" maxlength="1010" value="${vocabularyTypeInstance?.definition}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: vocabularyTypeInstance, field: 'vocabularyTerms', 'error')} ">
	<label for="vocabularyTerms">
		<g:message code="vocabularyType.vocabularyTerms.label" default="Vocabulary Terms" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${vocabularyTypeInstance?.vocabularyTerms?}" var="v">
    <li><g:link controller="vocabularyTerm" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vocabularyTerm" action="create" params="['vocabularyType.id': vocabularyTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vocabularyTerm.label', default: 'VocabularyTerm')])}</g:link>
</li>
</ul>


</div>

