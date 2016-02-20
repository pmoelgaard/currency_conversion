module CurrencyLayer

  class ListOptions

    include Hashable

    attr_accessor :access_key

    def initialize()
      @query = nil
    end

  end

end
