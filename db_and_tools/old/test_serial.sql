
CREATE or replace FUNCTION exec(text) returns text
language plpgsql volatile
AS $f$ 
    BEGIN
      EXECUTE $1; 
      RETURN $1; 
    END;
$f$;
grant all on function exec(text) to public;


drop table foo; 
drop sequence foo_a_seq; 

create table foo( a integer, b text );

insert into foo( a, b) values (3, 'hi' ) ; 

select * from foo ;

-- CREATE SEQUENCE foo_a_seq start (select max(a) from foo );
select exec( 'CREATE SEQUENCE foo_a_seq start '||(select max(a) +1 from foo )  ) ; 

ALTER TABLE foo ADD PRIMARY KEY (a);

ALTER TABLE foo ALTER COLUMN a SET DEFAULT nextval('foo_a_seq');

insert into foo( b) values ( 'hi2' ) ; 
insert into foo( b) values ( 'hi2' ) ; 
insert into foo( b) values ( 'hi2' ) ; 

select * from foo ;
