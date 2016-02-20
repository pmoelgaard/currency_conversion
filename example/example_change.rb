require 'dotenv'
require 'currency_conversion'
require 'currency_conversion/timeframe/timeframe_options'

# Load Environment Variables
Dotenv.load

begin

  # Declare the Client instance passing in the authentication parameters
  @client = CurrencyLayer::Client.new(ENV['ACCESS_KEY'])

  # Set the arguments
  start_date = '2010-03-01'
  end_date = '2010-04-01'
  currencies = 'USD,GBP,EUR'

  # We declare the options
  options = CurrencyLayer::TimeframeOptions.new()

  # We make the call to fetch the live currencies
  response = @client.timeframe(start_date, end_date, currencies, options)

  # If its a success, we print a message to the user
  if !response.nil?
    puts 'SUCCESS : Timeframe Fetched...' << response.to_s
  end

rescue => e
  puts e.inspect

end
