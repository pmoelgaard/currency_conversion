require "hashable"

module CurrencyLayer

  class TimeframeRequest

    include Hashable

    attr_accessor :query

    def initialize(query = {})

      self.query = query

    end

  end
end