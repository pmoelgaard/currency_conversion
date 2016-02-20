require 'dotenv'
require 'currency_conversion'
require 'currency_conversion/list/list_options'

# Load Environment Variables
Dotenv.load

begin

  # Declare the Client instance passing in the authentication parameters
  @client = CurrencyLayer::Client.new(ENV['ACCESS_KEY'])

  # We declare the options
  options = CurrencyLayer::ListOptions.new()

  # We make the call to fetch the list of currencies
  response = @client.list(options)

  # If its a success, we print a message to the user
  if !response.nil?
    puts 'SUCCESS : List of Currencies Fetched...' << response.to_s
  end

rescue => e
  puts e.inspect

end
