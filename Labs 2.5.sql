USE sakila;

-- Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor
WHERE first_name = "Scarlett";


-- How many films (movies) are available for rent and how many films have been rented?

SELECT return_date FROM rental;
SELECT inventory_id FROM rental;
SELECT * FROM rental
WHERE return_date IS NULL;
SELECT * FROM inventory;

SELECT
(SELECT  COUNT(*) 
FROM rental 
WHERE return_date IS NULL ) as "rented",
(SELECT COUNT(rental_date) 
FROM rental
WHERE return_date IS NOT NULL) as "Available"
;
-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT MIN(length) as min_duration
FROM film;
 
SELECT title, MIN(length) AS min_duration 
FROM film
Group by title;
 
SELECT title, MAX(length) as max_duration
FROM film
GROUP BY title;


-- What's the average movie duration expressed in format (hours, minutes)?

select SEC_TO_TIME(round(avg(length*60),0)) AS "average" 
from film
;

-- How many distinct (different) actors' last names are there?

SELECT COUNT(DISTINCT last_name)

FROM actor;


-- Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(MAX(return_date), MIN(rental_date)) AS "Operating days"
FROM rental
;

-- Show rental info with additional columns month and weekday. Get 20 results.

SELECT *,
MONTHNAME(rental_date) AS month, DAYNAME(rental_date) AS weekday
FROM rental
LIMIT 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

SELECT *, 
monthname(rental_date) AS month,
DAYNAME(rental_date) AS weekday,
CASE
WHEN DAYNAME(rental_date)
IN ('Saturday', 'Sunday')
THEN ('Week-end')
ELSE 'Week-day'
END
AS day_type 
FROM rental
LIMIT 20
;

-- Get release years.
SELECT release_year
FROM film
;

-- Get all films with ARMAGEDDON in the title.

SELECT *
FROM film
WHERE title LIKE '%ARMAGEDDON%'
;

-- Get all films which title ends with APOLLO.

SELECT *
FROM film
WHERE title LIKE '%APOLLO'
;

-- Get 10 the longest films.

SELECT *
FROM film
ORDER BY length desc
LIMIT 10
;

-- How many films include Behind the Scenes content?
SELECT special_features, COUNT(special_features) AS "films w/ BTS" 
FROM film
ORDER BY special_features
;