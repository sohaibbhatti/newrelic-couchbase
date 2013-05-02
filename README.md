# Newrelic::Couchbase

CouchBase instrumentation for NewRelic

## Installation

Make sure you have installed the [Couchbase Ruby
Client](https://github.com/couchbase/couchbase-ruby-client) and [NewRelic
RPM](https://github.com/newrelic/rpm)

Add this line to your application's Gemfile:

    gem 'newrelic-couchbase'

And then execute:

    $ bundle

## Usage

Core methods of Couchbase will begin to traced by NewRelic. To disable
Couchbase instrumentation either the DISABLE_NEW_RELIC_COUCHBASE flag
can be set to true
```ruby
  ENV['DISABLE_NEW_RELIC_COUCHBASE'] = true
```
OR, the following statement can be appended to the newrelic.yml file
```yaml
  disable_couchbase: true
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
