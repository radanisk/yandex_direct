# The Yandex.Direct Ruby Gem

[![Gem Version](https://badge.fury.io/rb/yandex_direct.svg)](https://badge.fury.io/rb/yandex_direct)
[![Build Status](https://travis-ci.org/radanisk/yandex_direct.svg?branch=master)](https://travis-ci.org/radanisk/yandex_direct)
[![Maintainability](https://api.codeclimate.com/v1/badges/4cdc27846467bc400f5a/maintainability)](https://codeclimate.com/github/radanisk/yandex_direct/maintainability)

A Ruby interface to the Yandex Direct API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yandex_direct'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yandex_direct

## Configuration

Yandex Direct API requires you to authenticate via OAuth, so you'll need to register your application with [Yandex](https://oauth.yandex.ru/client/new).

You can pass configuration options as a block to `YandexDirect::Client.new`.

```ruby
client = YandexDirect::Client.new do |config|
  config.app_id = "YOUR_APP_ID"
  config.login = "YOUR_LOGIN"
  config.token = "YOUR_TOKEN"
  config.test = ("TRUE" | "FALSE")
end
```

## Usage Examples
After configuring a `client`, you can do the following things.

**Add campaigns**

```ruby
response = client.add_campaigns(Campaigns: [
  {
      Name: "gem",
      StartDate: Date.current.to_s,
      TextCampaign: {
          Settings: [{Option: 'EXCLUDE_PAUSED_COMPETING_ADS', Value: 'YES'}],
          BiddingStrategy: {
              Search: {BiddingStrategyType: 'HIGHEST_POSITION'},
              Network: {BiddingStrategyType: 'MAXIMUM_COVERAGE'}
          }
      }
  }
])
```

**Get specific campaigns**

```ruby
result = client.campaigns(
    SelectionCriteria: {Ids: [201708011]},
    FieldNames: %w(Id Name State Status)
)
```

**Add ad groups**

```ruby
response = client.add_ad_groups(AdGroups: [
    Name: 'gem',
    CampaignId: 201708011,
    RegionIds: 0
])
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/radanisk/yandex_direct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
