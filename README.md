[![CircleCI](https://circleci.com/gh/paveg/tinderb.svg?style=svg&circle-token=099f30534abd2de081d34298b641f30c385d9016)](https://circleci.com/gh/paveg/tinderb)
[![codecov](https://codecov.io/gh/paveg/tinderb/branch/master/graph/badge.svg)](https://codecov.io/gh/paveg/tinderb)

# Tinderb


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tinderb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tinderb

## Usage

```ruby
require 'tinderb'

client = Tinderb.client.new(facebook_token: facebook_token, facebook_id: facebook_id)
client.authorize

# and more using apis...
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tinderb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tinderb project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tinderb/blob/master/CODE_OF_CONDUCT.md).
