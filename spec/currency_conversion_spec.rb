require 'dotenv'
require 'spec_helper'
require 'currency_conversion'
require 'currency_conversion/live/live_options'
require 'currency_conversion/list/list_options'
require 'currency_conversion/historical/historical_options'
require 'currency_conversion/convert/convert_options'
require 'currency_conversion/timeframe/timeframe_options'


# Load Environment Variables
Dotenv.load


describe CurrencyLayer do

  it 'has a version number' do
    expect(CurrencyLayer::VERSION).not_to be nil
  end

  it 'live (simple, w. currencies as string)' do
    begin

      # Declare the Client instance passing in the authentication parameters
      @client = CurrencyLayer::Client.new(ENV['ACCESS_KEY'])

      # Set the currencies to fetch
      currencies = 'AUD,EUR,GBP,PLN'

      # We declare the options
      options = CurrencyLayer::LiveOptions.new()

      # We make the call to validate
      response = @client.live(currencies, options)

      # First we check the response
      expect(response).not_to be nil

      # We then check the number of results
      currencies_length = currencies.split(',').length
      quotes_length = response['quotes'].length
      expect(quotes_length).to eq(currencies_length)

    end
  end

  it 'live (simple, w. currencies as array)' do
    begin

      # Declare the Client instance passing in the authentication parameters
      @client = CurrencyLayer::Client.new(ENV['ACCESS_KEY'])

      # Set the currencies to fetch
      currencies = [
          'AUD',
          'EUR',
          'GBP',
          'PLN'
      ]

      # We declare the options
      options = CurrencyLayer::LiveOptions.new()

      # We make the call to validate
      response = @client.live(currencies, options)

      # First we check the response
      expect(response).not_to be nil

      # We then check the number of results
      currencies_length = currencies.length
      quotes_length = response['quotes'].length
      expect(quotes_length).to eq(currencies_length)

    end
  end

  it 'live (w. source)' do
    begin

      # Declare the Client instance passing in the authentication parameters
      @client = CurrencyLayer::Client.new(ENV['ACCESS_KEY'])

      # Set the currencies to fetch
      currencies = 'AUD,EUR,GBP,PLN'

      # Set the source of the conversion
      source = 'SGD'

      # We declare the options
      options = CurrencyLayer::LiveOptions.new()
      options.source = source

      # We make the call to validate
      response = @client.live(currencies, options)

      # First we check the response
      expect(response).not_to be nil

      # We then check the source
      expect(response['source']).to eq(source)

    end
  end

  it 'list' do

    # Declare the Client instance passing in the authentication parameters
    @client = CurrencyLayer::Client.new(ENV['ACCESS_KEY'])

    # We declare the options
    options = CurrencyLayer::ListOptions.new()

    # We make the call to validate
    response = @client.list(options)

    # First we check the response
    expect(response).not_to be nil

  end

  it 'historical' do
    begin

      # Declare the Client instance passing in the authentication parameters
      @client = CurrencyLayer::Client.new(ENV['ACCESS_KEY'])

      # Set the currencies to fetch
      date = '2005-02-01'

      # We declare the options
      options = CurrencyLayer::HistoricalOptions.new()

      # We make the get the historical rates
      response = @client.historical(date, options)

      # First we check the response
      expect(response).not_to be nil

    end
  end

  it 'convert' do

    # Declare the Client instance passing in the authentication parameters
    @client = CurrencyLayer::Client.new(ENV['ACCESS_KEY'])

    # Set the currencies to fetch
    from = 'SGD'
    to = 'THB'
    amount = '100'

    # We declare the options
    options = CurrencyLayer::ConvertOptions.new()

    # We make the call to validate
    response = @client.convert(from, to, amount, options)

    # First we check the response
    expect(response).not_to be nil

  end

  it 'timeframe' do

    # Declare the Client instance passing in the authentication parameters
    @client = CurrencyLayer::Client.new(ENV['ACCESS_KEY'])

    # Set the currencies to fetch
    start_date = '2010-03-01'
    end_date = '2010-04-01'
    currencies = 'USD,GBP,EUR'

    # We declare the options
    options = CurrencyLayer::TimeframeOptions.new()

    # We make the call to validate
    response = @client.timeframe(start_date, end_date, currencies, options)

    # First we check the response
    expect(response).not_to be nil

  end

  it 'change' do

    # Declare the Client instance passing in the authentication parameters
    @client = CurrencyLayer::Client.new(ENV['ACCESS_KEY'])

    # Set the currencies to fetch
    start_date = '2010-03-01'
    end_date = '2010-04-01'
    currencies = 'USD,GBP,EUR'

    # We declare the options
    options = CurrencyLayer::TimeframeOptions.new()

    # We make the call to validate
    response = @client.change(start_date, end_date, currencies, options)

    # First we check the response
    expect(response).not_to be nil

  end

end
