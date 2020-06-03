-- List each country name where the population is larger than that of 'Russia'. 
SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia')

-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
select name from world 
where continent = "Europe" 
and (gdp / population) > (select gdp / population from world where name = "United Kingdom") 

/* List the name and continent of countries in the continents containing 
either Argentina or Australia. Order by name of the country. */
select name, continent from world 
where continent in (select continent from world where name = "Argentina" or name = "Australia")
order by name

/* Which country has a population that is more than Canada
but less than Poland? Show the name and the population. */
select name from world 
where population > (select population from world where name = "Canada") 
and population < (select population from world where name = "Poland")

/* Show the name and the population of each country in Europe. 
Show the population as a percentage of the population of Germany. */
select name, 
concat((round((population / (select population from world where name = "Germany") * 100), 0)), "%") 
as population from world where continent = "Europe";

/* Which countries have a GDP greater than every country in Europe? 
[Give the name only.] (Some countries may have NULL gdp values) */
select name from world where gdp > 
(select max(gdp) from world where continent = "Europe" and population > 0)

/* Find the largest country (by area) in each continent, 
show the continent, the name and the area: */
SELECT continent, name, area FROM world as x
WHERE area >= ALL
(SELECT area FROM world as y
WHERE y.continent=x.continent
AND population>0)

-- List each continent and the name of the country that comes first alphabetically.
select continent, name from world as x where name <= all 
(select name from world as y where x.continent = y.continent)

/* Some countries have populations more than three times that of any of their neighbours 
(in the same continent). Give the countries and continents. */
select name, continent from world as x where population > all 
(select 3 * population from world as y where x.continent = y.continent and x.name != y.name)