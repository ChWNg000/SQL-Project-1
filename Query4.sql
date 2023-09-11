WITH revenues AS
(SELECT f.film_id, f.rating, SUM(p.amount) AS revenue																	  
FROM film f
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
GROUP BY f.film_id
ORDER BY SUM(p.amount) DESC)

SELECT revenues.rating, COUNT(*), AVG(revenue) as avg_revenue, CASE 
	WHEN AVG(revenue) >= 64 THEN 'Above Average'
	WHEN AVG(revenue) < 64 THEN 'Below Average'
	END
FROM revenues
GROUP BY revenues.rating 
ORDER BY AVG(revenue) DESC
