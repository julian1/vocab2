
select a.subject, r2.predicate, r2.object from 

(select
	r1.subject
from _rdf_m r1
where
	r1.predicate = 'rdf:type' and r1.object = 'skos:Concept' ) as a


left join  _rdf_m r2 on r2.subject = a.subject and r2.predicate = 'skos:broader'
where
  r2.object is null

order by a.subject

;



