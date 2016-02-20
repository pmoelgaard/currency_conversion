require "hashable"

module CurrencyLayer

  class ListRequest

    include Hashable

    attr_accessor :query

    def initialize(query = {})

      self.query = query

    end

  end
end