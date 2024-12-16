-- CREATE INDEX idx_release_year ON film (release_year);

-- SET profiling = 1; -- Enable profiling to measure execution time
-- SELECT title
-- FROM film
-- WHERE release_year = 2006;
-- SHOW PROFILES; -- Display query execution times


SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    COUNT(r.rental_id) AS total_rentals,
    SUM(p.amount) AS total_payments
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.customer_id
HAVING total_rentals > 20 AND total_payments > 100 -- Adjust thresholds as needed
ORDER BY total_payments DESC;
