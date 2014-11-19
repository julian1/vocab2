<%@ page import="vocab.ReferenceSource" %>



<div class="fieldcontain ${hasErrors(bean: referenceSourceInstance, field: 'citationString', 'error')} ">
	<label for="citationString">
		<g:message code="referenceSource.citationString.label" default="Citation String" />
		
	</label>
	<g:textField name="citationString" maxlength="110" value="${referenceSourceInstance?.citationString}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: referenceSourceInstance, field: 'onlineReferenceResource', 'error')} ">
	<label for="onlineReferenceResource">
		<g:message code="referenceSource.onlineReferenceResource.label" default="Online Reference Resource" />
		
	</label>
	<g:textField name="onlineReferenceResource" maxlength="200" value="${referenceSourceInstance?.onlineReferenceResource}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: referenceSourceInstance, field: 'onlineTermResource', 'error')} ">
	<label for="onlineTermResource">
		<g:message code="referenceSource.onlineTermResource.label" default="Online Term Resource" />
		
	</label>
	<g:textField name="onlineTermResource" maxlength="110" value="${referenceSourceInstance?.onlineTermResource}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: referenceSourceInstance, field: 'organisation', 'error')} required">
	<label for="organisation">
		<g:message code="referenceSource.organisation.label" default="Organisation" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="organisation" name="organisation.id" from="${vocab.Organisation.list()}" optionKey="id" optionValue="acronym" required="" value="${referenceSourceInstance?.organisation?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: referenceSourceInstance, field: 'vocabularyTerms', 'error')} ">
	<label for="vocabularyTerms">
		<g:message code="referenceSource.vocabularyTerms.label" default="Vocabulary Terms" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${referenceSourceInstance?.vocabularyTerms?}" var="v">
    <li><g:link controller="vocabularyTerm" action="show" id="${v.id}">${v?.name?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="vocabularyTerm" action="create" params="['referenceSource.id': referenceSourceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'vocabularyTerm.label', default: 'VocabularyTerm')])}</g:link>
</li>
</ul>


</div>

