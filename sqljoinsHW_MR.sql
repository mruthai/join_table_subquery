-- Week 5 - Wednesday Questions

-- 1.) List all customers who live in Texas (use JOINs)

SELECT*
FROM address;

SELECT c.address_id, first_name, last_name, address
FROM customer c 
JOIN address a 
ON a.address_id = c.address_id 
WHERE district='Texas';          -----Jennifer | Kim | Richard | Bryan | Ian

-- 2.) Get all payments above $6.99 with the Customer's Full Name
SELECT amount
FROM payment 
WHERE amount > 6.99

SELECT amount, first_name, last_name 
FROM customer c
JOIN payment p 
ON p.customer_id  = c.customer_id 
WHERE amount > 6.99;


-- 3. Show all customers names who have made payments over $175 (use subqueries)

SELECT*
FROM payment;

SELECT*
FROM customer;

SELECT sum(amount), (SELECT first_name  FROM customer WHERE customer.customer_id = payment.customer_id) first_name 
FROM payment
GROUP BY  customer_id 
HAVING sum(amount) > 175;


SELECT first_name, last_name
FROM payment
GROUP BY amount > 175 (
	SELECT amount 
	FROM customer
	HAVING first_name, last_name    ------ NONE
);


-- 4. List all customers that live in Nepal (use the city table)

SELECT*
FROM city;

SELECT first_name, last_name
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id  
JOIN city c2  
ON c2.city_id  = a.city_id
WHERE country_id = 66;

-- 5. Which staff member had the most transactions?
SELECT*
FROM staff

SELECT sum(amount), first_name, last_name 
FROM staff s
JOIN payment p  
ON p.staff_id = s.staff_id
GROUP BY s.staff_id ;

-- 6. How many movies of each rating are there?

SELECT rating, count(title)
FROM film
GROUP BY rating
ORDER BY DESC;

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT *
FROM customer
WHERE amount > 6.99 (
	SELECT amount
	FROM payment
	WHERE staff_id =1
);

SELECT amount, (SELECT first_name FROM customer WHERE customer.customer_id = payment.customer_id) first_name
FROM payment
WHERE   amount > 6.99;


SELECT amount, first_name, last_name 
FROM customer c
JOIN payment p 
ON p.customer_id  = c.customer_id 
WHERE amount > 6.99;


-- 8.) How many free rentals did our stores give away?  --- free = 0
	

SELECT count(amount)
FROM rental r
JOIN payment p
ON r.rental_id = p.rental_id
WHERE amount = 0;

