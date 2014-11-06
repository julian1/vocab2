
drop table audit_trail;

CREATE TABLE audit_trail (
old_email TEXT NOT NULL,
new_email TEXT NOT NULL
); 

INSERT INTO audit_trail(old_email, new_email)
VALUES ('harold_gim@yahoo.com', 'hgimenez@hotmail.com'),
('hgimenez@hotmail.com', 'harold.gimenez@gmail.com'),
('harold.gimenez@gmail.com', 'harold@heroku.com'),
('foo@bar.com', 'bar@baz.com'),
('bar@baz.com', 'barbaz@gmail.com'); 




WITH RECURSIVE all_emails AS (
SELECT old_email, new_email
FROM audit_trail
WHERE old_email = 'harold_gim@yahoo.com'
UNION
SELECT at.old_email, at.new_email
FROM audit_trail at
JOIN all_emails a
ON (at.old_email = a.new_email)
)
SELECT * FROM all_emails; 


-- 


-- recursive is good for tracing out all values, but what we want is just the root. 
-- issue is that there are multiple roots. 
-- so we should be able to do it, by querying everything in the chain, 
-- and then a filter. 
 


-- i think we have to handle this another way ...
-- so that if the table is empty then we coallesce the input then 


