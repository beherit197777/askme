# ASKME 

(similar to askfm app)

**Description**

This is a social networking app developed for learning purposes. You can create an account and ask and answer your friends' questions. Anonimous questions are also possible.

**Requirements**

***reCAPTCHA gem*** was used to minimize spam.

> Ruby 3.3.5 
> Rails  6.1.5

Database:

> development: SQLite3 
> production: PostgreSQL

App language: *Russian*

**Launching steps:**

1: Download or clone this repository

2: Use bundler

    $ bundle install

3: Create DataBase

    $ bundle exec rails db:create

4: Run DataBase migrations

    $ bundle exec rails db:migrate

5: To start Rails service, enter in command line

    $ rails s


