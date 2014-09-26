

select a.attname,  pg_get_constraintdef(c2.oid, true)
from pg_attribute a 
	-- left join pg_constraint c on c.conrelid = a.attrelid

LEFT JOIN pg_constraint c2 ON (c2.conrelid = a.attrelid
AND (c2.conkey[1] = a.attnum 
OR c2.conkey[2] = a.attnum OR c2.conkey[3] = a.attnum 
OR c2.conkey[4] = a.attnum OR c2.conkey[5] = a.attnum 
OR c2.conkey[6] = a.attnum) OR c2.conkey[7] = a.attnum 
OR c2.conkey[8] = a.attnum) 

-- select  pg_catalog.pg_get_constraintdef(r.oid, true) from  pg_catalog.pg_constraint r ;


