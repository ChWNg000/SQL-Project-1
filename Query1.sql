SELECT f.film_id, fc.category_id, f.title, f.rental_rate, f.rental_duration, SUM(p.amount) AS revenue																	  
FROM film f
WHERE SUM(p.amount) > 0
--Note line 3 actually doesn't do anything as all films had positive revenue but I wanted to exhibit using the WHERE clause 
JOIN film_category fc ON fc.film_id = f.film_id
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
GROUP BY f.film_id, fc.category_id
ORDER BY SUM(p.amount) DESC