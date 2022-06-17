# Neopets 2

#### A (slightly) modern reimagining of Neopets

#### By Mike Wright, Gabe Nielsen, Emilio Gonzales, Brady Diamond, William Pratt

## Technologies Used

* Ruby 2.6.10
* Rails 5.2.8
* pry
* Postgres
* psql
* faker
* devise
* HTML
* CSS
* Javascript
* Rufus-Scheduler


## This project is an exploration of a number of fundamentals we learned over the course of the Ruby/Rails course. We allow a user to create an account and name their randomly generated Neopet, feed their pet, and also send their pet into an actively unfolding event in Neocity.

## Setup/Installation Requirements

* Clone this repo
* Run `postgres` in your terminal to start your sql server
* In a new terminal, navigate to the root directory of this repo and run `bundle install` to install all required gems.
* Run `rake db:create` to create development and test databases.
* Run `rake db:migrate` to build necessary tables for the database.
* Run `rake db:seed` to seed the database.(This is optional)
* Run `rails s` in the terminal from the root directory to start the server
* Open your browser and navigate to http://localhost:3000/
* Sign up to become a registered user to navigate the site.
* You can now navigate the site
* Once you generate your pet you will need to feed them as their current health will drop as long as they are hungry.

## Known Bugs

* Began working on an inventory system but have not yet got it fully implemented

## License 

MIT

## Copyright (c) 06-16-2022 Mike Wright, Gabe Nielsen, Emilio Gonzales, Brady Diamond, William Pratt
