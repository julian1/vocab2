
-- ok, so what do we do about the organisation_id ?
-- and the id.

-- cqrs - we have denormalized views.
-- the list is the and we're going to need a list.


-- I don't think we can actually denormalize it. yes we can, we just go back to the prior table
-- and use the obvious unique non-id value that's there as the primary field.

-- eg. for vocabulary_term we use the online_reference_resource rather than that tables id.

--  id                        | integer                | not null default nextval('reference_source_id_seq'::regclass)
--  citation_string           | character varying(110) |
-- online_reference_resource | character varying(200) |
--  organisation_id           | integer                |
-- online_term_resource      | character varying(110) |


drop function reference_source_list() ;


create or replace function reference_source_list()
returns table ( online_reference_resource varchar, citation_string varchar, organisation_acronym varchar, online_term_resource varchar)
as $$
begin
return query
  select rs.online_reference_resource, rs.citation_string, o.acronym::varchar, rs.online_term_resource
	from reference_source rs
  left join organisation o on o.id = rs.organisation_id;
end
$$ language plpgsql;


create or replace function reference_source_select( online_reference_resource_ varchar)
returns table ( online_reference_resource varchar, citation_string varchar, organisation_acronym varchar, online_term_resource varchar)
as $$
begin
return query 
  select * 
  from reference_source_list() rsl 
  where rsl.online_reference_resource = online_reference_resource_;
end
$$ language plpgsql;





