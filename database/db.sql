CREATE DATABASE database_demo;

USE database_demo;


CREATE TABLE users(
    id INT(10) NOT NULL ,
    username INT(10) NOT NULL,
    password VARCHAR(100) NOT NULL,
    fullname VARCHAR(50) NOT NULL,
    page VARCHAR(25) NOT NULL,
    rol VARCHAR(50) NOT NULL
);

ALTER TABLE users
ADD PRIMARY KEY(id);

ALTER TABLE users
MODIFY id INT(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2 ;

CREATE TABLE averias(
    id INT(10) NOT NULL,
    fecha date current_timestamp	NOT NULL,
    creation_date VARCHAR(20) NOT NULL,
    num_machine VARCHAR(5) NOT NULL,
    num_ope INT(10) ,
    turno VARCHAR(16) NOT NULL,
    op_mantto INT(10) NOT NULL,
    start_time TIME NOT NULL,
    start_date VARCHAR(50) NOT NULL,
    arrival_time TIME NOT NULL,
    sub_time TIME NOT NULL,
    canceled_time TIME NOT NULL,
    opening_time TIME NOT NULL,
    end_time TIME NOT NULL,
    total_time TIME NOT NULL,
    type_break VARCHAR(80) NOT NULL,
    user_id INT(10) NOT NULL,
    description text
);

CREATE TABLE averias_canceladas(
    id INT(10) NOT NULL,
    creation_date VARCHAR(20) NOT NULL,
    num_machine VARCHAR(5) NOT NULL,
    num_ope INT(10) ,
    turno VARCHAR(16) NOT NULL,
    op_mantto INT(10) NOT NULL,
    start_time TIME NOT NULL,
    start_date VARCHAR(50) NOT NULL,
    arrival_time TIME NOT NULL,
    sub_time TIME NOT NULL,
    canceled_time TIME NOT NULL,
    opening_time TIME NOT NULL,
    end_time TIME NOT NULL,
    total_time TIME NOT NULL,
    type_break VARCHAR(80) NOT NULL,
    user_id INT(10) NOT NULL
);

CREATE TABLE averias_cerradas(
    id INT(10) NOT NULL,
    creation_date VARCHAR(20) NOT NULL,
    num_machine VARCHAR(5) NOT NULL,
    num_ope INT(10) ,
    turno VARCHAR(16) NOT NULL,
    op_mantto INT(10) NOT NULL,
    start_time TIME NOT NULL,
    start_date VARCHAR(50) NOT NULL,
    arrival_time TIME NOT NULL,
    sub_time TIME NOT NULL,
    canceled_time TIME NOT NULL,
    opening_time TIME NOT NULL,
    end_time TIME NOT NULL,
    total_time TIME NOT NULL,
    type_break VARCHAR(80) NOT NULL,
    user_id INT(10) NOT NULL,
    description text
);

CREATE TABLE averias(
    id INT(10) NOT NULL,
    creation_date VARCHAR(20) NOT NULL,
    num_machine VARCHAR(5) NOT NULL,
    num_ope INT(10) ,
    turno VARCHAR(16) NOT NULL,
    op_mantto INT(10) NOT NULL,
    num_super INT(10) NOT NULL,
    start_time TIME NOT NULL,
    start_date VARCHAR(50) NOT NULL,
    arrival_time TIME NOT NULL,
    opening_time TIME NOT NULL,
    end_time TIME NOT NULL,
    type_break VARCHAR(80) NOT NULL,
    user_id INT(5) NOT NULL,
    mantto_id INT(5) NOT NULL,
    description text NOT NUL
);

CREATE TABLE incidencias(
    id INT(10) NOT NULL,
    creation_date VARCHAR(20) NOT NULL,
    num_machine VARCHAR(5) NOT NULL,
    num_ope INT(10) ,
    turno VARCHAR(16) NOT NULL,
    op_mantto INT(10) NOT NULL,
    num_super INT(10) NOT NULL,
    start_time TIME NOT NULL,
    start_date VARCHAR(50) NOT NULL,
    end_time TIME NOT NULL,
    type_break VARCHAR(80) NOT NULL,
    user_id INT(10) NOT NULL,
    description text
);


 DESCRIBE maquinas_averias;
 
"" : 100, "3:00-4:00pm": 400, "4:00-5:00pm": 500, "5:00-6:00pm": 100, "6:00-7:00pm": 800, "7:00-8:00pm": 200,"8:00-9:00pm": 900,"9:00-10:00pm": 500,"10:00-11:00pm": 100 
 CREATE TABLE produccion(
    id INT(5) NOT NULL,
    num_machine VARCHAR(5) NOT NULL,
    turno VARCHAR(55) NOT NULL,
    hora_1 INT(5) NOT NULL,
    hora_2 INT(5) NOT NULL,
    hora_3 INT(5) NOT NULL,
    hora_4 INT(5) NOT NULL,
    hora_5 INT(5) NOT NULL,
    hora_6 INT(5) NOT NULL,
    hora_7 INT(5) NOT NULL,
    hora_8 INT(5) NOT NULL,
    hora_9 INT(5) NOT NULL,
    step VARCHAR(5)NOT NULL
);