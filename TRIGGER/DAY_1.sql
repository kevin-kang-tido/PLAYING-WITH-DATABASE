
-- Here is the testing part 

-- create a simple user

--drop table users;

create table users (
id integer generated always as identity primary key,
name varchar(155),
email varchar(100),
updated_at timestamp
)

-- add new column for testing 
alter table users  
add user_logs varchar(155);

-- Create a script to update the timestamp
--  insert of update the user table 
create trigger update_user_timealter 
before insert or update on users
for each row
execute function user_update_time();

-- Testing create another trigger 
create trigger tr_user_logs
before insert or update on users
for each row
execute function f_play_user_logs();

create or replace function f_play_user_logs()
returns trigger as $$ 
begin
    new.user_logs := COALESCE(new.name,'') || '|' || COALESCE(new.email,'');
    return new;
end;
$$ LANGUAGE plpgsql;


create function user_update_time()
returns trigger as $$ 
begin 
	new.updated_at := CURRENT_TIMESTAMP;
    return new;
end;
$$ LANGUAGE plpgsql;


-- try to testing with insert 
insert into users(name,email) values
('kevin tido','kevintido@gmail.com');

-- try to testing insert a new one 
insert into users(name,email) 
values 
('koko','koko@gmail.com');
	












