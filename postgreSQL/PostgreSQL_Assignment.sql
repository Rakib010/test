-- Active: 1747403020254@@127.0.0.1@5432@conservation_db

CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY key,
    name VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL
);
CREATE TABLE species(
    species_id SERIAL PRIMARY key,
    common_name VARCHAR(30) NOT NULL,
    scientific_name VARCHAR(50) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(30) NOT NULL
);
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT,
    species_id INT,
    location VARCHAR(50),
    sighting_time TIMESTAMP ,
    notes TEXT,
    FOREIGN KEY (ranger_id)  REFERENCES rangers(ranger_id),
    FOREIGN KEY (species_id) REFERENCES species(species_id)
);

INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT INTO sightings (ranger_id, species_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(2, 1, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);


SELECT * FROM species;
SELECT * FROM sightings;
SELECT * FROM rangers;

-- 1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'
INSERT INTO rangers (name, region) VALUES 
('Derek Fox','Coastal Plains');

-- 2️⃣ Count unique species ever sighted.
SELECT count(DISTINCT sp.species_id) As unique_species_count FROM species sp
INNER JOIN sightings si ON sp.species_id = si.species_id;

-- 3️⃣ Find all sightings where the location includes "Pass".
SELECT * FROM sightings
WHERE location ILIKE '%pass';

-- 4️⃣ List each ranger's name and their total number of sightings.
SELECT r.name, count(s.sighting_time) As total_sightings FROM rangers r
INNER JOIN sightings s ON r.ranger_id = s.ranger_id
GROUP BY r.name;

-- 5️⃣ List species that have never been sighted.
SELECT sp.common_name FROM species sp
LEFT JOIN sightings si ON sp.species_id = si.species_id
WHERE sighting_id IS NULL;

-- 6️⃣ Show the most recent 2 sightings.
SELECT sp.common_name, si.sighting_time, r.name 
FROM sightings si 
INNER JOIN species sp ON si.species_id = sp.species_id
INNER JOIN rangers r ON si.ranger_id = r.ranger_id
ORDER BY sighting_time DESC LIMIT 2;

-- 7️⃣ Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species 
SET conservation_status = 'Historic'
WHERE EXTRACT(YEAR FROM discovery_date) < 1800;

-- 8️⃣ Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.
SELECT sighting_id,
CASE
    WHEN sighting_time::time < '12:00:00' THEN 'Morning'
    WHEN sighting_time::time BETWEEN '12:00:00' AND '17:00:00' THEN 'Afternoon'
    ELSE 'Evening'
END AS time_of_day
FROM sightings;

-- 9️⃣ Delete rangers who have never sighted any species
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);





