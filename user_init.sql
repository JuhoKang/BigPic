use bigpic;
    
drop table app_user_user_profile;
drop table user_profile;
drop table app_user;

create table app_user (
	id int auto_increment primary key,
    sso_id varchar(30) not null unique,
    password varchar(100) not null,
    name varchar(15) not null,
    state varchar(20) not null
);
    
create table user_profile (
	id int auto_increment primary key,
	type varchar(15) unique not null
);
    
create table app_user_user_profile (
	user_id int,
    user_profile_id int,
    foreign key (user_id) references app_user(id),
    foreign key (user_profile_id) references user_profile(id)
);

/*fixed*/
insert into user_profile (type) values ("USER");    
insert into user_profile (type) values ("ADMIN");    
insert into user_profile (type) values ("DBA");

select * from user_profile;
select * from app_user;
select * from app_user_user_profile;