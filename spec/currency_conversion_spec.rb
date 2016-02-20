require 'dotenv'
require 'spec_helper'
require 'currency_conversion'
require 'currency_conversion/live/live_options'
require 'currency_conversion/list/list_options'


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
    expect(nil).not_to be nil
  end

  it 'convert' do
    expect(nil).not_to be nil
  end

  it 'timeframe' do
    expect(nil).not_to be nil
  end

  it 'change' do
    expect(nil).not_to be nil
  end

end
