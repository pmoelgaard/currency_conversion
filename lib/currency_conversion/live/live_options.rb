module CurrencyLayer

  class LiveOptions

    include Hashable

    attr_accessor :access_key

    attr_accessor :currencies
    attr_accessor :source

    def initialize()
      @query = nil
    end

  end

end
