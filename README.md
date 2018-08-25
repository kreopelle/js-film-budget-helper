# Film Budget Helper

The Film Budget Helper is a Rails App designed to help producers track and organize eligible expenses for applications to New York State’s Empire State Development Film Production Tax Credit, though its basic structure could be used to track expenses and reimbursements for any multi-department project, such as:

* Weddings
* Work Trips
* Conferences
* Home Renovation

Visit [Film Budget Helper](#) to begin using the app. A full walkthrough is available on [my blog](#).

## Getting Started

This app uses Ruby 2.3.3 and Rails 5.2.1. See deployment for notes on how to deploy the project on a live system.

### Installing

Fork and clone this repo. Install the required gems by running

```
bundle install
```

Set up the database with

```
rails db:migrate
```

Start up the server with

```
rails s
```

And find your app at [localhost:3000](http://localhost:3000).

To make sure everything is up and running, sign up with a new account. Once signed in, create a new expense to test CRUD functionality.

## Deployment

Generate your own `client_id` and `client_secret` to use the Google Omniauth features. Follow the steps outlined on the [omniauth-google-oauth2](https://github.com/zquestz/omniauth-google-oauth2) gem page to set it up.

Images are stored using ActiveStorage. For a production environment, set up a connection to a storage service. Follow the steps outlined in the [Rails Guides - Active Storage Overview](https://edgeguides.rubyonrails.org/active_storage_overview.html) for setup.

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributors Guide

Bug reports, pull requests, and suggestions are welcome on GitHub at https://github.com/kreopelle/film-budget-helper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Film Budget Helper's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kreopelle/film-budget-helper/blob/master/CODE_OF_CONDUCT.md).

## License

The app is available as open source under the terms of the [MIT License](https://github.com/kreopelle/film-budget-helper/blob/master/LICENSE.md).

## Acknowledgments

This project was created as part of the Flatiron School's Online Web Development program to fulfill the [Rails Portfolio Project requirements](https://github.com/learn-co-students/rails-assessment-v-000), inspired by my previous job as an ultra-low-budget film producer.

Thank you to [Dakota](https://github.com/DakotaLMartinez), [Cernan](https://github.com/cernanb), [Enoch](https://github.com/Enoch2k2), and the game-of-threads cohort for your guidance and support!

Tip of my hat to the following blogs for walking me through some difficult parts of this build:
* [Devise and Pundit - Learn.co](https://learn.co/lessons/devise_pundit_readme)
* [HTML Safe](https://gist.github.com/joekur/73779c40c481a2f8a44f)
* [Basic Login](https://www.railstutorial.org/book/basic_login)
* [Top 10 Rails Errors](https://rollbar.com/blog/top-10-ruby-on-rails-errors/)
* [Validating ActiveStorage Images](https://www.youtube.com/watch?v=qP7kFDimygc)
