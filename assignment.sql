-- Instructions: Use a combination of aggregates, joins, 
-- limit and group by to complete the following SQL queries. 
-- Each query should have 10 or less rows as a result.

-- 1. Display the total number of countries in the country table.
SELECT
	COUNT(*) AS "total_number_of_countries"
FROM "country";


-- 2. Display the entire world population (research SUM). 
-- Going to use an aggregate function. We don't need a GROUP BY,
-- because there's no conditional way we want to group stuff.
SELECT
	SUM("population") AS "total_population"
FROM "country";

-- 3. Displays the name and population for the 10 countries with the highest population.
SELECT
	"name",
	"population"
FROM "country"
ORDER BY "population" DESC
LIMIT 10;

-- 4. Displays the number of countries in each region.
SELECT 
	"region_id",
	COUNT("region_id") AS "number_of_countries" 
FROM "country"
	GROUP BY "region_id"
	ORDER BY "region_id" ASC;

-- 5. Displays the total population for each region.
--This query totally works, but its output doesn't include
--the "name" of each region:
--SELECT
--	"region_id",
--	SUM("population") AS "total_region_population"
--FROM "country"
--GROUP BY "region_id";

SELECT
	--"region"."name", how to handle this?
	"country"."region_id",
	SUM("country"."population") AS "total_region_population"
FROM "country"
JOIN "region"
	ON "country"."region_id" = "region"."id"
GROUP BY "region_id";


-- 6. Display the name and sq km for the 10 countries with the most land area (sort by land area).
-- JOIN land_area and country tables
-- sort by land_area.sq_km DESC
-- LIMIT to 10
SELECT
	"country"."name",
	"land_area"."sq_km"
FROM "country"
JOIN "land_area"
	ON "country"."country_code" = "land_area"."country_code"
ORDER BY "land_area"."sq_km" DESC
LIMIT 10;

-- Stretch Mode

-- 7. Display the total land area for each region sorted by land area (requires two joins). 


-- 8. Display the top 10 countries with the highest population density (greatest population per sq km).
SELECT
	"country"."name",
--	"country"."population",
--	"land_area"."sq_km",
	"country"."population" / "land_area"."sq_km" AS "population_density"
FROM "country"
	JOIN "land_area"
	ON "country"."country_code" = "land_area"."country_code"
	ORDER BY "population_density" DESC
LIMIT 10;

-- 9. Display the population density for each region (sort by population density).



-- 10. Display the population density for the 10 countries with the largest land area.