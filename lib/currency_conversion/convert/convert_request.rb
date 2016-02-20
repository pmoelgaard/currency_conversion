require "hashable"

module CurrencyLayer

  class ConvertRequest

    include Hashable

    attr_accessor :query

    def initialize(query = {})

      self.query = query

    end

  end
end