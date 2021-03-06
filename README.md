# CouponDuniya

CouponDuniya is an unofficial wrapper for accessing api provided by coupon dunia for integrating with them.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coupon_duniya'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install coupon_duniya, git: 'git@github.com:tanmayforgit/coupon_duniya.git'

## Usage

Coupon dunia gives partner id and api key once you have initiated an account with them. Before 
using anything you should configure your partner_id, api_key
```ruby
CouponDuniya.configure |c|
  c.partner_id = 'your partner id'
  c.api_key = 'your api key'
end
```
After configuration, you can use coupon duniya as per your need
```ruby
e.g.
stores = CouponDuniya::Stores.all(first_letter = nil)
```

first_letter parameter is not compulsory. If passed it will give all parameters starting with that
first letter

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run rake console for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/coupon_duniya/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
