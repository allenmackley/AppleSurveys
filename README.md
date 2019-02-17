# README

## Setup

Note: This project was built and tested in macOS. If you're on Windows or Linux, the setup instructions may be slightly different, but you'll need to install the same dependencies. 

If you need to update any mac depedencies, it's recommended to use [Homebrew](https://brew.sh/). 

For additional help with Windows, visit the [Rails Getting Started Guide](https://guides.rubyonrails.org/getting_started.html).

____

Unzip the project file into your OS user directory.

Open a terminal and `cd ~/apple_survey`.

Ruby comes preinstalled on macOs. Check your version of Ruby with `ruby -v`. You need to have version `ruby 2.3.1` or newer, which you can update with `brew install ruby`.   

[Follow this guide](https://www.ruby-lang.org/en/documentation/installation/) if you need help installing or updating Ruby.

Check your version of Rails with `rails -v`. This project was built with `Rails 5.1.3`. If rails is not installed, install it with `sudo gem install rails`.

Check your version of sqlite with `sqlite3 --version`. macOS comes with it preinstalled. This project was built with `3.24.0`. You can update sqlite with `brew update sqlite3`.

Run `bundle install` within the project directory to install its Gemfile dependencies.

Then, `rails s` to start the puma server on localhost.

In a web browser, navigate to `localhost:3000` and you should see the home page of the app.

## Using the app
From the home screen you should see a list of a few default surveys that have already been created. You can click on a survey to view it in more detail and to post to it.

To create your own survey, click on "Create New Survey" from the home page. Name the survey and write a Yes/No question, then Submit the survey.

Your new survey will then appear on the home page.

___


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
