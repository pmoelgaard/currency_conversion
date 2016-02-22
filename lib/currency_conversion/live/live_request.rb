require "hashable"

module CurrencyLayer

  class LiveRequest

    include Hashable

    attr_accessor :headers
    attr_accessor :query

    def initialize(query = {}, headers = {})

      self.headers = headers

      # Ruby passes by reference, so we can manipulate the object, and we check if the currencies is an array, and if so, we convert to string according to API
      query.currencies = query.currencies.kind_of?(String) ? query.currencies : query.currencies.join(',')

      self.query = query

    end

  end
end