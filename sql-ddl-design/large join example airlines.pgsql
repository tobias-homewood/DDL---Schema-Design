SELECT
t.id, 
p.first_name, p.last_name,
t.seat, t.departure, t.arrival,
a.name AS airlines, cf.name as from_city, cof.name as from_country,
ct.name as to_city, cot.name as to_country
FROM tickets t

JOIN passengers p ON t.passenger_id = p.id

JOIN airlines a ON t.airline_id = a.id

JOIN cities cf ON t.from_city_id = cf.id
JOIN countries cof ON cf.country_id = cof.id

JOIN cities ct ON t.to_city_id = ct.id
JOIN countries cot ON ct.country_id = cot.id;


select * from countries