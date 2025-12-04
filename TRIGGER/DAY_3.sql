

-- create 3 table 

---- note 

--->  1 learning_progress_check have mutipul
 --> learning_progress_section_check and 1 learning_progress_section_check
---> have only one video : learning_progress_video_check


-- noting mistake -- numberic(2,5), to NUMERIC(5,2), 


create table learning_progress_check(
id integer generated always as identity primary key,
user_id integer ,
course_id integer,
total_duration integer,
total_watched_time integer,
progress_percen_tage NUMERIC(5,2),
status varchar(222),
created_at timestamp,
updated_at timestamp
)

-- insert data 
insert into learning_progress_check(
user_id,
course_id,
total_duration,
total_watched_time,
progress_percen_tage,
status)
values 
(
1,
2,
400,0,0,'NOT_START'
);

-- drop table learning_progress_section_check ;

create table learning_progress_section_check(
id integer generated always as identity primary key,
user_id integer ,
course_id integer,
total_duration integer,
total_watched_time integer,
progress_percen_tage NUMERIC(5,2),
status varchar(222),
created_at timestamp,
updated_at timestamp
)

-- insert data 
insert into learning_progress_section_check(
user_id,
course_id,
total_duration,
total_watched_time,
progress_percen_tage,
status)
values 
(
1,
2,
400,0,0,'NOT_START'
);


--drop table learning_progress_video_check;

create table learning_progress_video_check(
id integer generated always as identity primary key,
user_id integer ,
course_id integer,
total_duration integer,
total_watched_time integer,
progress_percen_tage NUMERIC(5,2),
status varchar(222),
completed varchar(222),
created_at timestamp,
updated_at timestamp
)
-- insert data 
insert into learning_progress_video_check(
user_id,
course_id,
total_duration,
total_watched_time,
progress_percen_tage,
status)
values 
(
1,
1,
300,0,0,'NOT_START'
);


-- create a trigger to update created_at and updated_at 

 -- learning_progress_check || learning_progress_section_check || learning_progress_video_check \

-- 
--DROP TRIGGER trg_learning_progress_check ON learning_progress_video_check;


create or replace trigger trg_learning_progress_check 
before insert or update on learning_progress_check
for each row execute function f_update_date();


create or replace trigger trg_learning_progress_section_check
before insert or update on learning_progress_section_check
for each row execute function f_update_date();

create or replace trigger trg_learning_progress_video_check
before insert or update on learning_progress_video_check
for each row execute function f_update_date();


--- function for upate created_at and updated_at 
create or replace function f_update_date()
returns trigger 
language plpgsql 
as $function$
begin
  if TG_OP = 'INSERT' then 
      new.created_at := current_timestamp;
      new.updated_at := current_timestamp;
  else 
    new.updated_at := current_timestamp;
  end if;
 return new;
end;

$function$


-- planing to create 

-- create  trigger video_check and section_check 
--  when user update on video_check go to update the section_check and learning_check 












