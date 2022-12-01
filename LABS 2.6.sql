USE sakila;
-- Question 1
select*from actor;
SELECT First_name "First Name",  last_name "Last Name" 
	FROM actor;

SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) >1;

SELECT Occurrence FROM
(SELECT last_name,COUNT(*) AS Occurrence FROM
 actor GROUP BY last_name HAVING COUNT(*)>1) AS Counts;

SELECT * FROM actor
WHERE last_name IN
 (select last_name
FROM actor
GROUP BY last_name
HAVING count(*) =1);

 
 
-- question 2
SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1;

-- question 3 Using the rental table, find out how many rentals were processed by each employee

SELECT rental_id
from rental;

SELECT staff_id
from staff;

SELECT count(DISTINCT rental_id) from rental
where staff_id= 1;

SELECT count(DISTINCT rental_id) from rental
where staff_id= 2;

-- 4 Using the film table, find out how many films were released each year.
SELECT DISTINCT release_year from film;

SELECT title, release_year
FROM film;
 
 
 -- 5  Using the film table, find out for each rating how many films were there.
SELECT DISTINCT rating
from film;

SELECT rating
FROM film;

SELECT rating, COUNT(rating) AS'number' FROM film GROUP BY rating;

-- 6 What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT length, rating, round(AVG(length),2)
FROM film
GROUP BY rating;

-- 7 Which kind of movies (rating) have a mean duration of more than two hours?

SELECT avg(length) as avgl, rating 
FROM film
GROUP BY rating
HAVING avgl > 120
;

-- 8 Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.

SELECT
	length,
	title,
	RANK () OVER ( ORDER BY length DESC)
FROM
	film;