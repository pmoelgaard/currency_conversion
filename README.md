
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

###### Simple Request

```
# Set the currencies to fetch
currencies = 'AUD,EUR,GBP,PLN'
  
# We declare the options
options = CurrencyLayer::LiveOptions.new()
 	
# We make the call to fetch the live currencies
response = @client.live(currencies, options)
  
```
### Etag & Date (If-None-Match, If-Modified-Since)
The ```live``` endpoint supports these headers to minimise unnecessary traffic and load on systems.
This library internally sets these headers and manages a local cache, so whenever the library receives a 304 (no changes) response from the server, it will return the last response it received. This way this library will always return a response.


## List
Fetches the list of currencies.

###### Simple Request

```
# We declare the options
options = CurrencyLayer::ListOptions.new()
 	
# We make the call to fetch the list of currencies
response = @client.list(options)
  
```
    
###### Response

```
{
  [...]
  "currencies": {
    "AED": "United Arab Emirates Dirham",
    "AFN": "Afghan Afghani",
    "ALL": "Albanian Lek",
    "AMD": "Armenian Dram",
    "ANG": "Netherlands Antillean Guilder",  
    [...] 
    }
} 

```

## Timeframe
request historical exchange rates for a time-period of your choice. (maximum range: 365 days).   
_Note: This library enforces to use the ```currencies``` argument since it's highly recommended practice._

###### Simple Request

```
# We declare the arguments
start_date = '2010-03-01'
end_date = '2010-04-01'
currencies = 'USD,GBP,EUR'

# We declare the options
options = CurrencyLayer::TimeframeOptions.new()
 	
# We make the call to fetch the list of currencies
response = @client.timeframe(start_date, end_date, currencies options)
  
```
    
###### Response

```
{
  "success": true,
  "terms": "https://currencylayer.com/terms",
  "privacy": "https://currencylayer.com/privacy",
  "timeframe": true,
  "start_date": "2010-03-01",
  "end_date": "2010-04-01",
  "source": "USD",
  "quotes": {
    "2010-03-01": {
      "USDUSD": 1,
      "USDGBP": 0.668525,
      "USDEUR": 0.738541
    },
    "2010-03-02": {
      "USDUSD": 1,
      "USDGBP": 0.668827,
      "USDEUR": 0.736145
    },
    [...]
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