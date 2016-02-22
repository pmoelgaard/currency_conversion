require "httparty"
require "hashable"
require "currency_conversion/version"
require "currency_conversion/live/live_request"
require "currency_conversion/live/live_response"
require "currency_conversion/live/live_exception"
require "currency_conversion/list/list_request"
require "currency_conversion/list/list_response"
require "currency_conversion/list/list_exception"
require "currency_conversion/historical/historical_request"
require "currency_conversion/historical/historical_response"
require "currency_conversion/historical/historical_exception"
require "currency_conversion/convert/convert_request"
require "currency_conversion/convert/convert_response"
require "currency_conversion/convert/convert_exception"
require "currency_conversion/timeframe/timeframe_request"
require "currency_conversion/timeframe/timeframe_response"
require "currency_conversion/timeframe/timeframe_exception"
require "currency_conversion/change/change_request"
require "currency_conversion/change/change_response"
require "currency_conversion/change/change_exception"

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


    attr_accessor :live_last_response
    attr_accessor :live_last_response_headers

    def live(currencies, options = {}, headers = {})

      if currencies.nil?
        raise CurrencyLayer::MissingArgumentException.new 'currencies'
        return
      end

      # Create a shallow copy so we don't manipulate the original reference
      q = options.dup

      # Populate the Query
      q.access_key = @access_key
      q.currencies = currencies

      # Set the cache options
      if (self.live_last_response_headers)
        headers['If-None-Match'] = self.live_last_response_headers['etag']
        headers['If-Modified-Since'] = self.live_last_response_headers['date']
      end

      # We then create the Request
      req = CurrencyLayer::LiveRequest.new(q, headers)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/live', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        # We have struck a 304, and we just return the last_response
        if(res.nil? && ! self.live_last_response.nil?)
          return self.live_last_response
        end

        if (res[CurrencyLayer::LiveResponse::ERROR_EXPR])
          raise CurrencyLayer::LiveException.new res[CurrencyLayer::LiveResponse::ERROR_EXPR]
        end

        # To facilitate we set the cache arguments
        self.live_last_response = res.parsed_response
        self.live_last_response_headers = res.headers

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

    def historical(date, options = {})

      if date.nil?
        raise CurrencyLayer::MissingArgumentException.new 'date'
        return
      end

      # Create a shallow copy so we don't manipulate the original reference
      q = options.dup

      # Populate the Query
      q.access_key = @access_key
      q.date = date

      # We then create the Request
      req = CurrencyLayer::HistoricalRequest.new(q)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/historical', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        if (res[CurrencyLayer::HistoricalResponse::ERROR_EXPR])
          raise CurrencyLayer::HistoricalException.new res[CurrencyLayer::HistoricalResponse::ERROR_EXPR]
        end

        # We just return the parsed binary response
        return res.parsed_response

      rescue => e
        puts e.inspect
        return e

      end
    end

    def convert(from, to, amount, options = {})

      if from.nil?
        raise CurrencyLayer::MissingArgumentException.new 'from'
        return
      end

      if to.nil?
        raise CurrencyLayer::MissingArgumentException.new 'to'
        return
      end

      if amount.nil?
        raise CurrencyLayer::MissingArgumentException.new 'amount'
        return
      end

      # Create a shallow copy so we don't manipulate the original reference
      q = options.dup

      # Populate the Query
      q.access_key = @access_key
      q.from = from
      q.to = to
      q.amount = amount

      # We then create the Request
      req = CurrencyLayer::ConvertRequest.new(q)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/convert', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        if (res[CurrencyLayer::ConvertResponse::ERROR_EXPR])
          raise CurrencyLayer::ConvertException.new res[CurrencyLayer::ConvertResponse::ERROR_EXPR]
        end

        # We just return the parsed binary response
        return res.parsed_response

      rescue => e
        puts e.inspect
        return e

      end
    end

    def timeframe(start_date, end_date, currencies, options = {})

      if start_date.nil?
        raise CurrencyLayer::MissingArgumentException.new 'start_date'
        return
      end

      if end_date.nil?
        raise CurrencyLayer::MissingArgumentException.new 'end_date'
        return
      end

      if currencies.nil?
        raise CurrencyLayer::MissingArgumentException.new 'currencies'
        return
      end

      # Create a shallow copy so we don't manipulate the original reference
      q = options.dup

      # Populate the Query
      q.access_key = @access_key
      q.start_date = start_date
      q.end_date = end_date
      q.currencies = currencies

      # We then create the Request
      req = CurrencyLayer::TimeframeRequest.new(q)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/timeframe', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        if (res[CurrencyLayer::TimeframeResponse::ERROR_EXPR])
          raise CurrencyLayer::TimeframeException.new res[CurrencyLayer::TimeframeResponse::ERROR_EXPR]
        end

        # We just return the parsed binary response
        return res.parsed_response

      rescue => e
        puts e.inspect
        return e

      end
    end

    def change(start_date, end_date, currencies, options = {})

      if start_date.nil?
        raise CurrencyLayer::MissingArgumentException.new 'start_date'
        return
      end

      if end_date.nil?
        raise CurrencyLayer::MissingArgumentException.new 'end_date'
        return
      end

      if currencies.nil?
        raise CurrencyLayer::MissingArgumentException.new 'currencies'
        return
      end

      # Create a shallow copy so we don't manipulate the original reference
      q = options.dup

      # Populate the Query
      q.access_key = @access_key
      q.start_date = start_date
      q.end_date = end_date
      q.currencies = currencies

      # We then create the Request
      req = CurrencyLayer::ChangeRequest.new(q)

      #  We create a Hash of the request so we can send it via HTTP
      req_dto = req.to_dh

      begin

        # We make the actual request
        res = self.class.get('/change', req_dto)

        # We ensure that we tap the response so we can use the results
        res.inspect

        if (res[CurrencyLayer::ChangeResponse::ERROR_EXPR])
          raise CurrencyLayer::ChangeException.new res[CurrencyLayer::ChangeResponse::ERROR_EXPR]
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
