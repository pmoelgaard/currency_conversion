require "httparty"
require "hashable"
require "currency_conversion/version"
require "currency_conversion/live/live_request"
require "currency_conversion/live/live_response"
require "currency_conversion/list/list_request"
require "currency_conversion/list/list_response"

module CurrencyLayer

  class Client

    include HTTParty

    base_uri 'apilayer.net/api'

    def initialize(access_key)

      if access_key.nil?
        raise CurrencyLayer::MissingArgumentException.new 'access_key'
      end

      @access_key = access_key

    end

    def live(currencies, options = {})

      if currencies.nil?
        raise CurrencyLayer::MissingArgumentException.new 'currencies'
        return
      end

      # Create a shallow copy so we don't manipulate the original reference
      q = options.dup

      # Populate the Query
      q.access_key = @access_key
      q.currencies = currencies

      # We then create the Request
      req = CurrencyLayer::LiveRequest.new(q)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/live', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        if (res[CurrencyLayer::LiveResponse::ERROR_EXPR])
          raise CurrencyLayer::LiveException.new res[CurrencyLayer::LiveResponse::ERROR_EXPR]
        end

        # We just return the parsed binary response
        return res.parsed_response

      rescue => e
        puts e.inspect
        return e

      end
    end

    def list(options = {})

      # Create a shallow copy so we don't manipulate the original reference
      q = options.dup

      # Populate the Query
      q.access_key = @access_key

      # We then create the Request
      req = CurrencyLayer::ListRequest.new(q)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/list', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        if (res[CurrencyLayer::ListResponse::ERROR_EXPR])
          raise CurrencyLayer::ListException.new res[CurrencyLayer::ListResponse::ERROR_EXPR]
        end

        # We just return the parsed binary response
        return res.parsed_response

      rescue => e
        puts e.inspect
        return e

      end
    end

  end
end
