DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- TABLE creation routines
CREATE TABLE users (
	id bigserial primary key,
	first_name varchar(30),
	last_name  varchar(50),
	email varchar(150),
	password varchar(40)
);

CREATE TABLE provinces (
	id serial primary key,
	name varchar(30)
);

CREATE TABLE reasons (
	id serial primary key,
	name varchar(50) not null
);

CREATE TABLE customers (
	id bigserial primary key,
	first_name varchar(30) not null,
	last_name varchar(50)not null,
	email varchar(150) not null,
	address varchar(50),
	address2 varchar(50),
	city varchar(30),
	province_id integer references provinces(id) not null,
	postal_code varchar(7),
	phone_number varchar(14) not null
);

CREATE TABLE customer_calls(
	id bigserial primary key,
	call_timestamp timestamp,
	call_length smallint,
	customer_id bigint references customers(id),
	user_id bigint references users(id),
	reason_id integer references reasons(id),
	description_of_call text
);

CREATE TABLE customer_call_notes(
	id bigserial primary key,
	customer_call_id bigint references customer_calls(id),
	note_timestamp timestamp,
	notes text
);

-- Some sample data and its creation routines.
INSERT INTO provinces (id,name) VALUES (1, 'British Columbia');
INSERT INTO provinces (id,name) VALUES (2, 'Alberta');
INSERT INTO provinces (id,name) VALUES (3, 'Saskatchewan');
INSERT INTO provinces (id,name) VALUES (4, 'Manitoba');
INSERT INTO provinces (id,name) VALUES (5, 'Ontario');
INSERT INTO provinces (id,name) VALUES (6, 'Quebec');
INSERT INTO provinces (id,name) VALUES (7, 'New Brunswick');
INSERT INTO provinces (id,name) VALUES (8, 'Nova Scotia');
INSERT INTO provinces (id,name) VALUES (9, 'Prince Edward Island');
INSERT INTO provinces (id,name) VALUES (10, 'Newfoundland and Labrador');

INSERT INTO reasons (id,name) VALUES (1, 'Send a message');
INSERT INTO reasons (id,name) VALUES (2, 'Send money');
INSERT INTO reasons (id,name) VALUES (3, 'Request some money');
INSERT INTO reasons (id,name) VALUES (4, 'Report problems');
INSERT INTO reasons (id,name) VALUES (5, 'Feeling lonely');
INSERT INTO reasons (id,name) VALUES (6, 'Call by misstake');

INSERT INTO users (id,first_name,last_name,email,password) VALUES(1, 'Ryan', 'Gosling', 'ryanhollywood@gmail.com','imryan123');
INSERT INTO users (id,first_name,last_name,email,password) VALUES(2, 'Emma', 'Stone', 'emmahollywood@gmail.com','imemma123');
INSERT INTO users (id,first_name,last_name,email,password) VALUES(3, 'Tom', 'Hanks', 'tomhollywood@gmail.com','imtom123');
INSERT INTO users (id,first_name,last_name,email,password) VALUES(4, 'Meg', 'Ryan', 'meghollywood@gmail.com','immeg123');
INSERT INTO users (id,first_name,last_name,email,password) VALUES(5, 'Bryan', 'Adams', 'bryansinging@gmail.com','imbryan123');
INSERT INTO users (id,first_name,last_name,email,password) VALUES(6, 'Linh', 'Tran', 'gautruclinh@gmail.com','iuminhduc123');
INSERT INTO users (id,first_name,last_name,email,password) VALUES(7, 'Justin', 'Bieber', 'justinsinging@gmail.com','imjustin123');
INSERT INTO users (id,first_name,last_name,email,password) VALUES(8, 'Ellen', 'Page', 'ellenhollywood@gmail.com','imellen123');
INSERT INTO users (id,first_name,last_name,email,password) VALUES(9, 'Ceiline', 'Dion', 'ceilinesinging@gmail.com','imceiline123');
INSERT INTO users (id,first_name,last_name,email,password) VALUES(10, 'Rachel', 'McAdams', 'rachelhollywood@gmail.com','imrachel123');

INSERT INTO customers (id,first_name,last_name,email,address,address2,city,province_id,postal_code,phone_number) 
VALUES(1, 'Ryan', 'Reynolds', 'deadpoolhollywood@gmail.com','1 Woodroffe Ave','Flat C','Ottawa',1,'K2C 1T1','3439871234');
INSERT INTO customers (id,first_name,last_name,email,address,address2,city,province_id,postal_code,phone_number) 
VALUES(2, 'Drake', 'Graham', 'drakerapping@gmail.com','2 Woodroffe Ave','Flat C','Toronto',2,'K2C 1T2','3439871235');
INSERT INTO customers (id,first_name,last_name,email,address,address2,city,province_id,postal_code,phone_number) 
VALUES(3, 'Jim', 'Carrey', 'jimhollywood@gmail.com','3 Woodroffe Ave','Flat C','Vancouver',3,'K2C 1T3','3439871236');
INSERT INTO customers (id,first_name,last_name,email,address,address2,city,province_id,postal_code,phone_number) 
VALUES(4, 'Seth', 'Rogen', 'sethhollywood@gmail.com','4 Woodroofe Ave','Flat C','Quebec',4,'K2C 1T4','3439871237');
INSERT INTO customers (id,first_name,last_name,email,address,address2,city,province_id,postal_code,phone_number) 
VALUES(5, 'Ross', 'Geller', 'rossunagi@gmail.com','5 Woodroofe Ave','Flat C','New York',5,'K2C 1T5','3439871238');
INSERT INTO customers (id,first_name,last_name,email,address,address2,city,province_id,postal_code,phone_number) 
VALUES(6, 'Rachel', 'Green', 'itsnotthatcommon@gmail.com','6 Woodroofe Ave','Flat C','New York',6,'K2C 1T6','3439871239');
INSERT INTO customers (id,first_name,last_name,email,address,address2,city,province_id,postal_code,phone_number) 
VALUES(7, 'Monica', 'Geller', 'iknowwwww@gmail.com','7 Woodroofe Ave','Flat C','New York',7,'K2C 1T7','3439871212');
INSERT INTO customers (id,first_name,last_name,email,address,address2,city,province_id,postal_code,phone_number) 
VALUES(8, 'Chandler', 'Bing', 'couldthisemailbeanylonger@gmail.com','7 Woodroofe Ave','Flat C','New York',8,'K2C 1T7','3439871213');
INSERT INTO customers (id,first_name,last_name,email,address,address2,city,province_id,postal_code,phone_number) 
VALUES(9, 'Joey', 'Tribbiani', 'joeydoesntsharefood@gmail.com','8 Woodroofe Ave','Flat C','New York',9,'K2C 1T8','3439871214');
INSERT INTO customers (id,first_name,last_name,email,address,address2,city,province_id,postal_code,phone_number) 
VALUES(10, 'Phoebe ', 'Buffay', 'smellycatsmellycat@gmail.com','9 Woodroofe Ave','Flat C','New York',10,'K2C 1T9','3439871215');

INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (1,'2016-11-16 04:36:29',20,10,5,2,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (2,'2016-11-20 14:36:46',5,9,6,6,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (3,'2015-01-16 14:26:19',2,8,7,1,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (4,'2019-11-09 02:23:02',4,7,8,5,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (5,'2019-08-21 01:08:15',66,6,9,6,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (6,'2019-06-28 20:06:50',32,5,10,4,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (7,'2019-02-08 08:02:59',5,4,4,1,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (8,'2019-01-21 21:01:19',1,3,3,3,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (9,'2018-11-09 05:36:29',5,2,2,2,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (10,'2017-11-09 14:36:29',20,1,1,6,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (11,'2019-11-09 14:36:29',22,8,1,6,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (12,'2014-11-09 14:36:29',220,8,1,6,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (13,'2017-12-09 14:36:29',10,5,1,6,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (14,'2014-12-19 14:36:29',22,8,1,6,'Call is good');
INSERT INTO customer_calls (id,call_timestamp,call_length,customer_id,user_id,reason_id,description_of_call)
VALUES (15,'2017-01-29 14:35:39',21,4,1,6,'Call is good');

INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (1,10,'2017-11-09 15:36:29','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (2,9,'2018-11-09 06:36:29','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (3,8,'2019-01-21 22:01:19','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (4,7,'2019-02-08 09:02:59','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (5,6,'2019-06-28 21:06:50','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (6,5,'2019-08-21 02:08:15','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (7,4,'2019-11-09 03:23:02','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (8,3,'2015-01-16 15:26:19','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (9,2,'2016-11-20 15:36:46','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (10,1,'2016-11-16 05:36:29','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (11,11,'2019-11-09 15:36:29','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (12,12,'2014-11-09 15:36:29','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (13,13,'2017-12-09 15:36:29','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (14,14,'2014-12-19 15:36:29','My call is good');
INSERT INTO customer_call_notes (id,customer_call_id,note_timestamp,notes) VALUES (15,15,'2017-01-29 15:36:29','My call is good');

-- 5 queries that demonstrate the following items:
-- 		Selecting a customer by phone number
SELECT * 
FROM customers
WHERE phone_number = '3439871238';

--		Selecting all calls related to a single customer
SELECT * FROM customer_calls
WHERE customer_id IN (SELECT id FROM customers WHERE first_name = 'Ryan' AND last_name = 'Reynolds');

--		Selecting all calls created by a specific employee (users).
SELECT * FROM customer_calls
WHERE user_id IN (SELECT id FROM users WHERE first_name = 'Ryan' AND last_name = 'Gosling');

--		Selecting all calls with the following data provided:
-- 			employee (users)
-- 			customer
-- 			customer phone number
-- 			reason for the call
-- 			number of notes created on each of the calls
SELECT customer_calls.id AS call_id, customer_calls.call_timestamp, customer_calls.call_length, users.first_name AS employee, customers.first_name AS customer, customers.phone_number AS customer_phone_number,
reasons.name AS reason_for_the_call, COUNT(customer_call_notes.id) AS number_of_notes
FROM customer_calls
JOIN users ON customer_calls.user_id = users.id  
JOIN customers ON customer_calls.customer_id = customers.id
JOIN reasons ON customer_calls.reason_id = reasons.id
JOIN customer_call_notes ON customer_calls.id = customer_call_notes.customer_call_id
GROUP BY customer_calls.id, customer_calls.call_timestamp, customer_calls.call_length, users.first_name, customers.first_name, customers.phone_number, reasons.name;

-- 			Selecting the average number of calls per customer.  Figure how many calls each
-- 			customer placed, then give me the average of those numbers.  You should return a single number.
CREATE VIEW average_call AS
SELECT customers.first_name as customer, COUNT(customer_calls.id) AS phone_calls
FROM customer_calls
JOIN customers ON customer_calls.customer_id = customers.id
GROUP BY customers.first_name;

SELECT AVG(phone_calls)
FROM average_call;


