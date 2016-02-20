
 [![Travis](https://travis-ci.org/pmoelgaard/currency_conversion.svg)](Travis)
 
# currency_conversion

Ruby Library for the currencylayer API, Reliable Exchange Rates & Currency Conversion [the currencylayer API](https://currencylayer.com/).

---

## Installation
Add this line to your application's Gemfile:

```
gem 'currency_conversion'

```

And then execute:

```
$ bundle

```

Or install it yourself as:

```
$ gem install currency_conversion

```


## Configuration

Before using the currencylayer API client you have to setup your account and obtain your API Access Key.  
You can get it by signing up at [https://currencylayer.com/product](https://currencylayer.com/product).

---

## API Overview
All endpoints in the public API is available through this library.

- live
- list
- historical
- convert
- timeframe
- change

---


## Usage

The general API is documented here: [https://currencylayer.com/documentation](https://currencylayer.com/documentation).  
You can find parameters, result set definitions and status codes documented here as well.


### Setup

First we require the module

```
require 'currency_conversion'

```

Second we instantiate the client

```
@client = CurrencyLayer::Client.new( [access_key] )

```

#### Optional Parameters

##### Secure (only available for Basic, Pro and Enterprise accounts)
Boolean value to indicate if the calls to the API should use a secure protocol or insecure (HTTP/HTTPS). Defaults to false (HTTP, insecure).

---

## Live
Takes a simple string and detects the language with a list of detections.

###### Define Query

	var liveQuery = {
    	source: 'SGD',
	    currencies: ['USD', 'THB']
	};

###### Simple Request

```ruby
# Set the currencies to fetch
currencies = 'AUD,EUR,GBP,PLN'
  
# We declare the options
options = CurrencyLayer::LiveOptions.new()
 	
# We make the call to fetch the live currencies
response = @client.live(currencies, options)
  
```
    
###### Response
```

{
  "success": true,
  "terms": "https://currencylayer.com/terms",
  "privacy": "https://currencylayer.com/privacy",
  "timestamp": 1455968535,
  "source": "USD",
  "quotes": {
    "USDAUD": 1.39865,
    "USDEUR": 0.898271,
    "USDGBP": 0.694155,
    "USDPLN": 3.927404
  }
}

```

---

## Example Application

In the [rootdir]/example directory there is a fully functional application which runs all requests against all the endpoints in the API, the examples above can be seen there as source code.

The example application uses a process.env variable to hold the access key.

---

## Tests

The tests are written using the rspec testing library.  
**RSpec** [http://rspec.info/](http://rspec.info/)

In order to run the tests, the following environment variables needs to be set:

```
ACCESS_KEY = [access_key]

```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](mailto:support@apilayer.net?subject=%5Bcurrencylayer%5D).

---

## Updates
Stay up to date by following [@apilayernet](https://twitter.com/apilayernet) on Twitter.

---

## Legal

All usage of the languagelayer website, API, and services is subject to the [languagelayer Terms & Conditions](https://languagelayer.com/terms) and all annexed legal documents and agreements.

---

## Author
Peter Andreas Moelgaard ([GitHub](https://github.com/pmoelgaard), [Twitter](https://twitter.com/petermoelgaard))

---

## License
Licensed under the The MIT License (MIT)

Copyright (&copy;) 2016 Peter Andreas Moelgaard & apilayer

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.