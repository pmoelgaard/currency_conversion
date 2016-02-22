require 'dotenv'
require 'currency_conversion'
require 'currency_conversion/live/live_options'

# Load Environment Variables
Dotenv.load

begin

  # Declare the Client instance passing in the authentication parameters
  @client = CurrencyLayer::Client.new(ENV['ACCESS_KEY'])

  # Set the currencies to fetch
  currencies = 'AUD,EUR,GBP,PLN'

  # We declare the options
  options = CurrencyLayer::LiveOptions.new()

  while true

    # We make the call to fetch the live currencies
    response = @client.live(currencies, options)

    # If its a success, we print a message to the user
    if !response.nil?
      puts 'SUCCESS : Live Currencies Fetched...' << response.to_s
    end

    sleep 5

  end

rescue => e
  puts e.inspect

end
