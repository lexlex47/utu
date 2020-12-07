# Cryptocurrency application
This project that analyzes crypto currencies data and the requirement is to process historical price list of currencies provided by a currency exchange.

## Heroku
This project deployed on heroku as sample.
https://hidden-depths-16554.herokuapp.com/

## Tasks
1.  Ability to setup the data in Relational Database or Nosql Database
2.  Ability to retrieve data from a database
3.  Use RubyOnRails to process the data or build efficient computational logic
4.  Use ReactJS to display the processed data in the required format
5.  Backend Implement/enhance the API
6.  Ability to load .csv to database
7.  Cloudserver ability

## Stacks and Dependencies
    Ruby => 2.7
    Ruby on Rails => 6.0
    ReactJS-Rails
    Postgresql

## Files structure
    
    .
    ├── db                      
    │   └── seeds.rb            # csv loader
    ├── app                    
    │   ├── javascript          # ReactJS components
    │   ├── controllers         # RoR controllers
    │   └── models              # RoR models
    └── spec                    # rspec tests


## Setup
1.  To install Ruby use `Ruby installer`.
2.  Install `Ruby Devkit`.
3.  Install `Rails` by using.
    ```
    gem install rails --version=6.0.3.4
    ```
4.  Clone the repo.
5.  Run bundle command.
    ```
    bundle install
    ```
6.  May need .env for database configuration.
    ```
    DBUSERNAME = 'alapp'
    DBPASSWORD = 'Password123'
    ```

## Running
To run the application use `rails s` command.

You should able to vist `localhost:3000` now.

![image](https://github.com/lexlex47/utu/blob/main/pics/start%20server.gif)

## Output
Results will output to the `localhost:3000` directly.

![image](https://github.com/lexlex47/utu/blob/main/pics/run2.gif)

## Testing
To test moudle use rspec gem. You may add seeds before test.
    
    rails db:seed

## Exit
Use `CTRL + C` command to stop server.
