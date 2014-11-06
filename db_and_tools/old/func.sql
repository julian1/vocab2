
           CREATE or replace FUNCTION rdf_object( predicate_ varchar, subject_ varchar  )   
            RETURNS varchar 
			AS $$
			declare ret varchar;  
            BEGIN
                select object from _rdf where predicate = predicate_ and subject = subject_  into ret; 
				return ret;
            END;
            $$ LANGUAGE plpgsql;    


	create or replace function 
	f( a int, b int) 
	returns integer 
	as $$ 
		declare ret int;  
		begin	
			select a + b into ret; 
			return ret;      
		end 
	$$ language plpgsql; 


