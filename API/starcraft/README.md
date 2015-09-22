StarCraft API
================

Ruby Version: 2.2.2

To run it, do :
- Clone the repo or copy the files
- Bundle install
- Create the database ('rake db:create') and seed it.

DESCRIPTION
=====================

Starcraft Matches API

One game, three races :
- the Terrans
- the Zerg
- the Protoss

Today we are going to build an API to support one of the major leagues in the planet. The objective is to give acces to all the information about the matches that take place, the statistics of the factions and the players, etc. So everyone interested, from profesional blogs to possible sponsors, can consume the information and use it as they want.

Iteration #1: Player and Match models
First, lets create the models we are going to use in our API.

Iteration #2: Matches
Now that we have our models, let's create a route that returns an index of the matches of a specific player in JSON.
After creating that index route, make a new one that lists matches by faction. You might have a route like /matches/:faction. If a user requested /matches/protoss your API should contain ActiveRecord code that runs this query:
SELECT "matches".* FROM "matches"
  INNER JOIN "players" ON "players"."id" = "matches"."winner_id"
WHERE winner_faction = 'protoss'
  OR loser_faction = 'protoss'

Iteration #3: Player profiles
Make a route to display player profiles. The profile should show all the player's matches, as well as win and loss percentages. To retrieve the list of matches for a particular player, your action should run ActiveRecord code that results in this query:
SELECT * FROM matches
WHERE winner_id = 2
  OR loser_id = 2
Assuming the player's id is 2.
