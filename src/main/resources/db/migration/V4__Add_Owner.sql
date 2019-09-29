create table owner (
                       id int8 not null,
                       createddate timestamp,
                       is_deleted boolean not null,
                       updated_date timestamp,
                       first_name varchar(255),
                       last_name varchar(255),
                       sur_name varchar(255),
                       birth_date date,
                       primary key (id)
);