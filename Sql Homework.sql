#Question : 1
USE sakila;

SELECT first_name, last_name FROM actor;

SELECT UPPER (CONCAT (first_name," ", last_name)) AS "Actor_Name"
FROM actor;

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Joe';

SELECT actor_id, first_name, last_name 
FROM actor
WHERE last_name LIKE "%GEN%";

SELECT first_name, last_name 
FROM actor
WHERE last_name LIKE "%LI%"
ORDER BY last_name ASC, first_name ASC;

SELECT country_id, country 
FROM country
WHERE country
IN ("Afghanistan", "Bangladesh", "China");

ALTER TABLE actor modify middle_name blob;

SELECT COUNT(actor_id), last_name from actor GROUP BY last_name;
SELECT last_name, count(*) as cnt;
FROM actor
GROUP BY last_name 
HAVING cnt >=2

UPDATE actor
SET first_name = 'HARPO'
WHERE actor_id = 172;

UPDATE actor
SET first_name = 'GROUCHO'
WHERE actor_id =172;
SHOW tables;

SELECT staff.first_name. staff.last_name, address.address 
FROM staff
INNER JOIN address on staff.address_id = address.address_id;

SELECT count(film_id) from inventory where film_id = 439

SELECT title from film where (title like "K%" OR title like "Q%" AND language_id = 1;

SELECT first_name, last_name
FROM actor
WHERE actor_id in

SELECT actor_id
FROM film_actor
WHERE film_id in

SELECT film_id
FROM film
WHERE title = 'Alone Trip'

















