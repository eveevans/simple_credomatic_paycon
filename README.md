# SimpleCredomaticPaycon

Simple Wrapper for interact with Credomatic Paycon

## Installation

Add this line to your application's Gemfile:

    gem 'simple_credomatic_paycon'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_credomatic_paycon

## Usage

Create an object with the transaction information (including credomatic keys)

``` ruby
product_transaction = SimpleCredomaticPaycon::Transaction.new(
  orderid: 'test-01', 
  amount: '2.00', 
  ccnumber: '1234567898765432', 
  ccexp: '1216', 
  cvv: '123', 
  username: 'credomatic-username', 
  key: 'credomatic-key', 
  key_id: 'credomatic-key_id'
)
```

Process the transaction (will do the request to Credomatic servers)
```
response = product_transaction.process 
```

### Trace errors on Credomatic response.
```
SimpleCredomaticPaycon.configure do |config|
  config.trace_raw_response = true
end
```

If you're using Rails, create an initializer for this:
```
config/initializers/simplecredomaticresponse.rb
```


## Notes
The amount will be rounded to 2 decimals. 
Ex: 2.256 will be 2.26

*TODO:*
Add Test suites using [Webmock](https://github.com/bblimke/webmock) and [VCR](https://github.com/vcr/vcr) 

## Changelog

This project uses [Semantic Versioning](http://semver.org/) for release numbering.
For changelog notes, checkout [CHANGELOG.md](CHANGELOG.md).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
