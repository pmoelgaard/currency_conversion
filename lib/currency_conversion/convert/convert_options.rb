module CurrencyLayer

  class ConvertOptions

    include Hashable

    attr_accessor :access_key

    attr_accessor :from
    attr_accessor :to
    attr_accessor :amount

    def initialize()
      @query = nil
    end

  end

end
