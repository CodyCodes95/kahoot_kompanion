**Kahoot Kompanion**

This is a simple small terminal application which will allow tracking of the Kahoot winners each day and display a leaderboard. The points sytem gives points 1st, 2nd and 3rd slots of each days quiz. Winners get 2 points, runner up and third get 1 point each.

The scoreboard.json will be updated and pushed to Github daily with the winners for the day. Providing you have pulled down the most recent scoreboard.json in the directory with the application, the display leaderboard option will display the updated scores.

If you want to play with the application yourself, you can add the winners in via the *admin* menu using the password *plaintextpasswordlol* and add the winners each day. Note this will only update your local scoreboard.json file, for the most up to date copy pull the scoreboard.json from this Github repo daily.

*Scores are recorded as of 21/03/22*

**Future plans**

Once I can figure out how, I would like the scoreboard.json to be pulled from a URL so that everyone running the app can always have the most up to date scoreboard without having to manually pull an updated one from github every day.

Serious refactoring of the score_adder method is needed.