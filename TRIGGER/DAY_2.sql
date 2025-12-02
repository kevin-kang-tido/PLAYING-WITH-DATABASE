
 
--- playing with sql scipt day 2

-- drop table user_profile;

create table user_profile(
id integer generated always as identity primary key,
first_name varchar(200),
last_name varchar(200),
user_name varchar(400),
position varchar(200),
created_at timestamp,
updated_at timestamp
);

-- adding a new colum 

alter table user_profile
add column salary integer; 
-- alter table tabe_name add column new_one data_type ;
alter table user_profile
add column test_1 varchar(200)

alter table user_profile 
add column age int;

-- insert data to table user_profile 


insert into user_profile (first_name,last_name,user_name )
values
('messi333','10','messi 10');

-- create a trigger 

create or replace trigger tr_auto_set
before insert or update on user_profile
for each row 
execute function f_update_time();

----
create or replace function f_update_time()
returns trigger as $$
begin 
	if TG_OP = 'INSERT' then
	   new.created_at := current_timestamp;
    end if;
    -- updated at 
    new.updated_at := current_timestamp;
    new.position := 'IT';
    new.salary := 100000;
    new.test_1 := 'Just chill bro';
    new.age    := 18;
   return new ;
end;
$$ language plpgsql;
