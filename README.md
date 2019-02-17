# README

## Setup your environment

Note: This project was built and tested in macOS. If you're on Windows or Linux, the setup instructions may be slightly different, but you'll need to install the same dependencies. 

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

To view the SQL in SQLite with a GUI, download the [Datum App](https://itunes.apple.com/us/app/datum-lite/id901631046?mt=12).

## Prepare the app

Run `bundle install` within the project directory to install its Gemfile dependencies.

Run `rails db:migrate` to create the db and seed it with preliminary data.

## Start the app
**Then, `rails s` to start the puma server on localhost.**

**In a web browser, navigate to `localhost:3000` and you should see the home page of the app.**

## Using the app
From the home screen you should see a list of a few default surveys that have already been created. You can click on a survey to view it in more detail and to post to it.

To create your own survey, click on **Create New Survey** from the home page. Name the survey and write a Yes / No question, then Submit the survey.

Your new survey will then appear on the home page. The total percentage of yes and no votes will appear next to the survey name.

To view more details for a survey item, click on its name from the home page.

You can click the **Edit** button to edit a survey's name or question. On the edit page you can also delete a survey.

This demonstrates all of the **CRUD** actions within a Rails resource.

## Running tests

