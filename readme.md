************************************************************
********** SPENDING TRACKER PROJECT: MONEYBAGS *************
************************************************************

This repository is the first project I completed during the
CodeClan course, and follows the spending tracker brief. In
order to run it the following actions in terminal are necessary
(from the repository's root folder):

# createdb spendingtracker
# psql -d spendingtracker -f /db/spendingtracker.sql
# ruby /db/seeds.rb
# ruby app.rb

The app should then be accessible in the browser through
localhost, typically at http://localhost:4567/

PostgreSQL and Ruby are both required, and should be accessible
through terminal.
