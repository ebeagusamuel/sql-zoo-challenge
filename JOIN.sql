-- Show the matchid and player name for all goals scored by Germany. 
SELECT matchid, player FROM goal 
WHERE teamid = 'Ger'

-- Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
FROM game where id = 1012

-- Show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid) where goal.teamid = "Ger"

-- Show the team1, team2 and player for every goal scored by a player called Mario 
select team1, team2, player from game join goal on game.id = goal.matchid 
where goal.player like 'Mario%'

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes 
SELECT player, teamid, coach, gtime
FROM goal join eteam on goal.teamid = eteam.id
WHERE gtime<=10

/* List the dates of the matches and the name of the team 
in which 'Fernando Santos' was the team1 coach. */
select mdate, teamname from game join eteam on game.team1 = eteam.id 
where eteam.coach = 'Fernando Santos'

/* List the player for every goal scored in a game 
where the stadium was 'National Stadium, Warsaw' */
select player from goal join game on goal.matchid = game.id 
where game.stadium = 'National Stadium, Warsaw'

-- Show the name of all players who scored a goal against Germany.
SELECT distinct player
FROM game JOIN goal ON goal.matchid = game.id 
WHERE (game.team1='GER' or game.team2='GER') and (goal.teamid != 'GER')

-- Show teamname and the total number of goals scored.
select teamname, count(teamid) from goal 
join eteam on goal.teamid = eteam.id group by teamname

-- Show the stadium and the number of goals scored in each stadium. 
select stadium, count(player) from game 
join goal on game.id = goal.matchid group by stadium

-- For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid,mdate, count(player) as goals
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL') group by matchid

/*For every match where 'GER' scored, show matchid, match date 
and the number of goals scored by 'GER'*/
select matchid, mdate, count(matchid) as goals from game 
join goal on game.id = goal.matchid 
where (teamid = "GER") and (team1 = "GER" or team2 = "GER") group by matchid

/*List every match with the goals scored by each team as shown.
Sort your result by mdate, matchid, team1 and team2.*/
SELECT mdate, matchid, team1,
sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2,
sum(case when teamid = team2 then 1 else 0 end) score2
FROM game JOIN goal ON matchid = id group by matchid

