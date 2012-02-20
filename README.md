# OmniAuth TradeKing

This gem is an OmniAuth 1.0 Strategy for the [TradeKing API](https://developers.tradeking.com)

## Usage

Add the strategy to your `Gemfile` alongside OmniAuth:

```ruby
gem 'omniauth'
gem 'omniauth-tradeking'
```

Then integrate the strategy into your middleware:

```ruby
use OmniAuth::Builder do
  provider :tradeking, ENV['TRADEKING_CONSUMER_KEY_'], ENV['TRADEKING_CONSUMER_SECRET']
end
```

In Rails, you'll want to add to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tradeking, ENV['TRADEKING_CONSUMER_KEY_'], ENV['TRADEKING_CONSUMER_SECRET']
end
```

You will have to put in your consumer key and secret.

For additional information, refer to the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2012 Steve Agalloco, Jason Barry. See [LICENSE](https://github.com/jcbarry/omniauth-tradeking/blob/master/LICENSE.md) for details.