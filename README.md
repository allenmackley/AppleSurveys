# README

## Quickstart
1. Unzip the project to your user directory.
2. `cd ~/apple_surveys`
3. `bundle install`
4. `rails db:reseed`
5. `rails s`
6. Navigate to `localhost:3000`

## Additional Setup Instructions

(If you need them)

This project was built and tested in macOS. If you're on Windows or Linux, the setup instructions may be slightly different, but you'll need to install the same dependencies. 

If you need to update any mac depedencies, it's recommended to use [Homebrew](https://brew.sh/). 

For additional help with Windows, visit the [Rails Getting Started Guide](https://guides.rubyonrails.org/getting_started.html).

____

Unzip the project file into your OS user directory.

Open a terminal and `cd ~/apple_survey`.

Ruby comes preinstalled on macOs. Check your version of Ruby with `ruby -v`. You need to have version `ruby 2.3.1` or newer, which you can update with `brew install ruby`.   

[Follow this guide](https://www.ruby-lang.org/en/documentation/installation/) if you need help installing or updating Ruby.

Check your version of Rails with `rails -v`. This project was built with `Rails 5.1.3`. If rails is not installed, install it with `sudo gem install rails`.

Check your version of sqlite with `sqlite3 --version`. macOS comes with it preinstalled. This project was built with `3.24.0`. You can update sqlite3 with `brew update sqlite3`.

(Note: I encounted an incompatibility between Rails 5 and the version `1.4.0` of the sqlite3 gem. I resolved it by specifying the gem as `1.3.6`.)

To create the database, run migrations, and seed the database with demo data all in one step, use the command: `rails db:reseed`. (A "reseed" does the same as: `rails db:drop; rails db:create; rails db:migrate; rails db:seed`)

You don't need to view the SQL to use and interact with the app, but if you wish to do so, you can use the [Datum](https://itunes.apple.com/us/app/datum-lite/id901631046?mt=12) or [Lift](https://itunes.apple.com/us/app/lift-sqlite-lite/id1440179067?mt=12) apps from the Apple App Store. With either app, go to the **File** menu, then **Open** and find the `development.sqlite3` file within the project directory, which is located at `~/apple_surveys/db/development.sqlite3`

## Start the app
**`rails s` to start the puma server on localhost.**

**In a web browser, navigate to `localhost:3000` and you should see the home page of the app.**

## Using the app
From the home screen you should see a list of a few default surveys that have already been created. You can click on a survey to view it in more detail and to post to it.

To create your own survey, click on **Create New Survey** from the home page. Name the survey and write a Yes / No question, then Submit the survey.

Your new survey will then appear on the home page. The total percentage of yes and no votes will appear next to the survey name.

To view more details for a survey item, click on its name from the home page.

You can click the **Edit** button to edit a survey's name or question. On the edit page you can also delete a survey.

This demonstrates all of the **CRUD** actions within a Rails resource.

Next, go ahead and vote on a survey. As per the requirements of the assessment, you can vote on a survey as many times as you like. A demo user has been stubbed into the application as "Test User" and will be the user recorded for each of your votes. The database was set up so that this could be any user once a full user authentication system is implemented into the project.

After voting on a survey, the balance of percentages between "yes" and "no" responses to the survey will be reflected on the home page. Click on one of the perent readings to see a log of every vote, including the user who made it, the response, and the time it was made. 

## Running tests
From within the project directory, run `rails test`.

# Other Notes on Rails Scalability
## Solving Scalability Issues
* Most scalability issues derive from a poor understanding of the underlying architecture and database technology, not the choice of language. 
* By the time a scalable infrastructure has been put together with caching, memory stores, load balancing, microservices, considerations toward database design and technology, and clean/solid code, the underlying programming language makes very little difference when it comes to performance.
* The conventions that Rails uses, plus the use of thoughtful design patterns, leads to a net positive effect on a project when other design considerations as mentioned below are taken into account.
## Infrastructure
* Horizontal scaling, tweaking settings in Phusion Passenger, and using a load balancer.
* Caching data in a memory store such Memcache or Redis.
* Designing microservices intelligently, centering the design and purpose of each service around a focused category of data.
* Utilize a CDN and client-side caching and cache-invalidation.
* If necessary, separate front-end asset servers from back-end api servers.
* Utilize HTTP2.
* Convert synchronous HTTP requests to ansynchronous ones, offloaded to background worker threads, using ActiveJob or SideKiq.
## Database
* Great database schema design from the beginning, utilizing indexes, and finding the best balance between normalized and denormalized data.
* Write efficient SQL or otherwise be aware of the SQL being written by the ORM.
* Use a NoSQL database when necessesary for easier sharding.
* Use a data loader with the ORM to batch queries and prevent a 1+N problem, such as [BatchLoader](https://github.com/exAspArk/batch-loader) or something similar.
* Utilize Rails eager loading with `includes()`.
## Code & Maintainability
* Keep controllers as light as possible.
* Business logic should stay in models, modules, and services.
* Make use of template partials.
* Keep ontop of code organization and reuse. 
* Maintaining high test code coverage percentage as a requirement.
* Separate unit tests from integration tests so that the integration tests don't slow down the unit tests, encouraging developers to run the test suite as often as possible in development. Utilize mock objects.
* SOLID design principals, particularly the Single Responsibility Principal.
* Execute specialized processing tasks that are very CPU intensive in another languge when necessary.
* Effective logging tools to help in identifying problems and bottlenecks, such as Bullet, New Relic or Skylight.