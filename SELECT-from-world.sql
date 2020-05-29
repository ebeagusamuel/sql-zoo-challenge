-- Show the name, continent and population of all countries.
SELECT name, continent, population FROM world

-- Show the name for the countries that have a population of at least 200 million.
SELECT name FROM world
WHERE population >= 200000000

-- Give the name and the per capita GDP for those countries with a population of at least 200 million. 
SELECT name, (gdp / population) AS gdp_per_capita From world 
where population >= 200000000

-- Show the name and population in millions for the countries of the continent 'South America'.
select name, population / 1000000 as population_in_millions from world 
where continent = "South America"

-- Show the name and population for France, Germany, Italy 
select name, population from world 
where name in ("France", "Germany", "Italy")

-- Show the countries which have a name that includes the word 'United'
select name from world 
where name like "%United%"

/* Show the countries that are big by area or big by population.
 Show name, population and area. */
select name, population, area from world 
where area > 3000000 or population > 250000000

/* Show the countries that are big by area (more than 3 million) or
 big by population (more than 250 million) but not both. Show name, population and area. */
select name, population, area from world 
where area > 3000000 xor population > 250000000

-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places. 
select name, round(population / 1000000, 2) as population, round(gdp / 1000000000, 2) as gdp from world 
where continent = "South America"

/* Show the name and per-capita GDP for those countries
 with a GDP of at least one trillion (1000000000000; that is 12 zeros).
	Round this value to the nearest 1000. */
select name, round(gdp / population, -3) as "Per Capita GDP" from world 
where gdp >= 1000000000000

-- Show the name and capital where the name and the capital have the same number of characters.
select name, capital from world 
where length(name) = length(capital)

/* Show the name and the capital where the first letters of each match.
 Don't include countries where the name and the capital are the same word. */
select name, capital from world 
where left(name, 1) = left(capital, 1) and name <> capital;

-- Find the country that has all the vowels and no spaces in its name.
select name from world 
where name like "%a%" 
	and name like "%e%" 
	and name like "%i%" 
	and name like "%o%" 
	and name like "%u%" 
	and name not like "% %";