## README
## Project Details 
1. Ruby Version: 2.5.3
2. Rails Version: 6.0.2
3. How to run test suit: `rspec spec/`

## Latest Code base branches as per the project
1. Parent Branch = master

## Project Setup Instruction
1. Clone repo from `https://github.com/pdukaf/watch-movies-api`
2. Run `bundle install` to install packages and dependencies.
3. Create `database.yml` file inside `config` directory to configure database.
6. Run `rake db:create` to create the database.
7. Run `rake db:migrate` to generate the tables with associated fields.
9. Run `rails s` to start the server.

## API end points
1. An endpoint to return the movies, ordered by creation.
	`localhost:3000/movies`
2. An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number.
	`localhost:3000/seasons`
3. An endpoint to return both movies and seasons, ordered by creation.
	`localhost:3000/movies-seasons`
4. An endpoint for a user to perform a purchase of a content.
	`localhost:3000/users/:id/purchases`
5. An endpoint to get the library of a user ordered by the remaining time to watch the content.
	`localhost:3000/users/:id/library`
******** Have a nice time and Good Luck ********