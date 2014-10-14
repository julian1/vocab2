





WITH RECURSIVE t( fuck ) AS (

	select  1 as fuck
	union all

	select fuck + 1 from t where fuck < 100 

	--  this doesn't seem to be used.	
)

	select  fuck from t; 




