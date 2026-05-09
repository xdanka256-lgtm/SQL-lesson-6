CREATE TABLE flights (
  id             INTEGER PRIMARY KEY,
  flight_no      TEXT    NOT NULL,
  origin         TEXT    NOT NULL,
  destination    TEXT    NOT NULL,
  prev_flight_id INTEGER,
  FOREIGN KEY (prev_flight_id) REFERENCES flights(id)
);

INSERT INTO flights VALUES
  (1,'TK101','NYC','London',NULL),
  (2,'TK102','London','Dubai',1),
  (3,'TK103','Dubai','Tokyo',2),
  (4,'TK104','Tokyo','Seoul',3),
  (5,'TK105','Tokyo','Sydney',3),
  (6,'AA201','LA','Chicago',NULL),
  (7,'AA202','Chicago','NYC',6),
  (8,'AA203','NYC','Miami',7),
  (9,'AA204','NYC','Boston',7),
  (10,'BA301','Paris','Rome',NULL),
  (11,'LH401','Frankfurt','Berlin',NULL),
  (12,'LH402','Amsterdam','London',11);
  
SELECT 
	f.flight_no AS flight_no,
	p.flight_no AS predecessor_flight_number
FROM flights AS f
LEFT JOIN flights AS p
ON f.prev_flight_id = p.id
ORDER BY f.id;

SELECT 
	f.flight_no
FROM flights AS f
LEFT JOIN flights AS p
	ON f.prev_flight_id = p.id
WHERE p.flight_no = 'TK101';

SELECT 
	p.flight_no,
	COUNT(c.id) AS onward_connections
FROM flights AS p 
LEFT JOIN flights AS c
ON c.prev_flight_id = p.id
GROUP BY p.id, p.flight_no
ORDER BY onward_connections DESC;

SELECT 
	c.flight_no AS current_flight,
	c.origin AS current_origin,
	p.flight_no AS previous_flight,
	p.destination AS previous_destination
FROM flights AS c
JOIN flights AS p 
ON c.prev_flight_id = p.id
WHERE p.destination <> c.origin;
