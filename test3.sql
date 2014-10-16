

select
	r1.subject, r2.predicate, r2.object
from _rdf_m r1
left join _rdf_m r2 on r2.subject = r1.subject  and r2.predicate = 'skos:broader' 

where
	r1.predicate = 'rdf:type' and r1.object = 'skos:Concept'
	and r2.object is null

--	and r2.predicate = 'rdf:broader' and r2.object is null

order by r1.subject
; 


