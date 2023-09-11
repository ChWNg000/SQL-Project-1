WITH revenues AS
(SELECT f.film_id, fc.category_id, f.title, f.rental_rate, f.rental_duration, SUM(p.amount) AS revenue																	  
FROM film f
JOIN film_category fc ON fc.film_id = f.film_id
JOIN inventory i ON i.film_id = f.film_id
JOIN rental r ON r.inventory_id = i.inventory_id
JOIN payment p ON p.rental_id = r.rental_id
GROUP BY f.film_id, fc.category_id
)

SELECT revenues.category_id, category.name, AVG(revenue) FROM revenues
JOIN category ON category.category_id = revenues.category_Id
GROUP BY revenues.category_id, category.name 
ORDER BY AVG(revenue) DESC