# Arborist Chat Rails

[![Gem Version](https://badge.fury.io/rb/arborist_chat_rails.svg)](https://badge.fury.io/rb/arborist_chat_rails)
![CI](https://github.com/arborist-software/arborist-chat-rails/workflows/CI/badge.svg?branch=master)

adds arborists live chat widget to your rails app

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arborist_chat_rails'
```

Install using bundler:

```sh
bundle install
```

Lastly, generate a default configuration using:

```sh
bin/rails g arborist_chat_rails:install --app_id=<app_id> --app_secret=<app_secret>
```

## Usage

This gem will automatically add arborist live chat to all webpages by default, however you can
opt out of showing chat on a page by adding a skip_after_action to the controller:

```ruby
class ExampleController < ApplicationController
  # dont show arborist livechat
  skip_after_action :include_arborist_livechat
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arborist-software/arborist-chat-rails.
