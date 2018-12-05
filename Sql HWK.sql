
USE sakila;
#Question 1
SELECT first_name, last_name 
FROM actor;

#Question 1b
SELECT UPPER (CONCAT (first_name,' ', last_name)) AS 'Actor_Name'
FROM actor;

#Question 2a
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Joe';

#Question 2b
SELECT actor_id, first_name, last_name 
FROM actor
WHERE last_name LIKE '%GEN%';

#Question 2c
SELECT first_name, last_name 
FROM actor
WHERE last_name LIKE '%LI%';

#Question 2d
SELECT country_id, country 
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

#Question 3a
ALTER TABLE actor
ADD COLUMN middle_name VARCHAR(25) AFTER first_name;

#Question 3b
ALTER TABLE actor
MODIFY COLUMN middle_name BLOB;

#Question 3c
ALTER TABLE actor
DROP COLUMN middle_name; 

#Question 4a
SELECT last_name, COUNT(*) AS 'Number of Actors'
FROM actor GROUP BY last_name;

#Question 4b
SELECT last_name, COUNT(*) as 'Number of Actors'
FROM actor GROUP BY last_name HAVING count(*) >=2;

#Question 4c
UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'Groucho' AND last_name = 'Williams';

#Question 4d
UPDATE actor
SET first_name = 'GROUCHO'
WHERE actor_id = 172;

#Question 5a
DESCRIBE sakila.address;

#Question 6a
SELECT first_name, last_name, address
FROM staff s
JOIN address a
ON s.address_id = a.address_id;

#Question 6b
SELECT payment.staff_id, staff.first_name, staff.last_name, payment.amount, payment.payment_date 
FROM staff INNER JOIN payment ON
staff.staff_id = payment.staff_id AND payment_date LIKE '2005-08%';

#Question 6c
SELECT f.title AS 'film Title', COUNT(fa.actor_id) AS 'Number of Actors'
FROM film_actor fa
INNER JOIN film f
ON fa.film_id= f.film_id
GROUP BY f.title;

#Question 6d
SELECT title, (
SELECT COUNT(*) FROM inventory
WHERE film.film_id = inventory.film_id
) AS'Number of Copies'
FROM film
WHERE title = 'Hunchback Impossible';

#Question 6e
SELECT c.first_name, c.last_name, sum(p.amount) AS 'TotaL Paid'
FROM customer c
JOIN payment p
ON c.customer_id= p.customer_id
GROUP BY c.last_name;

#Question 7a
SELECT title
FROM film WHERE title
LIKE 'k%' OR title LIKE 'Q%'
AND title in
(
SELECT title
FROM film
WHERE language_id= 1
);

#Question 7b
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
SELECT actor_id
FROM film_actor
WHERE film_id IN
(
SELECT film_id
FROM film
WHERE title = 'Alone Trip'
));

#Question 7c
SELECT cus.first_name, cus.last_name, cus.email
FROM customer cus
JOIN address a
ON (cus.address_id = a.address_id)
JOIN city cty
ON (cty.city_id = a.city_id)
JOIN country
ON (country.country_id = cty.country_id)
WHERE country.country= 'Canada';

#Question 7d
SELECT title, description FROM film
WHERE film_id IN
(
SELECT film_id FROM film_category
WHERE category_id IN
(
SELECT category_id FROM category
WHERE name = 'Family'
));

#Question 7e
SELECT f.title, COUNT(rental_id) AS 'Times Rented'
FROM rental r
JOIN inventory i
ON (r.inventory_id = i.inventory_id)
JOIN film f
ON (i.film_id = f.film_id)
GROUP BY f.title
ORDER BY 'Times Rented' DESC;

#Question 7f
SELECT s.store_id, SUM(amount) AS 'Revenue'
FROM payment p
JOIN rental r
ON (p.rental_id = r.rental_id)
JOIN inventory i
ON (i.inventory_id = r.inventory_id)
JOIN store s
ON (s.store_id = i.store_id)
GROUP BY s.store_id;

#Question 7g
SELECT s.store_id, cty.city, country.country
FROM store s
JOIN address a
ON (s.address_id = a.address_id)
JOIN city cty
ON (cty.city_id = a.city_id)
JOIN country
ON (country.country_id = cty.country_id);

#Question 7h
SELECT c.name AS 'Genre', SUM(p.amount) AS 'Gross'
FROM category c
JOIN film_category fc
ON (c.category_id=fc.category_id)
JOIN inventory i
ON (fc.film_id=i.film_id)
JOIN rental r
ON (i.inventory_id=r.inventory_id)
JOIN payment p
ON (r.rental_id=p.rental_id)
GROUP BY c.name ORDER BY Gross LIMIT 5;

#Question 8a
CREATE VIEW genre_revenue AS 
SELECT c.name AS 'Genre', SUM(p.amount) AS 'Gross'
FROM category c
JOIN film_category fc
ON (c.category_id=fc.category_id)
JOIN inventory i
ON (fc.film_id=i.film_id)
JOIN rental r
ON (i.inventory_id=r.inventory_id)
JOIN payment p
ON (r.rental_id=p.rental_id)
GROUP BY c.name ORDER BY Gross LIMIT 5;

#Question 8b
SELECT * FROM genre_revenue;

#Question 8c
DROP VIEW genre_revenue;































