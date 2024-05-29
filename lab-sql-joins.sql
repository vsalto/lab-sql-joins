USE sakila;

-- 1. List the number of films per category.
SELECT b.name, COUNT(a.film_id) as total_counts FROM film_category AS a
JOIN category as b ON a.category_id = b.category_id
GROUP BY a.category_id;

-- 2. Retrieve the store ID, city, and country for each store.
SELECT a.store_id, b.address, d.city, e.country FROM store AS a
JOIN address AS b ON a.address_id = b.address_id
JOIN city AS d ON b.city_id = d.city_id
JOIN country AS e ON d.country_id = e.country_id;

-- 3. Calculate the total revenue generated by each store in dollars.
SELECT a.store_id, SUM(d.amount) AS total_revenue FROM store AS a
JOIN staff AS b ON a.store_id = b.store_id
JOIN rental AS c ON b.staff_id = c.staff_id
JOIN payment AS d ON c.rental_id = d.rental_id
GROUP BY a.store_id;

-- 4. Determine the average running time of films for each category.
SELECT c.name, AVG(b.length) from film_category AS a
JOIN film AS b ON a.film_id = b.film_id
JOIN category as c ON a.category_id = c.category_id
GROUP BY a.category_id;

