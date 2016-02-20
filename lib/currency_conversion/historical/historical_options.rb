module CurrencyLayer

  class HistoricalOptions

    include Hashable

    attr_accessor :access_key

    attr_accessor :date

    def initialize()
      @query = nil
    end

  end

end
