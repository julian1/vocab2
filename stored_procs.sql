

-- we need to put a unique constraint on the online_reference_resource

create or replace function reference_source_list()
returns table ( online_reference_resource varchar, citation_string varchar, organisation_acronym varchar, online_term_resource varchar, id integer)
as $$
begin
return query
  select rs.online_reference_resource, rs.citation_string, o.acronym::varchar, rs.online_term_resource, rs.id
	from reference_source rs
  left join organisation o on o.id = rs.organisation_id;
end
$$ language plpgsql;


create or replace function reference_source_select( online_reference_resource_ varchar)
returns table ( online_reference_resource varchar, citation_string varchar, organisation_acronym varchar, online_term_resource varchar, id integer)
as $$
begin
return query 
  select * 
  from reference_source_list() rsl 
  where rsl.online_reference_resource = online_reference_resource_;
end
$$ language plpgsql;


create or replace function reference_source_insert( online_reference_resource varchar, citation_string varchar, organisation_acronym varchar, online_term_resource varchar )
returns void 
as $$
declare
  organisation_id int4 ;
begin
  select o.id into organisation_id from organisation o where o.acronym = organisation_acronym; 
  if( organisation_id is null) then
    raise exception 'bad organisation acronym';
  else
    insert into reference_source( online_reference_resource, citation_string, organisation_id, online_term_resource) 
    values(  online_reference_resource, citation_string, organisation_id, online_term_resource) ;
  end if;
end
$$ language plpgsql;


create or replace function reference_source_delete( online_reference_resource_ varchar)
returns void
as $$
declare
  reference_source_id int4 ;
begin
  select id into reference_source_id from reference_source_select( online_reference_resource_ ); 
  if( reference_source_id is null) then
    raise exception 'bad reference_source uid';
  else
    delete from reference_source rs where rs.id = reference_source_id; 
  end if; 
end
$$ language plpgsql;


